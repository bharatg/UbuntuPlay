#!/bin/sh

sudo su << EOFSU 
cd /root

# Create project user, venv, and setup django
echo "[DJANGOGO] CREATING PROJECT USER, VENV & SETTING UP DJANGO..."
adduser $project_name
gpasswd -a $project_name sudo

# Django setup as project user
su $project_name<<EOF
cd /home/$project_name
python3 -m venv .
source bin/activate
pip install Django
django-admin startproject project
mv project $project_name
cd $project_name
cd project
sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = ['$project_ip']/" settings.py
cd ..
django-admin startapp main
pip install gunicorn
EOF
EOFSU 
