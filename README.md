Access using below URL
Magento URL: https://34.251.67.108
Admin Panel: https://34.251.67.108/admin  
PHPMyAdmin: https://34.251.67.108/phpmyadmin

How to run
1. cd Magento-server
2. sudo docker-compose up -d --build
3. sudo docker ps
4. docker exec -it <php-fpm or Container_ID> bash
5. inside php container run below commands at one time
php bin/magento setup:install \
  --base-url=https://34.251.67.108/ \
  --db-host=mysql \
  --db-name=magento \
  --db-user=magento \
  --db-password=magento \
  --admin-firstname=Admin \
  --admin-lastname=User \
  --admin-email=admin@example.com \
  --admin-user=admin \
  --admin-password=Admin123 \
  --language=en_US \
  --currency=USD \
  --timezone=Asia/Kolkata \
  --use-rewrites=1 \
  --backend-frontname=admin \
  --elasticsearch-host=elasticsearch \
  --elasticsearch-port=9200


Folder structure:
magento-docker/
├── docker-compose.yml
├── nginx/
│   └── default.conf
├── php/
│   └── Dockerfile
├── varnish/
│   └── default.vcl
├── ssl/
│   ├── magento.crt
│   └── magento.key
├── data/
│   └── db/  (MySQL volume)
├── html/
│   └── (Magento source code)
└── README.md

use github URL to check the source code: 

