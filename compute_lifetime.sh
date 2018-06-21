#!/bin/bash

export PYTHONPATH=$CERESDIR:$PYTHONPATH

sleep_time=$1 # in seconds
shift

while (true)
do
    python $CERESDIR/ceres/launch_jobs.py $*
    sleep 180 #wait for jobs to finish
    echo "Waiting for jobs to finish"
    KDSTPATH=`python $CERESDIR/get_ceres_dir $*`
    NOTEBOOK="/home/icuser/lifetime_monitor/current_lifetime.ipynb"
    cp /home/icuser/lifetime_monitor/Kr_lifetime.ipynb $NOTEBOOK 
    sed -i "s|KDSTPATH|"$KDSTPATH"|g" current_lifetime.ipynb
    echo "Run lifetime notebook"
    ~/lifetime_monitor/run_notebook $NOTEBOOK
    anaconda upload $NOTEBOOK
    echo "Last submission:" $(date)
    sleep ${sleep_time}
done
