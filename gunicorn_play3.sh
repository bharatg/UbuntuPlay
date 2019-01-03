#!/bin/sh

# Ubuntu 16.04 LTS / Ubuntu 18.04 LTS
# CONFIGURE THE FOLLOWING SECTION 
# --------------------------------------------
project_name="bharat"
project_password="password"
project_ip="127.0.0.1:8000"
project_domain="104.196.68.173"

sudo su << EOFSU
# Create gunicorn_start file
echo "[DJANGOGO] CONFIGURING GUNICORN..."
cd /home/$project_name/bin
sudo cat << EOF >> gunicorn_start
#!/bin/bash
NAME="$project_name"
DIR=/home/$project_name/$project_name
USER=$project_name
GROUP=$project_name
WORKERS=3
BIND=unix:/home/$project_name/run/gunicorn.sock
DJANGO_SETTINGS_MODULE=project.settings
DJANGO_WSGI_MODULE=project.wsgi
LOG_LEVEL=error
cd \$DIR
source /home/$project_name/bin/activate
export DJANGO_SETTINGS_MODULE=\$DJANGO_SETTINGS_MODULE
export PYTHONPATH=\$DIR:\$PYTHONPATH
exec /home/$project_name/bin/gunicorn \${DJANGO_WSGI_MODULE}:application \\
  --name \$NAME \\
  --workers \$WORKERS \\
  --user=\$USER \\
  --group=\$GROUP \\
  --bind=\$BIND \\
  --log-level=\$LOG_LEVEL \\
  --log-file=-
EOF
EOFSU
