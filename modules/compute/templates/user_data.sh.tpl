#!/bin/bash
apt-get update -y
apt-get install -y nginx

echo "<h1>Instance: ${project_name}-${instance_index}</h1>" > /var/www/html/index.html

systemctl enbale nginx
systemctl start nginx