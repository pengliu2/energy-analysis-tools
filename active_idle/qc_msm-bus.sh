#!/bin/sh
mkdir /data/tmp/p
rm -r /data/tmp/p/*
mount -t tmpfs tmpfs /data/tmp/p
mount -t debugfs d /d/

echo "power:cpu_idle" >> /d/tracing/set_event
echo "power:cpu_frequency" >> /d/tracing/set_event
cat /d/tracing/set_event

sleep $1

mkdir /data/tmp/p/before_test
mkdir /data/tmp/p/after_test

cp -r /d/msm-bus-dbg/client-data/ /data/tmp/p/before_test/client-data/
cp -r /d/msm-bus-dbg/commit-data// /data/tmp/p/before_test/commit-data/

/data/powertop -d -t $2 > /data/tmp/p/powertop.txt

echo "" > /d/tracing/set_event

cp -r /d/msm-bus-dbg/client-data/ /data/tmp/p/after_test/client-data/
cp -r /d/msm-bus-dbg/commit-data// /data/tmp/p/after_test/commit-data/

dmesg > /data/tmp/p/dmesg.txt
