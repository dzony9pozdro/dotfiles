#!/bin/bash
if pgrep -x MTMR > /dev/null; then
  killall MTMR
else
  open -a MTMR
fi
