#!/bin/bash

# Define the virtual environment directory
VENV_DIR="$PWD/venv"

# Create the virtual environment if it doesn't exist
echo "正在检查虚拟环境..."
if [ ! -d "$VENV_DIR" ]; then
    sleep 1
    echo "未找到虚拟环境，正在初始化..."
    python -m venv "$VENV_DIR"
    echo "虚拟环境初始化完毕。"
else
    sleep 1
    echo "虚拟环境检查完毕。"
fi

sleep 1

# Activate the virtual environment
echo -e "\n正在激活虚拟环境..."
source "$VENV_DIR/bin/activate"

sleep 1

# Upgrade pip to the latest version
python -m pip install --no-cache-dir -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com --upgrade pip

# Check if start.sh exists in target directory
echo -e "\n正在检查启动脚本..."
if [ ! -f "/home/container/start.sh" ]; then
    cp /usr/local/bin/start.sh /home/container/start.sh
fi
sleep 1
echo -e "\n启动脚本检查完毕..."

# Ensure the start script is executable
chmod +x /home/container/start.sh

# Launch the application script
echo -e "\n正在执行启动脚本..."
exec /home/container/start.sh
