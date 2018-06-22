#!/bin/bash

sleep_time=$1 # in seconds
RUN=$2

while (true)
do
    #select the latest production for $RUN
    BASEPATH="/analysis/"$RUN"/hdf5/prod/"
    ICDIR=`ls -tr $BASEPATH | tail -n1`
    CERESDIR=`ls -tr $BASEPATH/$ICDIR | tail -n1`
    KDSTPATH="$BASEPATH/$ICDIR/$CERESDIR/kdst/"

    echo "Taking files from $KDSTPATH"
    NOTEBOOK="/home/icuser/lifetime_monitor/current_lifetime.ipynb"
    cp /home/icuser/lifetime_monitor/Kr_lifetime.ipynb $NOTEBOOK 
    sed -i "s|KDSTPATH|"$KDSTPATH"|g" current_lifetime.ipynb
    echo "Run lifetime notebook"
    ~/lifetime_monitor/run_notebook $NOTEBOOK
    anaconda upload $NOTEBOOK
    echo "Last submission:" $(date)
    sleep ${sleep_time}
done
