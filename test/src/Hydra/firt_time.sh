#!/usr/bin/env bash
if [ ! -d /usr/lib/IOI/Hydra/tmp ]; then
    mkdir /usr/lib/IOI/Hydra/tmp
fi

if [ ! -d /usr/lib/IOI/venv ]; then
    python -m venv /usr/lib/IOI/venv
fi

source /usr/lib/IOI/venv/bin/activate

pip install -r /usr/lib/IOI/Hydra/requirements.txt --upgrade --quiet

if [ $1 = "-i" ]; then
    python3 /usr/lib/IOI/Hydra/src/lib/install
    exit 0
fi