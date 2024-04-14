#!/bin/bash

IFS=$'\t\n'

redis-server /redis-master/redis.conf

curl -s https://raw.githubusercontent.com/shayyo/python_app_water/main/currency_data.txt | redis-cli 

