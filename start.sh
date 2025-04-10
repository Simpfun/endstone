#!/bin/bash

# Configure pip mirror as default source for this venv
pip config set --site global.index-url https://repo.huaweicloud.com/repository/pypi/simple/
pip config set --site global.trusted-host repo.huaweicloud.com

# Install the 'endstone' package
python -m pip install --no-cache-dir -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com endstone

# Run 'endstone'
python -m endstone -s .
