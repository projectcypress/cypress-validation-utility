#!/bin/bash
export TMPDIR='/home/cypress/cypress-validation-utility/cache'
export RACK_ENV='production'
export JAVA_OPTS='-Xmx2048m'
cd ~cypress/cypress-validation-utility
. /usr/local/rvm/scripts/rvm
rvm use jruby
torquebox deploy
torquebox run