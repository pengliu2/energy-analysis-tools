#!/bin/sh
echo 0 > /sys/module/ct406/parameters/als_enable
umount /data/tmp/p
mount -t debugfs d /d/
mkdir /data/tmp/p
rm -r /data/tmp/p/*
mount -t tmpfs tmpfs /data/tmp/p
#mount -t debugfs d /d/

echo nop > /d/tracing/current_tracer
echo 1 > /d/tracing/tracing_on

#echo 0 > /sys/devices/platform/msm_serial_hsl.0/console
#echo 0 > /d/clk/gsbi5_uart_clk/enable

sleep $1

cat /sys/devices/system/cpu/cpu1/cpuidle/state7/time > /data/tmp/p/cpu1_7_time.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state7/time > /data/tmp/p/cpu0_7_time.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state7/usage > /data/tmp/p/cpu1_7_usage.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state7/usage > /data/tmp/p/cpu0_7_usage.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state5/time > /data/tmp/p/cpu1_5_time.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state5/time > /data/tmp/p/cpu0_5_time.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state5/usage > /data/tmp/p/cpu1_5_usage.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state5/usage > /data/tmp/p/cpu0_5_usage.txt

cat /d/mid_pmu_states > /data/tmp/p/mid_pmu_states.txt

#echo test > /sys/power/wake_lock
dmesg > /data/tmp/p/d_b.txt

echo "soc_s0ix_idle" > /d/tracing/set_ftrace_filter
echo "mid_s0ix_enter" >> /d/tracing/set_ftrace_filter
echo "pmu_set_s0ix_complete" >> /d/tracing/set_ftrace_filter
echo "pmu_pci_set_power_state" >> /d/tracing/set_ftrace_filter
echo "pci_platform_power_transition" >> /d/tracing/set_ftrace_filter

echo "function" > /d/tracing/current_tracer

sleep $2

echo 0 > /d/tracing/tracing_on

cat /d/mid_pmu_states >> /data/tmp/p/mid_pmu_states.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state7/time >> /data/tmp/p/cpu1_7_time.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state7/time >> /data/tmp/p/cpu0_7_time.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state7/usage >> /data/tmp/p/cpu1_7_usage.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state7/usage >> /data/tmp/p/cpu0_7_usage.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state5/time >> /data/tmp/p/cpu1_5_time.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state5/time >> /data/tmp/p/cpu0_5_time.txt
cat /sys/devices/system/cpu/cpu1/cpuidle/state5/usage >> /data/tmp/p/cpu1_5_usage.txt
cat /sys/devices/system/cpu/cpu0/cpuidle/state5/usage >> /data/tmp/p/cpu0_5_usage.txt

dmesg > /data/tmp/p/d_a.txt
