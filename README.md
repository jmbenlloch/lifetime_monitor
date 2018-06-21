## Script to monitor lifetime evolution for Kr runs.

The script will launch CERES jobs (dorothea) to the Canfranc queue, wait for 300s for them to finish and them will run the lifetime analysis notebook, uploading it to anaconda cloud when finishes (https://anaconda.org/icuser/current_lifetime/notebook). Therefore, at that address an updated notebook will always be found.

Usage:

Run `./compute_lifetime.sh time_period [CERES args]`

where `time_period` is the time that the script will wait between iterations and `CERES args` the arguments needed to run dorothea with CERES.

Example:

`./compute_lifetime.sh 1800 -j 60 -c dorothea -r 5880 -t kr`

The script should run permanetly in a shell. Now it is running on a shell in the Canfranc vncserver.

