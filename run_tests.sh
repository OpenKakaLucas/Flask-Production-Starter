#!/usr/bin/env bash
# 运行单元测试的脚本

echo "======================================="
echo "开始运行单元测试"
echo "======================================="

# 优先复用项目虚拟环境，其次回退到 uv
if [ -x "./.venv/bin/pytest" ]; then
    ./.venv/bin/pytest -v \
        --cov=app \
        --cov-report=term-missing \
        --cov-report=html \
        tests/
else
    uv run pytest -v \
        --cov=app \
        --cov-report=term-missing \
        --cov-report=html \
        tests/
fi

echo ""
echo "======================================="
echo "测试完成！"
echo "HTML 覆盖率报告: htmlcov/index.html"
echo "======================================="
