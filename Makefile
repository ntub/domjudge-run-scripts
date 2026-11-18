.DEFAULT_GOAL := print-steps
.PHONY: print-steps config

define STEPS
DOMjudge 部署步驟（請在 repo 根目錄執行）

[系統初始化]
  ./0_setup_os.sh                  安裝基本套件；GRUB cgroup 參數需手動修改，update-grub 後 reboot
  ./1_setup_docker.sh              移除舊套件、安裝 Docker、加入 docker 群組（完成後重新登入）
  ./2_setup_ufw.sh                 啟用 ufw（只開 SSH），會自動 reboot

[設定]
  make config                      產生 _config.sh（DB 與 judgehost 密碼皆為亂數；已存在則略過）
                                   使用 Traefik 時請修改 DOMSERVER_DOMAIN、TRAEFIK_DOMSERVER_MODE

[Docker 資源]
  ./3_sutup_docker_network.sh
  ./4_pull_docker_image.sh
  ./5_setup_docker_volume.sh

[服務]
  ./A_db.sh
  ./B_domserver.sh
  ./X_caddy.sh 或 ./X_traefik.sh   反向代理二擇一
  ./Z_get_user_info.sh             取得 admin 初始密碼
  登入 domserver 網頁              修改 admin 密碼；將 judgehost 帳號密碼改為 _config.sh 的 JUDGEDAEMON_PASSWORD
  for i in 0 1 2 3; do ./C_judgehost.sh $$i; done
endef
export STEPS

print-steps:
	@echo "$$STEPS"

config:
	@./_gen_config.sh
