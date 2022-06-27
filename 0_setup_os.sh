set -e

echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet cgroup_enable=memory swapaccount=1"'
echo 'RUN: update-grub'
