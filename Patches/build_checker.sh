#!/usr/bin/env bash
# Author: JackA1ltman @Github
# 2025/03/19

while read -r error_text; do
    case "$error_text" in
        *"file not found"*)
            echo "提示文件缺失，请检查Build Kernel提示的文件位置，并补充"
            break
            ;;
        *"No rule to make target"*)
            echo "请检查No rule to make target提示中所编译的o文件，这代表了你缺少原始类文件用于编译，请补充"
            break
            ;;
    esac
done < error.log
