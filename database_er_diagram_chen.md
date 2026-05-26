# 驾校预约学习系统 — E-R 图（陈氏表示法）

采用经典 **Chen Notation**：
- **矩形**：实体（Entity）
- **椭圆**：属性（Attribute）
- **菱形**：联系（Relationship）
- 连线上的 **1 / N / M**：表示基数关系

---

## 一、系统总体 E-R 图

```mermaid
flowchart TD
    %% ───── 实体 ─────
    USER[学员]
    COACH[教练]
    ADMIN[管理员]
    MATERIAL[学习资料]
    PAPER[试卷]
    QUESTION[试题]
    NOTICE[公告]
    MSG[留言板]

    %% ───── 联系 ─────
    R1{预约}
    R2{收藏}
    R3{评论}
    R4{组题}
    R5{参加考试}
    R6{产生错题}
    R7{发布}
    R8{留言}

    %% ───── 关系连接 ─────
    USER ---|N| R1 ---|N| COACH
    USER ---|N| R2 ---|N| MATERIAL
    USER ---|N| R3 ---|N| MATERIAL
    PAPER ---|N| R4 ---|N| QUESTION
    USER ---|N| R5 ---|N| PAPER
    USER ---|N| R6 ---|N| QUESTION
    ADMIN ---|1| R7 ---|N| NOTICE
    USER ---|N| R8 ---|1| ADMIN

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    classDef relation fill:#fff,stroke:#333,stroke-width:1.5px,color:#000;
    class USER,COACH,ADMIN,MATERIAL,PAPER,QUESTION,NOTICE,MSG entity;
    class R1,R2,R3,R4,R5,R6,R7,R8 relation;
```

---

## 二、学员实体 E-R 图

```mermaid
flowchart TD
    A1((学号 id))
    A2((登录账号))
    A3((密码))
    A4((真实姓名))
    A5((手机号码))
    A6((身份证号))
    A7((性别))
    A8((电子邮箱))
    A9((头像))
    A10((注册时间))

    USER[学员]

    A1 --- USER
    A2 --- USER
    A3 --- USER
    A4 --- USER
    A5 --- USER
    USER --- A6
    USER --- A7
    USER --- A8
    USER --- A9
    USER --- A10

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    class USER entity;
```

---

## 三、教练实体 E-R 图

```mermaid
flowchart TD
    B1((教练编号))
    B2((登录账号))
    B3((密码))
    B4((教练姓名))
    B5((手机号码))
    B6((身份证号))
    B7((性别))
    B8((电子邮箱))
    B9((头像))
    B10((入职时间))

    COACH[教练]

    B1 --- COACH
    B2 --- COACH
    B3 --- COACH
    B4 --- COACH
    B5 --- COACH
    COACH --- B6
    COACH --- B7
    COACH --- B8
    COACH --- B9
    COACH --- B10

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    class COACH entity;
```

---

## 四、教练预约 E-R 图（学员—预约—教练）

```mermaid
flowchart TD
    %% 学员属性
    U1((学号))
    U2((姓名))
    U3((手机))

    %% 教练属性
    C1((教练编号))
    C2((姓名))
    C3((手机))

    %% 预约属性
    R1((报名编号))
    R2((申请说明))
    R3((提交时间))
    R4((审核状态))
    R5((审核意见))
    R6((约定上课时间))

    USER[学员]
    BOOK{预约}
    COACH[教练]

    U1 --- USER
    U2 --- USER
    U3 --- USER

    USER ---|N| BOOK
    BOOK ---|1| COACH

    C1 --- COACH
    C2 --- COACH
    C3 --- COACH

    BOOK --- R1
    BOOK --- R2
    BOOK --- R3
    BOOK --- R4
    BOOK --- R5
    BOOK --- R6

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    classDef relation fill:#fff,stroke:#333,stroke-width:1.5px,color:#000;
    class USER,COACH entity;
    class BOOK relation;
```

---

## 五、学习资料 E-R 图（学员—收藏/评论—资料）

```mermaid
flowchart TD
    %% 学员
    U1((学号))
    U2((姓名))

    %% 资料属性
    M1((资料编号))
    M2((资料名称))
    M3((资料分类))
    M4((封面图片))
    M5((视频地址))
    M6((附件地址))
    M7((点赞数))
    M8((踩数))

    %% 联系
    R1{收藏}
    R2{评论}

    USER[学员]
    MATERIAL[学习资料]

    U1 --- USER
    U2 --- USER

    USER ---|N| R1
    R1 ---|N| MATERIAL
    USER ---|N| R2
    R2 ---|N| MATERIAL

    MATERIAL --- M1
    MATERIAL --- M2
    MATERIAL --- M3
    MATERIAL --- M4
    MATERIAL --- M5
    MATERIAL --- M6
    MATERIAL --- M7
    MATERIAL --- M8

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    classDef relation fill:#fff,stroke:#333,stroke-width:1.5px,color:#000;
    class USER,MATERIAL entity;
    class R1,R2 relation;
```

---

## 六、在线考试 E-R 图（学员—试卷—试题）

```mermaid
flowchart TD
    %% 实体
    USER[学员]
    PAPER[试卷]
    QUESTION[试题]
    RECORD[考试记录]
    WRONG[错题本]

    %% 联系
    R1{组题}
    R2{参加}
    R3{产生}

    %% 试卷属性
    P1((试卷名称))
    P2((所属科目))
    P3((考试时长))
    P4((试卷总分))

    %% 试题属性
    Q1((题干))
    Q2((选项))
    Q3((答案))
    Q4((解析))
    Q5((题型))

    %% 考试记录属性
    RC1((流水号))
    RC2((所得分数))
    RC3((考试时间))

    %% 错题属性
    W1((错误答案))
    W2((记录时间))

    %% 连接
    PAPER ---|1| R1 ---|N| QUESTION
    USER ---|N| R2 ---|N| PAPER
    R2 --- RECORD
    USER ---|N| R3 ---|N| QUESTION
    R3 --- WRONG

    PAPER --- P1
    PAPER --- P2
    PAPER --- P3
    PAPER --- P4

    QUESTION --- Q1
    QUESTION --- Q2
    QUESTION --- Q3
    QUESTION --- Q4
    QUESTION --- Q5

    RECORD --- RC1
    RECORD --- RC2
    RECORD --- RC3

    WRONG --- W1
    WRONG --- W2

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    classDef relation fill:#fff,stroke:#333,stroke-width:1.5px,color:#000;
    class USER,PAPER,QUESTION,RECORD,WRONG entity;
    class R1,R2,R3 relation;
```

---

## 七、公告与留言板 E-R 图

```mermaid
flowchart TD
    %% 实体
    ADMIN[管理员]
    NOTICE[公告]
    MSG[留言]
    USER[学员]

    %% 联系
    R1{发布}
    R2{提交}
    R3{回复}

    %% 公告属性
    N1((标题))
    N2((正文))
    N3((配图))
    N4((类别))
    N5((发布时间))

    %% 留言属性
    M1((留言标题))
    M2((留言内容))
    M3((留言时间))
    M4((回复内容))

    ADMIN ---|1| R1 ---|N| NOTICE
    USER ---|N| R2 ---|N| MSG
    ADMIN ---|1| R3 ---|N| MSG

    NOTICE --- N1
    NOTICE --- N2
    NOTICE --- N3
    NOTICE --- N4
    NOTICE --- N5

    MSG --- M1
    MSG --- M2
    MSG --- M3
    MSG --- M4

    classDef entity fill:#fff,stroke:#333,stroke-width:2px,color:#000;
    classDef relation fill:#fff,stroke:#333,stroke-width:1.5px,color:#000;
    class ADMIN,NOTICE,MSG,USER entity;
    class R1,R2,R3 relation;
```

---

## 渲染方式

1. **VS Code**：安装 `Markdown Preview Mermaid Support` 插件，直接预览。
2. **在线渲染**：将每段 ```mermaid``` 代码复制到 [mermaid.live](https://mermaid.live)，导出 PNG / SVG 用于论文插图。
3. **Typora**：默认支持 Mermaid，打开本文件即可看到所有图。
