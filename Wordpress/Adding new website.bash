sudo mkdir /var/www/website.nl
cp /etc/apache2/sites-available/website.nl.conf /etc/apache2/sites-available/website.nl.conf
vim /etc/apache2/sites-available/website.nl.conf

#Now place website in folder
sudo a2ensite website.nl.conf
sudo certbot --apache