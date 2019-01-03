#!/bin/sh

# Ubuntu 16.04 LTS / Ubuntu 18.04 LTS
# CONFIGURE THE FOLLOWING SECTION 
# --------------------------------------------
project_name="bharat"
project_password="password"
project_ip="127.0.0.1:8000"
project_domain="104.196.53.61"

echo "[DJANGOGO] UPDATING SYSTEM & INSTALLING DEPENDENCIES..."
sudo apt-get update
sudo apt-get -y upgrade
echo "[DJANGOGO] INSTALL PYTHON 3 & BUILD ESSENTIALS..."
sudo apt-get -y install build-essential libpq-dev python-dev python3-venv libssl-dev
echo "[DJANGOGO] INSTALL NGINX.."
sudo apt-get -y install nginx
echo "[DJANGOGO] INSTALL & CONFIGURE SUPERVISOR.."
sudo apt-get -y install supervisor
sudo systemctl enable supervisor
sudo systemctl start supervisor
sudo apt-get -y install python-virtualenv git
