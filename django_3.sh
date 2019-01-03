#!/bin/sh
project_name="bharat"
project_password="password"
project_ip="127.0.0.1:8000"
project_domain="104.196.68.173"
cd /root

# Create project user, venv, and setup django
echo "[DJANGOGO] CREATING PROJECT USER, VENV & SETTING UP DJANGO..."
sudo adduser  --disabled-password $project_name 
sudo gpasswd -a $project_name sudo

# Django setup as project user
sudo su $project_name<<EOF
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
