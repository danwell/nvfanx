# nvfanx makefile

help:
	@echo "Available recipies:"
	@echo ""
	@echo "   systemd-install"
	@echo "       Installs this script and systemd service"
	@echo "   systemd-uninstall"
	@echo "       Stops and disables systemd service and uninstalls script and service"
	@echo ""
.PHONY: help

systemd-install:
	cp nvfanx.service /lib/systemd/system/nvfanx.service
	cp nvfanx /usr/local/bin/nvfanx
	systemctl --system daemon-reload
.PHONY: install
	
systemd-uninstall:
	systemctl stop nvfanx.service
	systemctl disable nvfanx.service
	rm /lib/systemd/system/nvfanx.service
	rm /usr/local/bin/nvfanx
	systemctl --system daemon-reload
.PHONY: uninstall

