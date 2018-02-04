#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import csv
from datetime import datetime
import matplotlib.pyplot as plt
import matplotlib.dates as mdates

# check args
if len(sys.argv) != 2:
  print("Usage: {} filename".format(sys.argv[0]))
  sys.exit(1)

# read data
times = []
temps = []
hums = []
with open(sys.argv[1], 'r') as f:
  reader = csv.reader(f, delimiter=';')
  for row in reader:
    times.append(datetime.strptime(row[1], "%d.%m.%Y %H:%M:%S"))
    temps.append(row[2])
    hums.append(row[3])


# create plot with two y-axis
fig, ax1 = plt.subplots(figsize=(10,8))
ax1.plot(times, temps, 'b-')
ax1.set_ylabel('Temperatur', color='b')
for tl in ax1.get_yticklabels():
    tl.set_color('b')

ax2 = ax1.twinx()
ax2.plot(times, hums, 'r-')
ax2.set_ylabel('Luftfeuchte', color='r')
for tl in ax2.get_yticklabels():
    tl.set_color('r')

# format the date x-axis
days = mdates.DayLocator()
dayFmt = mdates.DateFormatter('%d.%m.')
hours = mdates.HourLocator((6, 12, 18))

ax1.xaxis.set_major_locator(days)
ax1.xaxis.set_major_formatter(dayFmt)
ax1.xaxis.set_minor_locator(hours)
#ax1.xaxis.set_minor_formatter(dayFmt)

ax1.grid(True)


fig.autofmt_xdate()
plt.show()