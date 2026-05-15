<template>
  <div>
    <!--
      通用图片上传组件
      - 后端接口：FileController#upload，返回 { code:0, file: "xxxx.jpg" }
      - 父组件通过 :fileUrls 传入已保存的相对路径（如 "upload/xxx.jpg" 或 多个用 , 拼接）
      - 上传成功 / 删除时通过 @change 将「相对路径数组（逗号拼接）」回传给父组件
      - 管理员、教练、学员都使用同一个组件
    -->
    <el-upload
      ref="upload"
      :action="getActionUrl"
      list-type="picture-card"
      :multiple="multiple"
      :limit="limit"
      :headers="myHeaders"
      :file-list="fileList"
      :auto-upload="true"
      :on-exceed="handleExceed"
      :on-preview="handleUploadPreview"
      :on-remove="handleRemove"
      :on-success="handleUploadSuccess"
      :on-error="handleUploadErr"
      :before-upload="handleBeforeUpload"
    >
      <i class="el-icon-plus"></i>
      <div slot="tip" class="el-upload__tip" style="color:#838fa1;">{{tip}}</div>
    </el-upload>
    <el-dialog :visible.sync="dialogVisible" size="tiny" append-to-body>
      <img width="100%" :src="dialogImageUrl" alt>
    </el-dialog>
  </div>
</template>
<script>
import storage from "@/utils/storage";
import base from "@/utils/base";
export default {
  data() {
    return {
      dialogVisible: false,
      dialogImageUrl: "",
      // el-upload 用的文件列表（url 是「完整可访问 URL」，仅用于显示）
      fileList: [],
      // 真正回传给父组件的「相对路径」列表，形如 ["upload/xxx.jpg", ...]
      fileUrlList: [],
      myHeaders: {}
    };
  },
  props: ["tip", "action", "limit", "multiple", "fileUrls"],
  mounted() {
    this.init();
    this.myHeaders = {
      'Token': storage.get("Token")
    };
  },
  watch: {
    fileUrls: function(val, oldVal) {
      this.init();
    }
  },
  computed: {
    // 上传接口 URL：/jiaxiaoyuyuexuexixitong/file/upload
    getActionUrl: function() {
      return `/${this.$base.name}/` + this.action;
    }
  },
  methods: {
    /**
     * 从字符串中提取「相对路径」部分，丢掉前面的域名 / context-path
     * 兼容三种历史格式：
     *   1. "upload/xxx.jpg"
     *   2. "/upload/xxx.jpg"
     *   3. "http://host:port/jiaxiaoyuyuexuexixitong/upload/xxx.jpg"
     */
    toRelativePath(url) {
      if (!url) return "";
      var u = url.split("?")[0];
      var idx = u.indexOf("upload/");
      if (idx >= 0) {
        return u.substring(idx); // 形如 "upload/xxx.jpg"
      }
      // 兜底：移除前导 /
      return u.replace(/^\/+/, "");
    },

    // 把相对路径拼成可显示的完整 URL
    toDisplayUrl(relPath) {
      if (!relPath) return "";
      if (/^https?:\/\//i.test(relPath)) return relPath;
      // 确保不会出现双斜杠
      var prefix = base.url.endsWith("/") ? base.url : base.url + "/";
      return prefix + relPath.replace(/^\/+/, "");
    },

    init() {
      // 父组件可能传过来：原始相对路径串，或 base.url 拼好的字符串
      // 统一拆分 & 还原为相对路径
      if (this.fileUrls) {
        // 先把可能包含的 base.url 前缀去掉
        var raw = this.fileUrls;
        if (base && base.url) {
          // 把 "http://...jiaxiaoyuyuexuexixitong/" 这一段去掉
          raw = raw.split(base.url).join("");
        }
        var relList = raw.split(",")
          .map(item => this.toRelativePath(item))
          .filter(item => item && item.length > 0);

        var fileArray = relList.map((item, index) => ({
          name: String(index),
          url: this.toDisplayUrl(item),
          relativeUrl: item
        }));
        this.fileList = fileArray;
        this.fileUrlList = relList;
      } else {
        this.fileList = [];
        this.fileUrlList = [];
      }
    },

    // 上传前校验：仅图片、不超过 20MB
    handleBeforeUpload(file) {
      var isImage = /^image\//i.test(file.type) || /\.(jpe?g|png|gif|bmp|webp)$/i.test(file.name);
      if (!isImage) {
        this.$message.error("只能上传图片文件 (jpg/png/gif/bmp/webp)");
        return false;
      }
      var isLt20M = file.size / 1024 / 1024 < 20;
      if (!isLt20M) {
        this.$message.error("上传图片大小不能超过 20MB");
        return false;
      }
      return true;
    },

    // 上传成功
    handleUploadSuccess(res, file, fileList) {
      if (res && res.code === 0) {
        // 后端返回的纯文件名，组装为相对路径 "upload/xxx.jpg"
        var relPath = "upload/" + res.file;
        // 把刚上传成功的这条记录的 url 改为可显示的完整 URL
        // file.url 此时是浏览器临时 blob 地址，替换之
        var last = fileList[fileList.length - 1];
        last.url = this.toDisplayUrl(relPath);
        last.relativeUrl = relPath;

        this.refreshFromFileList(fileList);
        this.$emit("change", this.fileUrlList.join(","));
      } else {
        this.$message.error(res && res.msg ? res.msg : "上传失败");
        // 上传失败时移除该条
        var idx = fileList.indexOf(file);
        if (idx >= 0) fileList.splice(idx, 1);
        this.fileList = fileList.slice();
      }
    },

    handleUploadErr(err, file, fileList) {
      this.$message.error("文件上传失败");
    },

    handleRemove(file, fileList) {
      this.refreshFromFileList(fileList);
      this.$emit("change", this.fileUrlList.join(","));
    },

    handleUploadPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },

    handleExceed(files, fileList) {
      this.$message.warning(`最多上传${this.limit}张图片`);
    },

    /**
     * 根据 el-upload 当前的 fileList 重新算出：
     *  - fileList（用于显示，含完整 URL）
     *  - fileUrlList（用于回传父组件，仅相对路径）
     */
    refreshFromFileList(fileList) {
      var displayArr = [];
      var relArr = [];
      var self = this;
      fileList.forEach(function(item, index) {
        var rel = item.relativeUrl || self.toRelativePath(item.url);
        var displayUrl = /^https?:\/\//i.test(item.url) ? item.url : self.toDisplayUrl(rel);
        displayArr.push({
          name: item.name || String(index),
          url: displayUrl,
          relativeUrl: rel
        });
        if (rel) relArr.push(rel);
      });
      this.fileList = displayArr;
      this.fileUrlList = relArr;
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
