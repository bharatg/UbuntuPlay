#!/bin/sh

# Ubuntu 16.04 LTS / Ubuntu 18.04 LTS
# CONFIGURE THE FOLLOWING SECTION 
# --------------------------------------------
project_name="bharat"
project_password="password"
project_ip="127.0.0.1:8000"
project_domain="104.196.68.173"


# Create Postgres
echo "[DJANGOGO] INSTALL & CONFIGURE POSTGRES..."
sudo apt-get -y install postgresql postgresql-contrib
database_prefix=$project_name
database_suffix="_prod"
database_name=$database_prefix$database_suffix
sudo su << EOFSU
su postgres<<EOF
cd ~
createuser $project_name
createdb $database_name --owner $project_name
psql -c "ALTER USER $project_name WITH PASSWORD '$project_password'"
EOF
EOFSU
