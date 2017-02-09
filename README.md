php-test
========

This library aims to ease the test setup of standard PHP projects using PHPUnit 
and Behat using a phing build file.

Setup
-----

- Include this library using composer

````php
    composer require peterrehm/php-test --dev
````

- Copy the sample build file into your project root

````sh
   (project-root) $ cp vendor/peterrehm/php-test/build_local.xml build.xml
````

- Set up the test scripts

Create bin/run_tests.sh and bin/run_static_analysis.sh. The simplest version would
be as follows:

````sh
# bin/run_static_analysis.sh
#!/bin/bash
vendor/peterrehm/php-test/bin/run_static_analysis.sh

# bin/run_tests.sh
#!/bin/bash
vendor/peterrehm/php-test/bin/run_tests.sh coverage no-behat
````
Of course you could just copy from those files and add whatever logic you need
to it. As it is common to need custom test preparations you can pass a third
parameter to run tests with a custom script name.

If no script is provided a simple composer install will be executed. If you
provide a custom script make sure to manually run the composer install.

````
# bin/run_tests.sh
#!/bin/bash
vendor/peterrehm/php-test/bin/run_tests.sh coverage no-behat /my/custom/script.sh
````
This command will be executed prior to the test execution.
