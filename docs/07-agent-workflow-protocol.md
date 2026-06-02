# Agent工作流协议

这个协议用于让不同 Agent 和大模型处理同一个 Obsidian 任务管理系统。模型可以更换，协议保持稳定。

## 输入对象：Capture Item

```json
{
  "item_id": "inbox-20260602-001",
  "raw": "我想优化任务管理系统，让 AI 自动分类和分解任务",
  "source": "00_Inbox/收件箱.md",
  "captured_at": "2026-06-02T21:30:00+08:00",
  "status": "pending",
  "context": {
    "active_projects": [],
    "areas": [],
    "goals": [],
    "today_daily": "10_Daily/2026-06-02.md"
  }
}
```

## 输出对象：Route Suggestion

```json
{
  "item_id": "inbox-20260602-001",
  "route": "existing_project",
  "confidence": 0.88,
  "reason": "这是对现有任务管理系统的优化，不是单次小任务。",
  "suggested_title": "Agent 驱动任务路由系统设计",
  "area": "个人执行系统",
  "goal": "建立低摩擦任务管理与知识管理系统",
  "project": "长期探索｜任务管理与知识管理",
  "next_action": "写出新版系统说明和使用说明",
  "questions": [
    "是否把它作为当前大项目的新版主流程，而不是独立项目？"
  ],
  "operations": [
    {
      "type": "append_project_task",
      "path": "30_Projects/长期探索｜任务管理与知识管理/01_任务池.md",
      "content": "- [ ] 写出 Agent 路由系统说明和使用说明 #task"
    },
    {
      "type": "link_area",
      "area": "个人执行系统"
    }
  ]
}
```

## 路由类型

| route | 含义 |
| --- | --- |
| `do_now` | 立即做掉，通常不进入长期系统 |
| `daily` | 今天执行的单步任务 |
| `existing_project` | 并入已有项目 |
| `new_project` | 新建 Project Hub |
| `area_maintenance` | 长期维护、习惯、SOP |
| `goal_or_plan` | 目标、规划、阶段计划 |
| `resource` | 资料、教程、链接、素材 |
| `review` | 复盘、异常、经验 |
| `ai_memory_candidate` | AI 长期记忆候选 |
| `archive` | 完成历史 |
| `discard` | 删除或丢弃 |
| `ask_user` | 信息不足，必须提问 |

## 操作类型

| operation type | 作用 | 是否需要确认 |
| --- | --- | --- |
| `append_daily_task` | 写入当天 Daily | 低风险，可确认后执行 |
| `append_project_task` | 写入项目任务池 | 低风险，可确认后执行 |
| `create_project_hub` | 新建 Project Hub | 中风险，需要确认标题和归属 |
| `update_frontmatter` | 更新项目/资料元数据 | 中风险，需要确认 |
| `link_area` | 在 Area 中挂项目索引 | 低风险 |
| `link_goal` | 在 Goal 中挂项目索引 | 低风险 |
| `create_resource_note` | 创建资料笔记 | 低风险 |
| `create_review_note` | 创建复盘笔记 | 低风险 |
| `add_ai_memory_candidate` | 写入 AI_Memory 候选 | 中风险，需要确认是否稳定 |
| `mark_inbox_processed` | 标记 Inbox 条目已处理 | 低风险 |
| `delete_inbox_item` | 删除 Inbox 条目 | 高风险，必须确认 |
| `archive_project` | 归档项目 | 高风险，必须确认 |
| `create_reminder_request` | 提醒用户设置系统日历/提醒 | 不直接代替提醒系统 |

## 状态流转

```text
pending → suggested → approved → applied → executing → reviewed → archived
                        ↘ rejected/discarded
```

| 状态 | 说明 |
| --- | --- |
| `pending` | 已捕获，未处理 |
| `suggested` | Agent 已给建议 |
| `approved` | 用户确认 |
| `applied` | Agent 已写入文件 |
| `executing` | 用户正在执行 |
| `reviewed` | 已复盘 |
| `archived` | 已归档 |
| `discarded` | 已丢弃 |
| `rejected` | 建议被否 |

## 提问规则

Agent 提问必须克制：

- 每条内容最多问 1 个必要问题。
- 一次处理最多问 3 个问题。
- 能用现有项目、Area、Goal 推断的，不问。
- 低风险建议先给默认路径。
- 高风险操作先停下等确认。

## 多模型协作

| 场景 | 推荐策略 |
| --- | --- |
| 普通分类 | 快速模型即可 |
| 复杂项目规划 | 强模型 |
| 高风险决策 | 两个模型交叉评审 |
| 隐私内容 | 本地模型或只给摘要 |
| 文件操作 | Codex 或本地 Agent |

## 安全规则

- Agent 可以建议删除，但不能未经确认删除。
- Agent 可以建议归档，但不能未经确认移动项目主线。
- Agent 不应把所有内容都升级为项目。
- Agent 不应把琐事写入 AI_Memory。
- Agent 不应让用户维护多份重复任务。
