# 30_Projects

这里是项目执行区，也是整个任务管理系统的中心之一。

## 什么是项目

符合任意一条，就可以建项目：

- 超过 1 天才能完成。
- 有明确交付物。
- 需要拆成多个步骤。
- 会产生资料、决策、复盘。
- 以后值得归档或复用。

## Project 优先规则

凡是需要分步推进的内容，先进入 Project，再自动挂 Goal / Area / Resource / Review。

不要把项目正文拆散到 Area、Goal 或 Resources。那些地方只保存索引、约束、资料和沉淀。

## 和 Daily 的关系

Project 负责完整推进，Daily 只负责今天执行。

```text
Project 下一步 → Daily 今日 1-3 件 → 执行日志/复盘 → 回到 Project
```

## 和 AI_Memory/projects.md 的区别

- `30_Projects`：放完整项目笔记、任务、日志、决策、复盘。
- `80_AI_Memory/projects.md`：放给 AI 快速理解的项目摘要。

你在这里干活，在 AI_Memory 里留摘要。

## 项目笔记怎么写

新建项目时：

1. 在本文件夹新建项目文件夹或项目笔记。
2. 插入 `90_Templates/项目模板.md` 或 `90_Templates/大项目Hub模板.md`。
3. 填写目标、完成标准、当前第一任务、下一步。
4. 把任务写成 `- [ ]`，必要时加 `#task` 和截止日期。
5. 在 [[../70_Dashboards/项目推进台]] 检查是否能显示下一步。

## 项目结束怎么处理

1. 勾掉完成标准。
2. 写项目复盘。
3. 把可复用经验沉淀到 `40_Areas` 或 `50_Resources`。
4. 把 AI 以后需要知道的摘要更新到 `80_AI_Memory/projects.md`。
5. 把项目移动到 `99_Archive`。
