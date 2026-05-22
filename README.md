# Claude Code Skills 仓库

这个仓库用于保存和管理所有已下载的 Claude Code Skills，按功能分类整理。

## 目录结构

```
skills-repo/
├── 飞书系列/          # 飞书/Lark 相关技能（24个）
├── 产品设计/          # 产品设计、文档协作（5个）
├── 开发工具/          # 开发、测试、代码工具（5个）
├── AI媒体/            # AI 生成媒体文件（6个）
├── AI思维模型/        # 思维模型、技能蒸馏（nuwa-skill）
└── 其他/              # 其他工具（3个）
```

## 分类说明

### 飞书系列 (24个)
| Skill | 描述 |
|-------|------|
| lark-approval | 飞书审批 API |
| lark-attendance | 飞书考勤打卡 |
| lark-base | 飞书多维表格 |
| lark-calendar | 飞书日历 |
| lark-contact | 飞书通讯录 |
| lark-doc | 飞书云文档 |
| lark-drive | 飞书云空间 |
| lark-event | 飞书实时事件 |
| lark-im | 飞书即时通讯 |
| lark-mail | 飞书邮箱 |
| lark-markdown | 飞书 Markdown |
| lark-minutes | 飞书妙记 |
| lark-okr | 飞书 OKR |
| lark-openapi-explorer | 飞书 OpenAPI 探索 |
| lark-shared | 飞书共享基础 |
| lark-sheets | 飞书电子表格 |
| lark-skill-maker | 创建自定义 Skill |
| lark-slides | 飞书幻灯片 |
| lark-task | 飞书任务 |
| lark-vc | 飞书视频会议 |
| lark-whiteboard | 飞书画板 |
| lark-wiki | 飞书知识库 |
| lark-workflow-meeting-summary | 会议纪要整理 |
| lark-workflow-standup-report | 日程待办摘要 |

### 产品设计 (5个)
| Skill | 描述 |
|-------|------|
| general-productivity | 代码审查 |
| frontend-design | 前端界面设计 |
| canvas-design | 视觉艺术设计 |
| doc-coauthoring | 文档协作 |
| claude-md-management | CLAUDE.md 管理 |

### 开发工具 (5个)
| Skill | 描述 |
|-------|------|
| github | GitHub 交互 |
| playwright-cli | Web 应用测试 |
| building-native-ui | 原生 UI 构建 |
| find-skills | 技能搜索 |
| self-improving-agent | 自改进代理 |

### AI媒体 (6个)
| Skill | 描述 |
|-------|------|
| minimax-docx | 生成 Word 文档 |
| minimax-pdf | 生成 PDF |
| minimax-xlsx | 生成 Excel |
| pptx-generator | 生成 PPT |
| anthropic-algorithmic-art-boisenoise-skills-collections | 算法艺术 |
| 805bfa87-7c72-4dff-a193-2057070834d4 | 主题工厂 |

### AI思维模型 (nuwa-skill)
- 技能蒸馏框架，用于创建人物思维模型

### 其他 (3个)
| Skill | 描述 |
|-------|------|
| systematic-debugging | 系统调试 |
| skills-org-webapp-testing | Web 测试 |
| web-artifacts-builder-rafaelramosdf | Web 组件构建 |

## 自动更新

每次新增 Skill 时，会自动：
1. 读取 SKILL.md 获取描述
2. 根据名称/描述分类到对应目录
3. 更新本 README

## 统计

- 飞书系列：24 个
- 产品设计：5 个
- 开发工具：5 个
- AI媒体：6 个
- AI思维模型：1 个
- 其他：3 个
- **总计：44 个 Skills**