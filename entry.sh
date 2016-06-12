#!/bin/sh

CMD=`echo $COMMAND | cut -d " " -f1`
SUBCMD=`echo $COMMAND | cut -d " " -f2`

source /command/$CMD/$SUBCMD.sh
