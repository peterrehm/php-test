#!/bin/bash
# Usage ./run-tests [coverage|no-coverage] [behat|no-behat] [/custom/init/file.sh]

## Define if Coverage is wanted. If script is executed with coverage option
## Coverage will be created
coverage=0
if [ "$1" == "coverage" ]; then
   coverage=1
fi

## Define if Behat is wanted. If script is executed with coverage option
## Coverage will be created
behat=0
if [ "$2" == "behat" ]; then
   behat=1
fi

# Get the parent directory
BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="$(dirname "$BINDIR")"

# Adjust to base path when this library is installed using composer
DIR=${DIR/\/vendor\/peterrehm\/php-test}

# Prepare the build directories
mkdir -p $DIR/build
mkdir -p $DIR/build/tests
mkdir -p $DIR/build/tests/coverage
cd $DIR

# Install the latest composer dependencies
composer install

# If a custom file has been provided execute that prior to executing the tests
if [ -f "$3" ]; then
  eval $3
fi

## execute the tests
if [ "$coverage" == 0 ]; then
    $DIR/bin/phpunit --log-junit "$DIR/build/tests/phpunit.xml"&
else
    php -d zend_extension=xdebug.so -d xdebug.profiler_enable=on $DIR/bin/phpunit --log-junit "$DIR/build/tests/phpunit.xml" --coverage-clover "$DIR/build/clover.xml" --coverage-crap4j "$DIR/build/crap4j.xml"  --coverage-html "$DIR/build/tests/coverage/"
fi

if [ "$behat" == 0 ]; then
    $BINDIR/run_behat.sh --format=progress --format=junit > "$DIR/build/tests/behat.log'&
fi

wait
cat $DIR/build/tests/behat.log
