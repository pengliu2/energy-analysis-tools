#!/bin/sh
mkdir /data/tmp/p
rm -r /data/tmp/p/*
mount -t tmpfs tmpfs /data/tmp/p
mount -t debugfs d /d/

#echo 0 > /sys/devices/platform/msm_serial_hsl.0/console
#echo 0 > /d/clk/gsbi5_uart_clk/enable

echo "power:cpu_idle" >> /d/tracing/set_event
#echo "sched:sched_process_fork" >> /d/tracing/set_event
echo "power:power_start" >> /d/tracing/set_event
echo "power:power_end" >> /d/tracing/set_event
echo "sched:sched_switch" >> /d/tracing/set_event
#echo "power:cpu_frequency" >> /d/tracing/set_event
echo "power:power_frequency" >> /d/tracing/set_event
#echo "power:clock_set_rate" >> /d/tracing/set_event
echo "irq:irq_handler_entry" >> /d/tracing/set_event
echo "timer:timer_expire_entry" >> /d/tracing/set_event
echo "timer:hrtimer_expire_entry" >> /d/tracing/set_event

cat /d/tracing/set_event
echo "0 4 0 0" > /proc/sys/kernel/printk
echo test > /sys/power/wake_lock

sleep $1

ps > /data/tmp/p/ps-pre.txt
#cat /d/pm_debug/count > /tmp/p/count
#cat /d/pm_debug/time > /tmp/p/time
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name > /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/time >> /data/tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/name >> /data/tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/name > /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/time >> /data/tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/name >> /data/tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state > /data/tmp/p/stats.txt

#echo "=========" >> /data/tmp/p/count
#echo "=========" >> /data/tmp/p/time
echo "=========" >> /data/tmp/p/cpu0.txt
echo "=========" >> /data/tmp/p/cpu1.txt
echo "=========" >> /data/tmp/p/stats.txt
cat /d/rpm_stats > /data/tmp/p/rpm_stats_pre.txt
cat /proc/interrupts > /data/tmp/p/irq_pre.txt

#/data/powertop -d -t $2 > /data/tmp/p/powertop.txt
echo 1 > /proc/timer_stats
top -n 1 -d $2 -s cpu > /data/tmp/p/top.txt

cat /proc/interrupts >> /data/tmp/p/irq_post.txt

ps > /data/tmp/p/ps-post.txt

cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state >> /data/tmp/p/stats.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/time >> /data/tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/name >> /data/tmp/p/cpu0.txt
#cat /sys/devices/system/cpu/cpu0/cpuidle/state3/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/time >> /data/tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/name >> /data/tmp/p/cpu1.txt
#cat /sys/devices/system/cpu/cpu1/cpuidle/state3/time >> /data/tmp/p/cpu1.txt

#cat /d/pm_debug/count >> /tmp/p/count
#cat /d/pm_debug/time >> /tmp/p/time

#cat /d/tracing/trace > /tmp/p/trace.txt

#dmesg > /tmp/p/dmesg.txt
echo "" > /d/tracing/set_event

cat /d/rpm_stats > /data/tmp/p/rpm_stats_post.txt
cat /proc/timer_stats > /data/tmp/p/timer_stats.txt


