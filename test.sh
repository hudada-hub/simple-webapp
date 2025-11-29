#!/bin/bash
echo "🧪 开始运行测试..."

# 检查必要文件
if [ ! -f "index.html" ]; then
    echo "❌ 错误: index.html 文件不存在"
    exit 1
fi

echo "✅ index.html 文件存在"

# 检查文件内容
if grep -q "Jenkins 自由风格任务" index.html; then
    echo "✅ 文件标题正确"
else
    echo "❌ 错误: 文件标题不正确"
    exit 1
fi

# 检查文件大小
FILE_SIZE=$(stat -f%z index.html 2>/dev/null || stat -c%s index.html 2>/dev/null)
if [ "$FILE_SIZE" -gt 100 ]; then
    echo "✅ 文件大小正常: ${FILE_SIZE} 字节"
else
    echo "❌ 错误: 文件大小异常"
    exit 1
fi

echo "🎉 所有测试通过！"