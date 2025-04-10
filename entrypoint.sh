#!/bin/bash

# Define the virtual environment directory
VENV_DIR="$PWD/venv"

# Create the virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    python -m venv "$VENV_DIR"
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Upgrade pip to the latest version
python -m pip install --no-cache-dir -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com --upgrade pip

# Ensure the start script is executable
chmod +x /home/container/start.sh

# Launch the application script
exec /home/container/start.sh
