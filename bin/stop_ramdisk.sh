#!/bin/bash

sudo service mysql stop
sudo unlink /var/lib/mysql
sudo mv /tmp/ramdisk/mysql /var/lib/mysql
sudo chmod -R 700 /var/lib/mysql
sudo chown -R mysql:mysql /var/lib/mysql
sudo umount /tmp/ramdisk
sudo rm -rf /tmp/ramdisk
sudo service mysql start
