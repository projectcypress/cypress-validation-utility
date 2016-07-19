#!/bin/bash
set -e

exec rails s -b 0.0.0.0

exec "$@"
