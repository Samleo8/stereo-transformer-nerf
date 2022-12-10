#!/bin/bash

git pull
echo "" >nohup2.out

# run training headless
nohup ./scripts/train2.sh $@ &>nohup2.out &

# save PID
PID=$!
echo "Parallel training (train2) started in background task ${PID}. To see the output, run 'tail -f nohup2.out'"
echo ${PID} >.train2_pid

# check nohup
tail -f nohup2.out
