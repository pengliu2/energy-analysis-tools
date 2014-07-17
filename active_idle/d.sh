#!/bin/sh
rm -r /tmp/p
mkdir /tmp/p
#echo "power:power_frequency sched_switch irq_handler_entry timer_expire_entry hrtimer_expire_entry power" >> /d/tracing/set_event
echo "power:power_frequency workqueue:workqueue_execution sched_switch" >> /d/tracing/set_event
echo "0 4 0 0" > /proc/sys/kernel/printk
echo test > /sys/power/wake_lock
#echo "1500" > /proc/sys/vm/dirty_writeback_centisecs
sleep $1

#top -n 1 -d $2 -s cpu > /tmp/p/top.txt &

cat /d/pm_debug/count > /tmp/p/count
cat /d/pm_debug/time > /tmp/p/time
#cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name > /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state0/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state1/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state2/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state2/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state0/name > /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state0/time >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state1/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state1/time >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state2/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state2/time >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/time >> /tmp/p/cpu1.txt

echo "=========" >> /tmp/p/count
echo "=========" >> /tmp/p/time
#echo "=========" >> /tmp/p/cpu0.txt

powertop -dump -t $2 > /tmp/p/powertop.txt

#cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state0/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state1/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state2/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state2/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/name >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/time >> /tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state0/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state0/time >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state1/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state1/time >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state2/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state2/time >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/name >> /tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/time >> /tmp/p/cpu1.txt

cat /d/pm_debug/count >> /tmp/p/count
cat /d/pm_debug/time >> /tmp/p/time

cat /d/tracing/trace > /tmp/p/trace.txt

dmesg > /tmp/p/dmesg.txt

cat /proc/timer_stats > /tmp/p/timer_stats.txt

echo "" > /d/tracing/set_event
