#!/bin/bash

# Get the parent directory
BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="$(dirname "$BINDIR")"

# Adjust to base path when this library is installed using composer
DIR=${DIR/\/vendor\/peterrehm\/test}

# Prepare the build directories
mkdir -p $DIR/build
cd $DIR

$DIR/bin/phpcs --standard=BINDIR/../phpcs.xml $DIR/src/ --extensions=php --report=checkstyle --report-file=$DIR/build/phpcs.xml --ignore=Tests
$DIR/bin/phpcpd --names="*.php" $DIR/src/ --log-pmd=$DIR/build/pmd-cpd.xml --exclude=Tests
$DIR/bin/phpmd $DIR/src/ xml codesize,unusedcode --reportfile $DIR/build/pmd.xml --exclude Tests
