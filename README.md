# 驾校预约学习系统

本仓库的主项目是 `jiaxiaoyuyuexuexixitong`，技术栈为 Spring Boot + MyBatis + Vue.js + MySQL。

## 项目结构

- `jiaxiaoyuyuexuexixitong/`：主后端工程与前端静态资源
- `db.sql`：数据库初始化脚本
- `pom.xml`：根目录示例工程，与本系统主工程无关

## 运行环境

- JDK 8
- Maven 3.6+
- MySQL 5.7 或 8.x

## 启动步骤

1. 在 MySQL 中创建数据库 `jiaxiaoyuyuexuexixitong`
2. 导入根目录下的 `db.sql`
3. 按需修改 `jiaxiaoyuyuexuexixitong/src/main/resources/application.yml` 中的数据库连接信息
4. 在仓库根目录执行：

```bash
mvn -f jiaxiaoyuyuexuexixitong/pom.xml spring-boot:run
```

应用默认启动地址：

- `http://localhost:8080/jiaxiaoyuyuexuexixitong`

## 说明

- `jiaxiaoyuyuexuexixitong/target/` 为编译产物，不应提交到 Git
- 根目录的文档、压缩包、数据库脚本是否保留在仓库中，取决于你的论文提交和演示需要