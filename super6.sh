#!/bin/sh

# Ubuntu 16.04 LTS / Ubuntu 18.04 LTS
# CONFIGURE THE FOLLOWING SECTION 
# --------------------------------------------
project_name="bharat"
project_password="password"
project_ip="127.0.0.1:8000"
project_domain="104.196.68.173"

sudo su << EOFSU
# Configure gunicorn on supervisor
echo "[DJANGOGO] CONFIGURING SUPERVISOR FOR GUNICORN..."
cat << EOF >> /etc/supervisor/conf.d/$project_name.conf
[program:$project_name]
command=/home/$project_name/bin/gunicorn_start
user=$project_name
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/home/$project_name/logs/gunicorn-error.log
EOF
EOFSU
