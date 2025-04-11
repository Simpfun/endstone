#!/bin/bash

# Define the virtual environment directory
VENV_DIR="$PWD/venv"

# Create the virtual environment if it doesn't exist
printf "正在检查虚拟环境...\n"
printf "\n"
if [ ! -d "$VENV_DIR" ]; then
    printf "未找到虚拟环境，正在初始化...\n"
    python -m venv "$VENV_DIR"
    printf "虚拟环境初始化完毕。\n"
else
    printf "虚拟环境检查完毕。\n"
fi

printf "\n"

# Activate the virtual environment
printf "正在激活虚拟环境...\n"
source "$VENV_DIR/bin/activate"

printf "\n"

# Upgrade pip to the latest version
python -m pip install --no-cache-dir -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com --upgrade pip

printf "\n"

# Check if start.sh exists in target directory
printf "正在检查启动脚本...\n"
if [ ! -f "/home/container/start.sh" ]; then
    cp /usr/local/bin/start.sh /home/container/start.sh
fi

# Ensure the start script is executable
chmod +x /home/container/start.sh

printf "启动脚本检查完毕...\n"

printf "\n"

# Launch the application script
printf "正在执行启动脚本...\n"
printf "\n"
exec /home/container/start.sh