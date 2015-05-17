#!/bin/bash

echo "#####################################"
echo "#        Wordpress installer        #"
echo "#        Made by Rick Bakker        #"
echo "#         RickB2000@GitHub          #"
echo "#####################################"


directory=.
dbname=.
dbuser=.
dbpass=.
if [ $# != 4 ]
  then
    echo "Wrong notation."
    echo "Please use: ./wp_install.sh [directory] [mysql_db] [mysql_user] [mysql_password]"
    exit
fi

directory=$1
dbname=$2
dbuser=$3
dbpass=$4

if [ ! -d "$directory" ]; then
  mkdir -p $directory
fi

cd $directory

curl -O https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
cd wordpress
cp -rf . ..
cd ..
rm -R wordpress
cp wp-config-sample.php wp-config.php
perl -pi -e "s/database_name_here/$dbname/g" wp-config.php
perl -pi -e "s/username_here/$dbuser/g" wp-config.php
perl -pi -e "s/password_here/$dbpass/g" wp-config.php
mkdir wp-content/uploads
chmod 777 wp-content/uploads
rm latest.tar.gz
clear

echo "#####################################"
echo "#      Wordpress is installed!      #"
echo "#####################################"
