#!/bin/bash

if test -f /var/lib/mysql/pre-boot.flag; then
  echo "Pre-boot phase (probably waiting for GCOMM_MINIMUM)..."
elif test -f /var/lib/mysql/auto-recovery.flag; then
  echo "Attempting auto-recovery..."
elif test -f /var/lib/mysql/sst_in_progress; then
  echo "State Snapshot Transfer in progress..."
else
  curl -sSf -o - localhost:8081 2>&1 || exit 1
fi
exit 0
