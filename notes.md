## enable start the timer:
sudo systemctl enable systemd_file.timer
sudo systemctl start systemd_file.timer


## to reload or restart:
sudo systemctl daemon-reload
sudo systemctl restart systemd_file.timer
