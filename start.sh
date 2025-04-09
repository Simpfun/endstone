#!/bin/bash

# Define the virtual environment directory
VENV_DIR="$PWD/venv"

# Create the virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    python -m venv "$VENV_DIR"
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Configure pip mirror as default source for this venv
pip config set --site global.index-url https://repo.huaweicloud.com/repository/pypi/simple/
pip config set --site global.trusted-host repo.huaweicloud.com

# Upgrade pip to the latest version
python -m pip install --no-cache-dir --upgrade pip

# Install the 'endstone' package
python -m pip install --no-cache-dir endstone

# Run 'endstone'
endstone
