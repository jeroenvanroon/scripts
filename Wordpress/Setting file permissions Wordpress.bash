#Execute the following commands in the root of the Wordpress folder
sudo find . -type f -exec chmod 664 {} +
sudo find . -type d -exec chmod 775 {} +
sudo chmod 660 wp-config.php
#Execute the following to set the ownership right
sudo chown -R www-data:www-data /var/www/sitefolder/