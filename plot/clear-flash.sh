#!/bin/bash
SRCDIR=$(dirname $0)/../src
$SRCDIR/tfd500_cli.py clear-flash
sleep 2
$SRCDIR/tfd500_cli.py set-clock
