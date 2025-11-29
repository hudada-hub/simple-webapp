#!/usr/bin/env python3
import os
import sys

def test_index_file():
    """测试 index.html 文件是否存在"""
    if os.path.exists('index.html'):
        print("✅ index.html 文件存在")
        return True
    else:
        print("❌ index.html 文件不存在")
        return False

def test_file_content():
    """测试文件内容"""
    with open('index.html', 'r') as f:
        content = f.read()
        if 'Jenkins Demo Application' in content:
            print("✅ 文件内容正确")
            return True
        else:
            print("❌ 文件内容不正确")
            return False

if __name__ == "__main__":
    print("🚀 开始运行测试...")
    
    test1 = test_index_file()
    test2 = test_file_content()
    
    if test1 and test2:
        print("🎉 所有测试通过！")
        sys.exit(0)
    else:
        print("💥 测试失败！")
        sys.exit(1)