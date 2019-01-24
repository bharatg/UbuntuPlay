#!/bin/bash
sudo apt-get install nginx

sudo mkdir /usr/share/nginx/test.com


cat << EOF >> /usr/share/nginx/test.com/index.html
<h1>hi, testing Nginx.</h1>
EOF


cat << EOF >> /etc/nginx/sites-available/test.com
server {
	listen 80;

	root /usr/share/nginx/test.com;
	index index.html index.htm;

	server_name test.com;

	location / {
		try_files $uri $uri/ =404;
	}

}
EOF

sudo ln -s /etc/nginx/sites-available/test.com /etc/nginx/sites-enabled/test.com

sudo service nginx restart

