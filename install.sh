#!/bin/bash

username=esfomeado

# Reset Wordpress Installation
echo "Reseting Wordpress installation..."
sudo -u $username -i -- wp db reset --yes

# Install Wordpress
echo "Installing Wordpress..."
sudo -u $username -i -- wp core install --url=$1 --title=$2 --admin_user=admin --admin_password=admin --admin_email=matatu31@gmail.com

# Remove demo content
echo "Removing demo content..."
sudo -u $username -i -- wp post delete 1 --force

# Apply user customization
echo "Applying user customization..."
sudo -u $username -i -- wp language core install $3
sudo -u $username -i -- wp language core activate $3

# Install required plugins
echo "Installing required plugins..."
sudo -u $username -i -- wp plugin install woocommerce --activate

echo "Done!"
