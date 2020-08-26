#!/bin/bash

echo $3

username=$3

# Reset Wordpress Installation
echo "Reseting Wordpress installation..."
sudo -u $username -i -- wp db reset --yes

# Install Wordpress
echo "Installing Wordpress..."
sudo -u $username -i -- wp core install --url=$1 --title=$2 --admin_user=$3 --admin_password=$4 --admin_email=store@impactzero.pt

# Remove demo content
echo "Removing demo content..."
sudo -u $username -i -- wp post delete 1 --force

# Apply user customization
echo "Applying user customization..."
sudo -u $username -i -- wp language core install $5
sudo -u $username -i -- wp site switch-language $5

# Install required plugins
echo "Installing required plugins..."
sudo -u $username -i -- wp plugin install woocommerce --activate

echo "Done!"
