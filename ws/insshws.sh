#!/bin/bash

# Installer WebSocket tunneling
cd

# Install Python
apt install python -y

# Remove old scripts if they exist
rm -f /usr/local/bin/edu-proxy
rm -f /usr/local/bin/ws-dropbear
rm -f /usr/local/bin/ws-stunnel

# Remove old service files if they exist
rm -f /etc/systemd/system/edu-proxy.service
rm -f /etc/systemd/system/ws-dropbear.service
rm -f /etc/systemd/system/ws-stunnel.service

# Download new WebSocket-SSH Python scripts
wget -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/Azigaming404/websocket/main/openssh.py && chmod +x /usr/local/bin/edu-proxy
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/LunaticBackend/vpnscript/mytich/ws/dropbear-ws.py.txt && chmod +x /usr/local/bin/ws-dropbear
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/LunaticBackend/vpnscript/mytich/ws/ws-stunnel.txt && chmod +x /usr/local/bin/ws-stunnel

# Set permissions
chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel

# Download new systemd service files
wget -O /etc/systemd/system/edu-proxy.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/http.service && chmod +x /etc/systemd/system/edu-proxy.service
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/LunaticBackend/vpnscript/mytich/ws/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/LunaticBackend/vpnscript/mytich/ws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

# Reload systemd daemon to recognize new services
systemctl daemon-reload

# Enable, start, and restart the ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

# Enable, start, and restart the ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

# Optionally, if you need the edu-proxy service, uncomment the following lines
# systemctl enable edu-proxy.service
# systemctl start edu-proxy.service
# systemctl restart edu-proxy.service

clear