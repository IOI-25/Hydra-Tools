#!/usr/bin/env bash


if [ ! -d /usr/lib/IOI/Hydra/tmp ]; then
    mkdir /usr/lib/IOI/Hydra/tmp
fi

if [ ! -d /usr/lib/IOI/venv ]; then
    python -m venv /usr/lib/IOI/venv
fi

source /usr/lib/IOI/venv/bin/activate

pip install -r /usr/lib/IOI/Hydra/requirements.txt --upgrade --quiet

if [ ! -d /usr/lib/IOI/Hydra/modules ]; then
    mkdir /usr/lib/IOI/Hydra/modules
fi
if [ ! -d /usr/lib/IOI/Hydra/lib ]; then
    mkdir /usr/lib/IOI/Hydra/lib
fi
if [ ! -d /usr/lib/IOI/Hydra/docs ]; then
    mkdir /usr/lib/IOI/Hydra/docs
fi

if [ -z $1 ]; then
    cat /usr/lib/IOI/Hydra/docs/commands_hydra
    exit 0
fi

if [ $1 = "-m" ]; then
    if [ ! -f /usr/lib/IOI/Hydra/modules/$2 ]; then
        echo "Module $2 not found"
        exit 0
    fi
    bash /usr/lib/IOI/Hydra/modules/$2 "${@:3}"
    exit 0
fi

if [ $1 = "-v" ]; then
    echo -n "Hydra "
    python /usr/lib/IOI/Hydra/src/version
    exit 0
fi

if [ $1 = "-c" ]; then
    python /usr/lib/IOI/Hydra/src/clonepgk "${@:2}"
    exit 0
fi

if [ $1 = "-r" ]; then
    python /usr/lib/IOI/Hydra/src/removepgk "${@:2}"
    exit 0
fi

if [ $1 = "-l" ]; then
    ls /usr/lib/IOI/Hydra/modules
    exit 0
fi

if [ $1 = "-u" ]; then
    echo "not update"
    exit 0
fi

exit 1
