#! /opt/homebrew/bin/fish

# 检查博客名称 && tag
while test (count $argv) -eq 0
    read -P "请输入博客名称(小写): " blog_name
    set argv $blog_name $argv[1]
end

if test (count $argv) -ge 2
    set tags $argv[2..-1] 
else
    echo "没有设置标签"
end

set blog_name $argv[1]
set blog_dir "content/blog/$blog_name"
set index_file "$blog_dir/index.md"
set current_date (date "+%Y-%m-%d")

mkdir -p $blog_dir

###### 输入模版
set content "---
title: $blog_name
summary: What's about this blog!
date: $current_date
authors:
  - admin
tags:
  - $tags
# math: true
# image:
#   caption: 'Embed rich media such as videos and LaTeX math'
---"
echo "$content" > $index_file

if test $status -eq 0
    echo "创建博客 '$blog_name/index.md' 成功 🎉"
else
    echo "创建博客 '$blog_name/index.md' 失败 ❗️"
end




