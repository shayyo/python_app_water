#!/bin/bash

IFS=$'\t\n'

redis-server /redis-master/redis.conf 

curl -s https://raw.githubusercontent.com/shayyo/python_app_water/main/database/currency_data.txt > /currency_data.txt && cat /currency_data.txt | redis-cli || echo "Error writing datafile to redis" 

tail -f /dev/null
