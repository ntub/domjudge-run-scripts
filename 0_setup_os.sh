#!/usr/bin/env bash
set -euo pipefail

echo 'Install packages'
sudo apt install -y vim htop tmux tree bash-completion ufw git netcat-openbsd iputils-ping

echo
echo '========== GRUB cgroup 設定（需手動修改）=========='
echo '請參考文件（注意對應的 DOMjudge 版本）:'
echo '  https://www.domjudge.org/docs/manual/8.3/install-judgehost.html#linux-control-groups'
echo
echo '如果文件沒有更新，請將 /etc/default/grub 改成:'
echo '  GRUB_CMDLINE_LINUX_DEFAULT="quiet cgroup_enable=memory swapaccount=1 systemd.unified_cgroup_hierarchy=0"'
echo

systemd_version="$(systemctl --version 2>/dev/null | awk 'NR==1 {print $2}' || true)"
if [[ "${systemd_version}" =~ ^[0-9]+$ ]] && (( systemd_version >= 257 )); then
  echo "注意: 目前 systemd 版本為 ${systemd_version}（>= 257），依文件說明還需要加上 SYSTEMD_CGROUP_ENABLE_LEGACY_FORCE=1"
  echo '      否則可能無法使用 cgroup v1，請參考文件確認設定方式'
  echo
fi
echo '接著執行:'
echo '  sudo update-grub'
echo '  sudo reboot'
echo '  cat /proc/cmdline   # 確認參數已生效'
