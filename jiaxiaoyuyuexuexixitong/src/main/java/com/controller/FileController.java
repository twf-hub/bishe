package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.ConfigEntity;
import com.entity.EIException;
import com.service.ConfigService;
import com.utils.R;

/**
 * 上传文件映射表
 * 改造说明：
 * 1. 上传目录优先使用项目根目录下的 upload/，便于热部署 / JAR 部署后图片仍可写入与读取；
 *    若失败再退回 classpath:/static/upload/。
 * 2. 文件名使用「时间戳 + 8 位 UUID + 后缀」，避免高并发或同一秒多次上传导致覆盖。
 * 3. 接口对管理员、教练、学员（用户）全部公开（AuthorizationInterceptor 已直接放行 /file/upload），
 *    保证三种角色都能自主上传图片。
 */
@RestController
@RequestMapping("file")
@SuppressWarnings({"unchecked","rawtypes"})
public class FileController{
	@Autowired
    private ConfigService configService;

	/**
	 * 获取上传目录（优先项目根目录下的 upload/，便于持久化保存）
	 */
	private File getUploadDir() throws IOException {
		// 1. 优先：项目运行目录 / 部署目录下的 upload/
		File baseDir = new File(System.getProperty("user.dir"), "upload");
		if(baseDir.exists() || baseDir.mkdirs()) {
			if(baseDir.canWrite()) {
				return baseDir;
			}
		}
		// 2. 退回：classpath:/static/upload/
		File path;
		try {
			path = new File(ResourceUtils.getURL("classpath:static").getPath());
		} catch (Exception e) {
			path = new File("");
		}
		if(!path.exists()) {
			path = new File("");
		}
		File fallback = new File(path.getAbsolutePath(), "/upload/");
		if(!fallback.exists()) {
			fallback.mkdirs();
		}
		return fallback;
	}

	/**
	 * 上传文件
	 * 任何角色（管理员 / 教练 / 学员）都可以调用本接口上传图片。
	 */
	@IgnoreAuth
	@RequestMapping("/upload")
	public R upload(@RequestParam("file") MultipartFile file, String type) throws Exception {
		if (file == null || file.isEmpty()) {
			throw new EIException("上传文件不能为空");
		}
		String originalFilename = file.getOriginalFilename();
		if(StringUtils.isBlank(originalFilename) || !originalFilename.contains(".")) {
			throw new EIException("上传文件格式不正确");
		}
		String fileExt = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();

		File upload = getUploadDir();

		// 文件名：时间戳 + 短 UUID + 后缀，避免重名覆盖
		String fileName = new Date().getTime()
				+ "_" + UUID.randomUUID().toString().replace("-", "").substring(0, 8)
				+ "." + fileExt;

		File dest = new File(upload.getAbsolutePath() + File.separator + fileName);
		file.transferTo(dest);

		// 人脸识别样本图保存
		if(StringUtils.isNotBlank(type) && type.equals("1")) {
			ConfigEntity configEntity = configService.selectOne(new EntityWrapper<ConfigEntity>().eq("name", "faceFile"));
			if(configEntity == null) {
				configEntity = new ConfigEntity();
				configEntity.setName("faceFile");
				configEntity.setValue(fileName);
			} else {
				configEntity.setValue(fileName);
			}
			configService.insertOrUpdate(configEntity);
		}
		return R.ok().put("file", fileName);
	}

	/**
	 * 下载 / 读取文件
	 * 不需要鉴权，前端 <img src> 可直接访问。
	 */
	@IgnoreAuth
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(@RequestParam String fileName) {
		try {
			File upload = getUploadDir();
			File file = new File(upload.getAbsolutePath() + File.separator + fileName);
			if(!file.exists()) {
				// 兼容旧数据：再去 classpath:/static/upload/ 找一次
				try {
					File legacy = new File(
							new File(ResourceUtils.getURL("classpath:static").getPath()).getAbsolutePath()
									+ "/upload/" + fileName);
					if(legacy.exists()) {
						file = legacy;
					}
				} catch (Exception ignore) {}
			}
			if(file.exists()){
				HttpHeaders headers = new HttpHeaders();
			    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			    headers.setContentDispositionFormData("attachment", fileName);
			    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
