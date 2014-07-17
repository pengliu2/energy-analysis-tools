#!/bin/sh
umount /data/tmp/p
mkdir -p /data/tmp/p
rm -r /data/tmp/p/*
mount -t tmpfs tmpfs /data/tmp/p
mount -t debugfs d /d/

#echo 0 > /sys/devices/platform/msm_serial_hsl.0/console
#echo 0 > /d/clk/gsbi5_uart_clk/enable

echo 0 > /d/tracing/tracing_on

echo 16384 > /d/tracing/buffer_size_kb

#echo "power:cpu_idle" >> /d/tracing/set_event
#echo "sched:sched_process_fork" >> /d/tracing/set_event
#echo "power:power_start" >> /d/tracing/set_event
#echo "power:power_end" >> /d/tracing/set_event
#echo "sched:sched_switch" >> /d/tracing/set_event
#echo "power:cpu_frequency" >> /d/tracing/set_event
#echo "power:power_frequency" >> /d/tracing/set_event
#echo "power:clock_set_rate" >> /d/tracing/set_event
#echo "irq:irq_handler_entry" >> /d/tracing/set_event
#echo "timer:timer_expire_entry" >> /d/tracing/set_event
#echo "timer:hrtimer_expire_entry" >> /d/tracing/set_event

#echo "msm_low_power" > /d/tracing/set_event
#echo "msm_bus" >> /d/tracing/set_event
#
echo "power:clock_set_rate" > /d/tracing/set_event
echo "power:clock_disable" >> /d/tracing/set_event
echo "power:clock_enable" >> /d/tracing/set_event
#echo "rpm_smd" >> /d/tracing/set_event
echo "regulator" >> /d/tracing/set_event
echo "msm_low_power" >> /d/tracing/set_event
echo "power:machine_suspend" >> /d/tracing/set_event
echo "workqueue" >> /d/tracing/set_event

cat /d/tracing/set_event
#echo "0 4 0 0" > /proc/sys/kernel/printk
#echo test > /sys/power/wake_lock

#echo 255 > /sys/module/pm_8x60/parameters/debug_mask

sleep $1

dmesg > /data/tmp/p/dmesg1.txt

ps > /data/tmp/p/ps-pre.txt
#cat /d/pm_debug/count > /tmp/p/count
#cat /d/pm_debug/time > /tmp/p/time
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name > /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state3/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state3/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/name > /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state3/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state3/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state0/name > /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state0/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state1/name >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state1/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state2/name >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state2/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state3/name >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state3/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state0/name > /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state0/time >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state1/name >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state1/time >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state2/name >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state2/time >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state3/name >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state3/time >> /data/tmp/p/cpu3.txt

# cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state > /data/tmp/p/stats.txt


#echo "=========" >> /data/tmp/p/count
#echo "=========" >> /data/tmp/p/time
echo "=========" >> /data/tmp/p/cpu0.txt
echo "=========" >> /data/tmp/p/cpu1.txt
echo "=========" >> /data/tmp/p/cpu3.txt
echo "=========" >> /data/tmp/p/cpu4.txt
cat /d/rpm_stats > /data/tmp/p/rpm_stats.txt
echo "=========" >> /data/tmp/p/rpm_stats.txt

cat /d/msm_pm_stats/stats > /data/tmp/p/pm_stats_pre.txt

#cat /proc/wakelocks > /data/tmp/p/wakelocks.txt
cat /proc/interrupts > /data/tmp/p/irq_pre.txt
#/data/powertop -d -t $2 > /data/tmp/p/powertop.txt
echo 1 > /proc/timer_stats
#top -n 1 -d $2 -s cpu > /data/tmp/p/top.txt

echo 1 > /d/tracing/tracing_on
#/system/bin/powertop -dump -t $2 > /data/tmp/p/powertop.txt
sleep $2
#echo 1 > /sys/module/pm_8x60/parameters/debug_mask
cat /d/tracing/trace > /data/tmp/p/trace.txt
echo 0 > /d/tracing/tracing_on

cat /proc/interrupts > /data/tmp/p/irq_post.txt

cat /d/msm_pm_stats/stats > /data/tmp/p/pm_stats_post.txt

#cat /proc/wakelocks >> /data/tmp/p/wakelocks.txt
ps > /data/tmp/p/ps-post.txt

cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state >> /data/tmp/p/stats.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state0/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state1/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state2/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state3/name >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state3/time >> /data/tmp/p/cpu0.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/name > /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state0/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state1/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state2/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state3/name >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state3/time >> /data/tmp/p/cpu1.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state0/name > /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state0/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state1/name >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state1/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state2/name >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state2/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state3/name >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu2/cpuidle/state3/time >> /data/tmp/p/cpu2.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state0/name > /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state0/time >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state1/name >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state1/time >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state2/name >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state2/time >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state3/name >> /data/tmp/p/cpu3.txt
cat /sys/devices/system/cpu/cpu3/cpuidle/state3/time >> /data/tmp/p/cpu3.txt

#cat /d/pm_debug/count >> /tmp/p/count
#cat /d/pm_debug/time >> /tmp/p/time

dmesg > /data/tmp/p/dmesg2.txt
echo "" > /d/tracing/set_event

cat /d/rpm_stats >> /data/tmp/p/rpm_stats.txt
cat /proc/timer_stats > /data/tmp/p/timer_stats.txt


