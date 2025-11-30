set -e

echo '參考: https://www.domjudge.org/docs/manual/7.3/install-judgehost.html#linux-control-groups'
echo '要注意對應的 DOMjudge 版本！'

echo 'OPEN FILE: /etc/default/grub'
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet cgroup_enable=memory swapaccount=1 systemd.unified_cgroup_hierarchy=0"'
echo 'RUN: update-grub'
echo 'RUN: reboot'
echo 'RUN: cat /proc/cmdline'

echo 'Install packages'
sudo apt install -y vim htop tmux tree bash-completion ufw git netcat-openbsd iputils-ping
