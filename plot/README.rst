Collection of scripts to visualize and store the data
=====================================================

- dump.sh : Dump the data from the TFD 500 into a csv file.

- plot.py : Plot the data produced by dump.sh. Requires `matplotlib`_.

- clear-flash.sh : Clear the flash memory of TFD 500.

- create_rrd.sh : Create a round robin database (RRD) to hold the data. Requires `rrdtool`_.

- update_rrd.py : Insert the data produced by dump.sh into the RRD.

- graph.sh : Read the data from the RRD and produce a graph with values of the last week.

- graphm.sh : Read the data from the RRD and produce a graph with average values of the last month.

.. _matplotlib: https://matplotlib.org/
.. _rrdtool: https://oss.oetiker.ch/rrdtool/
