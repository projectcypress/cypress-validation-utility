#!/bin/bash
set -e

exec unicorn -c config/unicorn.rb -p 3000

exec "$@"
