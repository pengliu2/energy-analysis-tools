#!/bin/sh
echo 0 > /sys/module/ct406/parameters/als_enable
mount -t debugfs d /d/
mkdir /data/tmp/p
rm -r /data/tmp/p/*
mount -t tmpfs tmpfs /data/tmp/p
#mount -t debugfs d /d/

sleep $1
dmesg > /data/tmp/p/d_b.txt


echo "power:cpu_idle" >> /d/tracing/set_event
#echo "sched:sched_process_fork" >> /d/tracing/set_event
echo "sched:sched_switch" >> /d/tracing/set_event
echo "power:cpu_frequency" >> /d/tracing/set_event
#echo "power:power_frequency" >> /d/tracing/set_event
#echo "power:clock_set_rate" >> /d/tracing/set_event
echo "irq:irq_handler_entry" >> /d/tracing/set_event
echo "timer:timer_expire_entry" >> /d/tracing/set_event
echo "timer:hrtimer_expire_entry" >> /d/tracing/set_event
#echo "power:power_start" >> /d/tracing/set_event
#echo "power:power_end" >> /d/tracing/set_event
#echo "power:machine_suspend" >> /d/tracing/set_event

#cat /sys/devices/system/cpu/cpu1/cpuidle/state7/time > /data/tmp/p/cpu1_7_time.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state7/time > /data/tmp/p/cpu0_7_time.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state7/usage > /data/tmp/p/cpu1_7_usage.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state7/usage > /data/tmp/p/cpu0_7_usage.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state6/time > /data/tmp/p/cpu1_6_time.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state6/time > /data/tmp/p/cpu0_6_time.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state6/usage > /data/tmp/p/cpu1_6_usage.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state6/usage > /data/tmp/p/cpu0_6_usage.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state5/time > /data/tmp/p/cpu1_5_time.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state5/time > /data/tmp/p/cpu0_5_time.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state5/usage > /data/tmp/p/cpu1_5_usage.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state5/usage > /data/tmp/p/cpu0_5_usage.txt

cat /d/mid_pmu_states > /data/tmp/p/mid_pmu_states.txt
echo 1 > /proc/timer_stats
cat /proc/interrupts > /data/tmp/p/interrupts.txt
#echo test > /sys/power/wake_lock
echo 1 > /d/tracing/tracing_on

top -n 1 -d $2 -s cpu > /data/tmp/p/top.txt
echo 0 > /d/tracing/tracing_on
echo "" >> /d/tracing/set_event

cat /proc/interrupts >> /data/tmp/p/interrupts.txt
cat /proc/timer_stats > /data/tmp/p/timer_stats.txt
cat /d/mid_pmu_states >> /data/tmp/p/mid_pmu_states.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state7/time >> /data/tmp/p/cpu1_7_time.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state7/time >> /data/tmp/p/cpu0_7_time.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state7/usage >> /data/tmp/p/cpu1_7_usage.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state7/usage >> /data/tmp/p/cpu0_7_usage.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state6/time >> /data/tmp/p/cpu1_6_time.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state6/time >> /data/tmp/p/cpu0_6_time.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state6/usage >> /data/tmp/p/cpu1_6_usage.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state6/usage >> /data/tmp/p/cpu0_6_usage.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state5/time >> /data/tmp/p/cpu1_5_time.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state5/time >> /data/tmp/p/cpu0_5_time.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state5/usage >> /data/tmp/p/cpu1_5_usage.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state5/usage >> /data/tmp/p/cpu0_5_usage.txt
dmesg > /data/tmp/p/d_a.txt
