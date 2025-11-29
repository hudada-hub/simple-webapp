#!/bin/bash
echo "🚀 开始部署..."

# 创建部署目录
DEPLOY_DIR="/tmp/jenkins-freestyle-demo"
echo "部署目录: $DEPLOY_DIR"

# 清理旧部署
rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"

# 复制文件
cp index.html "$DEPLOY_DIR/"
cp -r resources "$DEPLOY_DIR/" 2>/dev/null || true

# 设置权限
chmod -R 755 "$DEPLOY_DIR"

# 创建部署信息文件
echo "构建编号: $BUILD_NUMBER" > "$DEPLOY_DIR/build-info.txt"
echo "构建时间: $(date)" >> "$DEPLOY_DIR/build-info.txt"
echo "构建URL: $BUILD_URL" >> "$DEPLOY_DIR/build-info.txt"

echo "✅ 部署完成！"
echo "📁 文件已部署到: $DEPLOY_DIR"
echo "🌐 可以通过文件浏览器访问或使用命令:"
echo "   cd $DEPLOY_DIR && python3 -m http.server 8080"