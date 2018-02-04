#!/bin/bash
SRCDIR=$(dirname $0)/../src
$SRCDIR/tfd500_cli.py dump $*
