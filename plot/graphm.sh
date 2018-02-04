#!/bin/sh
DATADIR=$(dirname $0)/../data
RRD=$DATADIR/temphygro.rrd
temp=$(mktemp --tmpdir tXXXXXX.gif)
hum=$(mktemp --tmpdir hXXXXXX.gif)
comb=$(mktemp --tmpdir cXXXXXX.gif)
rrdtool graph $temp \
  -s 'now -1 month' -e 'now' \
  -w 1000 -h 300 \
  DEF:tempmin=$RRD:temp:MIN \
  DEF:tempmax=$RRD:temp:MAX \
  DEF:temp=$RRD:temp:AVERAGE \
  CDEF:temprange=tempmax,tempmin,- \
  LINE1:tempmin#0000ff \
  AREA:temprange#8dadf588::STACK \
  LINE1:tempmax#0000ff \
  LINE2:temp#0000ff:"Temperatur [°C]" 
rrdtool graph $hum \
  -s 'now -1 month' -e 'now' \
  -w 1000 -h 300 \
  DEF:hummin=$RRD:hum:MIN \
  DEF:hummax=$RRD:hum:MAX \
  DEF:hum=$RRD:hum:AVERAGE \
  CDEF:humrange=hummax,hummin,- \
  LINE1:hummin#ff0000 \
  AREA:humrange#ff999988::STACK \
  LINE1:hummax#ff0000 \
  LINE2:hum#ff0000:"Luftfeuchte [%]"
montage -mode concatenate -tile 1x $temp $hum $comb
display $comb&
