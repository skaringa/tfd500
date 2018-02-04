#!/bin/sh
DATADIR=$(dirname $0)/../data
RRD=$DATADIR/temphygro.rrd
temp=$(mktemp --tmpdir tXXXXXX.gif)
hum=$(mktemp --tmpdir hXXXXXX.gif)
comb=$(mktemp --tmpdir cXXXXXX.gif)
rrdtool graph $temp \
  -s 'now -1 week' -e 'now' \
  -w 1000 -h 300 \
  DEF:temp=$RRD:temp:AVERAGE \
  LINE2:temp#0000ff:"Temperatur [°C]" 
rrdtool graph $hum \
  -s 'now -1 week' -e 'now' \
  -w 1000 -h 300 \
  DEF:hum=$RRD:hum:AVERAGE \
  LINE2:hum#ff0000:"Luftfeuchte [%]"
montage -mode concatenate -tile 1x $temp $hum $comb
display $comb&
