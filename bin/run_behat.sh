#!/bin/bash

/usr/local/bin/phantomjs --webdriver=8643 > /dev/null &
/vagrant/bin/behat -c '/vagrant/app/config/behat.yml' "$@"
killall -9 phantomjs
