#!/bin/bash
# 部署到 github pages 脚本
# 错误时终止脚本
set -e


# 打包。even 是主题
hugo   # if using a theme, replace with `hugo -t <YOURTHEME>`

# 进入打包文件夹
cd public

# Add changes to git.

git checkout master
git fetch
git add -A

# Commit changes.
msg="building site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 推送到github
# 只能使用 master分支
git push  origin master

# 回到原文件夹
cd ..