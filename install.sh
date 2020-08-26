#!/bin/bash

# Reset Wordpress Installation
echo "Reseting Wordpress installation..."
wp db reset --yes

# Install Wordpress
echo "Installing Wordpress..."
wp core install --url=$1 --title=$2 --admin_user=admin --admin_password=admin --=admin_email=matatu31@gmail.com

# Remove demo content
echo "Removing demo content..."
wp post delete 1 --force

# Apply user customization
echo "Applying user customization..."
wp language core install $3
wp language core activate $3

# Install required plugins
echo "Installing required plugins..."
wp plugin install WooCommerce --activate

echo "Done!"
