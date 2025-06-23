#!/bin/bash

if [ ! -f /var/www/html/index.php ]; then
  composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.8-p1 .
  php bin/magento setup:install \
  --base-url=http://34.251.67.108/ \
  --db-host=mysql \
  --db-name=magento \
  --db-user=magento \
  --db-password=magento \
  --admin-firstname=admin \
  --admin-lastname=user \
  --admin-email=prajktalondhe13@gmail.com \ \
  --admin-user=Prajkta  \
  --admin-password=Prajkta@2000 \
  --search-engine=elasticsearch7 \
  --elasticsearch-host=elasticsearch \
  --backend-frontname=admin
fi

php-fpm
