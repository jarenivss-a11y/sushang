# Skills Repository Manager

This directory contains all Claude Code Skills, organized by category.

## Repository Structure

```
skills-repo/
├── 飞书系列/          # 飞书/Lark 相关技能（24个）
├── 产品设计/          # 产品设计、文档协作（5个）
├── 开发工具/          # 开发、测试、代码工具（5个）
├── AI媒体/            # AI 生成媒体文件（6个）
├── AI思维模型/        # 思维模型、技能蒸馏（nuwa-skill）
├── 其他/              # 其他工具（3个）
└── update-skill.sh   # 自动更新脚本
```

## Auto-Update Rule

**IMPORTANT**: When user downloads or installs a new skill, you MUST:

1. **Identify the skill location**: Usually in `~/.claude/skills/` or `~/.claude/.agents/skills/`
2. **Read SKILL.md** to get the skill's name and description
3. **Categorize the skill** based on:
   - `lark-*` → 飞书系列
   - `minimax-*`, `pptx-generator`, `anthropic-algorithmic-art-*`, theme-factory → AI媒体
   - `frontend-design`, `canvas-design`, `doc-coauthoring`, `claude-md-management` → 产品设计
   - `github`, `playwright`, `building-native`, `find-skills`, `self-improving` → 开发工具
   - `nuwa-skill` → AI思维模型
   - Others → 其他
4. **Copy the skill** to the appropriate category folder
5. **Update README.md** with the new skill in the table
6. **Commit and push** to `github2/skills-repo` branch

## Manual Update Command

```bash
cd ~/.claude/skills-repo
git add -A
git commit -m "chore: update skills"
git push github2 skills-repo
```

## GitHub Repository

- Remote: `github2` (https://github.com/jarenivss-a11y/sushang)
- Branch: `skills-repo`
- Commit & push after each skill update