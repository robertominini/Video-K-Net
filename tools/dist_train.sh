#!/usr/bin/env bash

CONFIG=$1
GPUS=$2
WORK_DIR=$3
PORT=${PORT:-$((29500 + $RANDOM % 29))}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch  --nproc_per_node=$GPUS --master_port=$PORT \
    $(dirname "$0")/train.py $CONFIG --launcher pytorch --work-dir $WORK_DIR ${@:4}
