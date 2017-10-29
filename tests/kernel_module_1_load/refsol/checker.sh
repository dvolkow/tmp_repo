#!/bin/bash

function print_syslog_related_to_solution {
    magic="kernel_mooc"
    echo "=== Solution logs from printk (only containing \"kernel_mooc\" string) === "
    sudo cat /var/log/syslog  | grep ${magic}
}
trap print_syslog_related_to_solution INT TERM EXIT

echo "Loading module into kernel:"

sudo insmod solution.ko
if [ "$(sudo lsmod | grep solution | wc -l)" -eq "1" ]
then
  echo "Module was successfully loaded"
else
  echo "Module was NOT loaded"
  exit 1
fi

sudo rmmod solution
if [ "$(sudo lsmod | grep solution | wc -l)" -eq "0" ]
then
  echo "Module was successfully removed"
else
  echo "Module was NOT removed"
  exit 1
fi

