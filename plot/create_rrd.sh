#!/bin/bash
# Create rrd database for temp/hygro measurement
# Reading values every 5 minutes (300 s) from 2 sensors creates 288 samples per day
# Average 1: 2880 samples == 10 days
# Average/Min/Max 2: 1 sample per day for 3600 days 
DATADIR=$(dirname $0)/../data
mkdir -p $DATADIR
rrdtool create -O $DATADIR/temphygro.rrd --step 300 --start '18:00 01.12.2017' \
DS:temp:GAUGE:1200:-20:80 \
DS:hum:GAUGE:1200:0:100 \
RRA:AVERAGE:0.5:1:2880 \
RRA:MIN:0.5:288:3600 \
RRA:MAX:0.5:288:3600 \
RRA:AVERAGE:0.5:288:3600
