## Script to monitor lifetime evolution for Kr runs.

The script will run the lifetime analysis notebook, uploading it to anaconda cloud when finishes (https://anaconda.org/icuser/current_lifetime/notebook). Therefore, at that address an updated notebook will always be found.

Usage:

Run `./compute_lifetime.sh time_period run_number`

where `time_period` is the time that the script will wait between iterations and `run_number` is the latest Kr run being processed by runProdDaemon.

Example:

`./compute_lifetime.sh 1800 5882`

The script should run permanetly in a shell. Now it is running on a shell in the Canfranc vncserver.

