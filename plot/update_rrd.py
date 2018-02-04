#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import csv
import time
from datetime import datetime
import rrdtool

# check args
if len(sys.argv) != 2:
  print("Usage: {} filename".format(sys.argv[0]))
  sys.exit(1)

# Path to RRD 
rrdb = "%s/../data/temphygro.rrd" % (os.path.dirname(os.path.abspath(__file__)))

# read and update data
with open(sys.argv[1], 'r') as f:
  reader = csv.reader(f, delimiter=';')
  for row in reader:
    t = datetime.strptime(row[1], "%d.%m.%Y %H:%M:%S")
    update = "%d:%.1f:%.0f" % (time.mktime(t.timetuple()), float(row[2]), float(row[3]))
    #print(update)
    rrdtool.update(rrdb, update)
