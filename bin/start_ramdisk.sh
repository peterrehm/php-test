#!/bin/bash

sudo service mysql stop
sudo mkdir /tmp/ramdisk
sudo mount -t tmpfs -o size=512M tmpfs /tmp/ramdisk/
sudo mv /var/lib/mysql /tmp/ramdisk/mysql
sudo ln -s /tmp/ramdisk/mysql/ /var/lib/mysql
sudo chmod -R 700 /var/lib/mysql
sudo chown -R mysql:mysql /var/lib/mysql
sudo service mysql start

