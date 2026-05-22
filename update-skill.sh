#!/bin/bash
# Skill Repository Auto-Update Script
# Usage: ./update-skills-repo.sh <skill-path> <skill-name>

SKILL_PATH="$1"
SKILL_NAME="$2"
REPO_DIR="/c/Users/sushang/.claude/skills-repo"

if [ -z "$SKILL_PATH" ] || [ -z "$SKILL_NAME" ]; then
    echo "Usage: $0 <skill-path> <skill-name>"
    exit 1
fi

# Determine category based on skill name and path
case "$SKILL_NAME" in
    lark-*)
        CATEGORY="飞书系列"
        ;;
    minimax-*|pptx-generator|anthropic-algorithmic-art*)
        CATEGORY="AI媒体"
        ;;
    frontend-design|canvas-design|doc-coauthoring|claude-md-management|general-productivity)
        CATEGORY="产品设计"
        ;;
    github|playwright|building-native|find-skills|self-improving)
        CATEGORY="开发工具"
        ;;
    nuwa-skill)
        CATEGORY="AI思维模型"
        ;;
    systematic-debugging|skills-org-webapp-testing|web-artifacts-builder)
        CATEGORY="其他"
        ;;
    805bfa87-*)
        CATEGORY="AI媒体"
        ;;
    *)
        # Try to read description from SKILL.md
        if [ -f "$SKILL_PATH/SKILL.md" ]; then
            DESC=$(grep -m1 "description:" "$SKILL_PATH/SKILL.md" | sed 's/description: *//' | tr -d '"')
            if echo "$DESC" | grep -qi "飞书\|lark"; then
                CATEGORY="飞书系列"
            elif echo "$DESC" | grep -qi "前端\|设计\|界面\|文档"; then
                CATEGORY="产品设计"
            elif echo "$DESC" | grep -qi "git\|测试\|调试\|开发"; then
                CATEGORY="开发工具"
            elif echo "$DESC" | grep -qi "生成\|创建.*文档\|pdf\|docx\|xlsx\|ppt"; then
                CATEGORY="AI媒体"
            else
                CATEGORY="其他"
            fi
        else
            CATEGORY="其他"
        fi
        ;;
esac

echo "Categorizing '$SKILL_NAME' as '$CATEGORY'..."

# Create target directory and copy
TARGET_DIR="$REPO_DIR/$CATEGORY/$SKILL_NAME"
mkdir -p "$TARGET_DIR"
cp -r "$SKILL_PATH"/* "$TARGET_DIR/"

echo "Copied to $TARGET_DIR"

# Update README with new skill
cd "$REPO_DIR"
git add -A
git commit -m "chore: add $SKILL_NAME to $CATEGORY"
git push github2 skills-repo

echo "Done! Skill '$SKILL_NAME' has been added to '$CATEGORY'."