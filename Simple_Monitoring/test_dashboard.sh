#!/bin/bash

echo "** Generating CPU load **"

for i in {1..4}
do
  yes > /dev/null &
done

echo "** CPU load running for 30 seconds **"
sleep 30

echo "** Stopping load **"
killall yes

echo "Test completed. Check Netdata dashboard."
