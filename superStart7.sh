#!/bin/sh

# Ubuntu 16.04 LTS / Ubuntu 18.04 LTS
# CONFIGURE THE FOLLOWING SECTION 
# --------------------------------------------
project_name="bharat"
project_password="password"
project_ip="127.0.0.1:8000"
project_domain="104.196.68.173"

# Restart Supervisor
echo "[DJANGOGO] RESTARTING SUPERVISOR..."
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status $project_name
sudo supervisorctl restart $project_name
