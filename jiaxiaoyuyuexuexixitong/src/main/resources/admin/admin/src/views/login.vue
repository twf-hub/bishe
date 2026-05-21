<template>
    <div>
        <div class="container loginIn">

            <div :class="2 == 1 ? 'left' : 2 == 2 ? 'left center' : 'left right'">
                <el-form class="login-form" label-position="left" :label-width="1 == 3 || 1 == 2 ? '30px': '0px'">
                    <div class="title-container"><h3 class="title">驾校预约学习系统登录</h3></div>
                    <el-form-item :style='{"padding":"0","boxShadow":"none","margin":"0 auto 16px","borderColor":"transparent","backgroundColor":"transparent","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}' :label="1 == 3 ? '用户名' : ''" :class="'style'+1">
            <span v-if="1 != 3" class="svg-container" style="
			color:#999;
			line-height:40px;
			font-size:14px;
			width:30px;
			padding:0 0 0 10px;
			margin:0;
			radius:0;
			border-width:0;
			border-style:solid;
			border-color:transparent;
			background-color:transparent;
			box-shadow:none;
			position:absolute;left:0;top:0;z-index:1;
			}"><svg-icon icon-class="user" /></span>
                        <el-input placeholder="请输入用户名" name="username" type="text" v-model="rulesForm.username" />
                    </el-form-item>
                    <el-form-item :style='{"padding":"0","boxShadow":"none","margin":"0 auto 16px","borderColor":"transparent","backgroundColor":"transparent","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}' :label="1 == 3 ? '密码' : ''" :class="'style'+1">
            <span v-if="1 != 3" class="svg-container" style="color:#999;
			line-height:40px;
			font-size:14px;
			width:30px;
			padding:0 0 0 10px;
			margin:0;
			radius:0;
			border-width:0;
			border-style:solid;
			border-color:transparent;
			background-color:transparent;
			box-shadow:none;
			position:absolute;left:0;top:0;z-index:1;"><svg-icon icon-class="password" /></span>
                        <el-input placeholder="请输入密码" name="password" type="password" v-model="rulesForm.password" />
                    </el-form-item>
                    <el-form-item v-if="roleOptions.length>1" label="角色" prop="loginInRole" class="role" style="display: flex;align-items: center;">
                        <el-radio
                                @change="menuChange"
                                v-for="item in roleOptions"
                                v-bind:key="item.value"
                                v-model="rulesForm.role"
                                :label="item.value"
                        >{{item.key}}</el-radio>
                    </el-form-item>
                    <el-button type="primary" @click="login()" class="loginInBt">{{'1' == '1' ? '登录' : 'login'}}</el-button>          <el-form-item class="setting">
            <div class="register" @click="register('yonghu')">用户注册</div>
            <div class="register" @click="register('jiaolian')">教练注册</div>
          </el-form-item>
        </el-form>
      </div>
<!--
                    <el-form-item class="code" :label="3 == 3 ? '验证码' : ''" :class="'style'+3">
                        <span class="svg-container" style="color:rgba(136, 154, 164, 1);line-height:46px"><svg-icon icon-class="code" /></span>
                        <el-input placeholder="请输入验证码" name="code" type="text" v-model="rulesForm.code" />
                        <div class="getCodeBt" @click="getRandCode(4)" style="height:46px;line-height:46px">
                            <span v-for="(item, index) in codes" :key="index" :style="{color:item.color,transform:item.rotate,fontSize:item.size}">{{ item.num }}</span>
                        </div>
                    </el-form-item>

-->

    </div>
  </div>
</template>
<script>

    import menu from "@/utils/menu";

    export default {
        data() {
            return {
                rulesForm: {
                    username: "",
                    password: "",
                    role: "",
                    code: '',
                },
                menus: [],
                roleOptions: [],
                tableName: "",
                codes: [{
                    num: 1,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                },{
                    num: 2,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                },{
                    num: 3,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                },{
                    num: 4,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                }],
            };
        },
        mounted() {
            let menus = menu.list();
            this.menus = menus;
            for (let i = 0; i < this.menus.length; i++) {
                if (this.menus[i].hasBackLogin=='是') {
                    let menuItem={};
                    menuItem["key"]=this.menus[i].roleName;
                    menuItem["value"]=this.menus[i].tableName;
                    this.roleOptions.push(menuItem);
                }
            }
        },
        created() {
            this.getRandCode()

        },
        methods: {
            menuChange(role){
            },
            register(tableName){
                this.$storage.set("loginTable", tableName);
                this.$router.push({path:'/register'})
            },
            // 登陆
            login() {
                let code = ''
                for(let i in this.codes) {
                    code += this.codes[i].num
                }
                if ('0' == '1' && !this.rulesForm.code) {
                    this.$message.error("请输入验证码");
                    return;
                }
                if ('0' == '1' && this.rulesForm.code.toLowerCase() != code.toLowerCase()) {
                    this.$message.error("验证码输入有误");
                    this.getRandCode()
                    return;
                }
                if (!this.rulesForm.username) {
                    this.$message.error("请输入用户名");
                    return;
                }
                if (!this.rulesForm.password) {
                    this.$message.error("请输入密码");
                    return;
                }
                if(this.roleOptions.length>1) {
                    console.log("1")
                    if (!this.rulesForm.role) {
                        this.$message.error("请选择角色");
                        return;
                    }
                    let menus = this.menus;
                    for (let i = 0; i < menus.length; i++) {
                        if (menus[i].tableName == this.rulesForm.role) {
                            this.tableName = menus[i].tableName;
                            this.rulesForm.role = menus[i].roleName;
                        }
                    }
                } else {
                    this.tableName = this.roleOptions[0].value;
                    this.rulesForm.role = this.roleOptions[0].key;
                }
                this.$http({
                    url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
                    method: "post"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        this.$storage.set("Token", data.token);
                        this.$storage.set("userId", data.userId);
                        this.$storage.set("role", this.rulesForm.role);
                        this.$storage.set("sessionTable", this.tableName);
                        this.$storage.set("adminName", this.rulesForm.username);
                        this.$router.replace({ path: "/index/" });
                    } else {
                        this.$message.error(data.msg);
                    }
                });
            },
            getRandCode(len = 4){
                this.randomString(len)
            },
            randomString(len = 4) {
                let chars = [
                    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
                    "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                    "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
                    "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                    "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
                    "2", "4", "5", "6", "7", "8", "9"
                ]
                let colors = ["0", "1", "2","2", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
                let sizes = ['14', '15', '16', '17', '18']

                let output = [];
                for (let i = 0; i < len; i++) {
                    // 随机验证码
                    let key = Math.floor(Math.random()*chars.length)
                    this.codes[i].num = chars[key]
                    // 随机验证码颜色
                    let code = '#'
                    for (let j = 0; j < 6; j++) {
                        let key = Math.floor(Math.random()*colors.length)
                        code += colors[key]
                    }
                    this.codes[i].color = code
                    // 随机验证码方向
                    let rotate = Math.floor(Math.random()*60)
                    let plus = Math.floor(Math.random()*2)
                    if(plus == 1) rotate = '-'+rotate
                    this.codes[i].rotate = 'rotate('+rotate+'deg)'
                    // 随机验证码字体大小
                    let size = Math.floor(Math.random()*sizes.length)
                    this.codes[i].size = sizes[size]+'px'
                }
            },
        }
    };
</script>
<style lang="scss" scoped>
    .loginIn {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 32px 16px;
        box-sizing: border-box;
        background:
            radial-gradient(circle at top left, rgba(91, 177, 255, 0.18), transparent 34%),
            radial-gradient(circle at bottom right, rgba(44, 123, 229, 0.14), transparent 30%),
            linear-gradient(135deg, #eaf4ff 0%, #f9fcff 50%, #edf6ff 100%);
    }

    .left {
        position: relative;
        left: auto;
        top: auto;
        right: auto;
        transform: none;
        width: 100%;
        max-width: 440px;
        margin: 0 auto;
        padding: 36px 34px 28px;
        box-sizing: border-box;
        border: 1px solid rgba(120, 170, 220, 0.22);
        border-radius: 24px;
        background: rgba(255, 255, 255, 0.96);
        box-shadow: 0 24px 60px rgba(56, 114, 192, 0.16);
        backdrop-filter: blur(8px);
    }

    .center,
    .right {
        position: static;
        left: auto;
        top: auto;
        right: auto;
        transform: none;
    }

    .login-form {
        display: flex;
        flex-direction: column;
        width: 100%;
        padding: 0;
        background: transparent;
        box-sizing: border-box;
    }

    .title-container {
        margin-bottom: 28px;
        text-align: center;
    }

    .title {
        margin: 0;
        color: #183b66;
        font-size: 34px;
        line-height: 1.2;
        font-weight: 700;
    }

    .el-form-item {
        position: relative;
        margin-bottom: 18px;
    }

    .el-form-item /deep/ .el-form-item__content {
        line-height: normal;
    }

    .svg-container {
        position: absolute;
        left: 0;
        top: 0;
        z-index: 1;
        width: 42px !important;
        padding: 0 !important;
        margin: 0 !important;
        color: #8ba1bc !important;
        font-size: 16px !important;
        line-height: 48px !important;
        text-align: center;
    }

    .el-input {
        display: inline-block;
        width: 100%;
    }

    .el-input /deep/ input {
        width: 100%;
        height: 48px;
        line-height: 48px;
        padding: 0 16px 0 42px;
        color: #183b66;
        font-size: 14px;
        border: 1px solid #dbe7f3;
        border-radius: 14px;
        background: #f8fbff;
        box-shadow: none;
        transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
    }

    .el-input /deep/ input:focus {
        border-color: #4d90f6;
        background: #fff;
        box-shadow: 0 0 0 4px rgba(77, 144, 246, 0.12);
    }

    .el-input /deep/ input::placeholder {
        color: #90a4be;
    }

    .role {
        display: block !important;
        margin-bottom: 22px;
    }

    .role /deep/ .el-form-item__label {
        float: none;
        width: auto !important;
        padding: 0 0 12px;
        line-height: 1.2;
        color: #6f86a2;
        font-size: 14px;
        text-align: left;
    }

    .role /deep/ .el-form-item__content {
        margin-left: 0 !important;
        line-height: 1.5;
    }

    .role /deep/ .el-radio {
        margin-right: 18px;
        margin-bottom: 6px;
    }

    .role /deep/ .el-radio__label {
        padding-left: 10px;
        color: #48627f;
    }

    .role /deep/ .el-radio.is-checked .el-radio__label {
        color: #1e4f93;
        font-weight: 600;
    }

    .role /deep/ .el-radio__inner {
        border-color: #aac4e4;
    }

    .role /deep/ .el-radio__inner::after {
        width: 6px;
        height: 6px;
    }

    .role /deep/ .el-radio__input.is-checked .el-radio__inner {
        border-color: #4d90f6;
        background: #4d90f6;
    }

    .loginInBt {
        width: 100%;
        height: 50px;
        margin-top: 4px;
        padding: 0;
        color: #fff;
        font-size: 16px;
        font-weight: 600;
        border: none;
        border-radius: 14px;
        background: linear-gradient(135deg, #4f9eff 0%, #2f65d9 100%);
        box-shadow: 0 16px 30px rgba(60, 122, 219, 0.26);
    }

    .loginInBt:hover,
    .loginInBt:focus {
        background: linear-gradient(135deg, #448feb 0%, #2757bf 100%);
    }

    .setting {
        margin: 18px 0 0;
    }

    .setting /deep/ .el-form-item__content {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 24px;
        margin-left: 0 !important;
        line-height: 1.5;
        flex-wrap: wrap;
    }

    .register {
        font-size: 14px;
        color: #2f65d9;
        cursor: pointer;
        transition: color 0.2s ease;
    }

    .register:hover {
        color: #173f8f;
    }

    .reset {
        color: #2f65d9;
    }

    @media (max-width: 600px) {
        .loginIn {
            padding: 20px 12px;
        }

        .left {
            padding: 28px 20px 24px;
            border-radius: 20px;
        }

        .title {
            font-size: 28px;
        }

        .setting /deep/ .el-form-item__content {
            gap: 12px 18px;
        }
    }
</style>
