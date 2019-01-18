sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx

read -p "enter the site2be1 secured" site1
read -p "enter the site2be2 secured" site2
sudo certbot --nginx -d $site1 -d $site2
