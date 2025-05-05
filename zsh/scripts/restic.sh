#!/usr/bin/env bash

# === 加载颜色函数 ===
green()  { echo -e "\033[1;32m$1\033[0m"; }
red()    { echo -e "\033[1;31m$1\033[0m"; }
yellow() { echo -e "\033[1;33m$1\033[0m"; }
blue()   { echo -e "\033[1;34m$1\033[0m"; }

# === 获取当前日期 ===
DATE=$(date +%Y-%m-%d)

# === 读取参数 ===
TAG_INPUT=$1
FOLDER=$2

if [ -z "$TAG_INPUT" ] || [ -z "$FOLDER" ]; then
  yellow "⚠️ 用法: restic_backup \"你的备注\" /要备份的目录"
  exit 1
fi

# === 检查 Restic 仓库是否存在 ===
if [ ! -f "$RESTIC_REPOSITORY/config" ]; then
  yellow "⚠️ 仓库不存在，正在初始化..."
  restic init
  if [ $? -ne 0 ]; then
    red "❌ 仓库初始化失败，请检查配置！"
    exit 1
  else
    green "✅ 仓库初始化成功！"
  fi
fi

# === 合成最终 tag：备注_日期 ===
TAG="${TAG_INPUT}_${DATE}"

# === 开始备份 ===
blue "🚀 开始备份:"
blue "📂 目录: \"$FOLDER\""
blue "📝 备注: \"$TAG\""

# === 执行备份 ===
restic backup "$FOLDER" --tag "$TAG"
if [ $? -eq 0 ]; then
  green "✅ 备份完成！"
else
  red "❌ 备份失败，请检查日志！"
  exit 1
fi

# === 显示快照信息 ===
blue "📷 当前所有快照："
restic snapshots

