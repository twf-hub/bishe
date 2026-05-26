# 驾校预约学习系统 — 简化版 E-R 图

仅展示核心实体与主要关联关系，省略字段细节，用于系统整体结构呈现。

```mermaid
erDiagram

    USERS["管理员 users"]
    USER["学员 user"]
    COACH["教练 coach"]
    COACH_RESERVATION["教练预约 coach_reservation"]
    NOTICE["系统公告 notice"]
    STUDY_MATERIAL["学习资料 study_material"]
    MATERIAL_COLLECTION["资料收藏 material_collection"]
    MATERIAL_COMMENT["资料留言 material_comment"]
    MESSAGE_BOARD["留言板 message_board"]
    EXAM_PAPER["试卷 exam_paper"]
    EXAM_QUESTION["试题 exam_question"]
    EXAM_PAPER_QUESTION["试卷组题 exam_paper_question"]
    EXAM_RECORD["考试记录 exam_record"]
    EXAM_DETAILS["答题明细 exam_details"]
    WRONG_QUESTION["错题本 wrong_question"]

    USER ||--o{ COACH_RESERVATION : "提交预约"
    COACH ||--o{ COACH_RESERVATION : "接受预约"

    USER ||--o{ MATERIAL_COLLECTION : "收藏"
    STUDY_MATERIAL ||--o{ MATERIAL_COLLECTION : "被收藏"

    USER ||--o{ MATERIAL_COMMENT : "评论"
    STUDY_MATERIAL ||--o{ MATERIAL_COMMENT : "被评论"

    USER ||--o{ MESSAGE_BOARD : "发布留言"

    EXAM_PAPER ||--o{ EXAM_PAPER_QUESTION : "包含"
    EXAM_QUESTION ||--o{ EXAM_PAPER_QUESTION : "归属"

    USER ||--o{ EXAM_RECORD : "参加考试"
    EXAM_PAPER ||--o{ EXAM_RECORD : "生成记录"

    USER ||--o{ EXAM_DETAILS : "作答"
    EXAM_QUESTION ||--o{ EXAM_DETAILS : "被作答"

    USER ||--o{ WRONG_QUESTION : "产生错题"
    EXAM_QUESTION ||--o{ WRONG_QUESTION : "对应试题"

    USERS ||--o{ NOTICE : "发布"
    USERS ||--o{ STUDY_MATERIAL : "维护"
```

## 核心业务模块

| 业务模块 | 涉及实体 | 关键关系 |
|----------|----------|----------|
| **用户管理** | 管理员 / 学员 / 教练 | 三类角色独立登录 |
| **教练预约** | 学员 ↔ 教练预约 ↔ 教练 | 学员发起、教练审核 |
| **学习资料** | 学员 ↔ 资料 ↔ 收藏 / 留言 | 学员可收藏与评论 |
| **在线考试** | 学员 → 试卷 ← 试题 → 答题明细 / 错题本 | 试卷与试题多对多 |
| **系统辅助** | 公告 / 留言板 | 信息发布与反馈 |

## 主要实体属性概览（精简）

- **学员 USER**：账号、姓名、手机、身份证、性别、邮箱
- **教练 COACH**：账号、姓名、手机、身份证、性别、邮箱
- **管理员 USERS**：用户名、密码、角色
- **教练预约 COACH_RESERVATION**：报名编号、学员、教练、申请说明、审核状态、约定上课时间
- **学习资料 STUDY_MATERIAL**：名称、分类、封面、视频、附件、点赞/踩
- **试卷 EXAM_PAPER**：试卷名、科目、时长、总分、组卷方式
- **试题 EXAM_QUESTION**：题干、选项、答案、解析、题型
- **考试记录 EXAM_RECORD**：流水号、学员、试卷、总分、考试时间
- **错题本 WRONG_QUESTION**：学员、试卷、试题、错误答案、时间
