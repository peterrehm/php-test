#!/bin/bash
google-chrome --version
google-chrome --headless --disable-gpu --disable-popup-blocking --remote-debugging-port=9222 https://www.chromestatus.com &
/vagrant/bin/behat -c '/vagrant/app/config/behat.yml' "$@"
killall -9 chrome
