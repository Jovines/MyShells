#!/bin/bash

# 给工作的老哥用的脚本，防止用公司的user.name来操作
# 执行前配置一下，这里的用户名和邮箱，只会在这个项目生效
user_name="Jovines"
user_email="1246634075@qq.com"

# 模式s：遍历当前文件夹以及所有文件夹
# 默认模式：遍历当前目录子文件夹
mode=$1

file_count=0
folder_count=0
function FILE_COUNT(){
  for file in *
  do
    if test -f "$file";then
        ((file_count++))
        echo "$file"
    elif test -d "$file";then
        ((folder_count++))
        echo "$file"
        cd "$file"||return
        git config --local  user.name $user_name
        git config --local user.email $user_email
#       git submodule foreach  git config --local  user.name $user_name
#       git submodule foreach  git config --local user.email $user_email
        if [ "$mode" == "s" ]; then
            (FILE_COUNT)
        fi
        cd ..
    fi
    done
}

git config --local  user.name $user_name
git config --local user.email $user_email
# git submodule foreach  git config --local  user.name $user_name
# git submodule foreach  git config --local user.email $user_email
FILE_COUNT
