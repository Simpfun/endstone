#!/bin/bash

# Configure pip mirror as default source for this venv
pip config set --site global.index-url https://repo.huaweicloud.com/repository/pypi/simple/
pip config set --site global.trusted-host repo.huaweicloud.com

# Run 'endstone'
python -m endstone -s .
