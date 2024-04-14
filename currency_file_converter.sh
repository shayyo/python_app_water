#!/usr/bin/env bash

rm -f tmp.xml

IFS=$'\n'

file=${1}

#BASE_CURRENCY=$(xmllint --format ${file} | grep "Series SERIES_CODE" | tr -s " " | cut -d " " -f 5)
BASE_CURRENCY=$(xmllint --format ${file} | grep "Series SERIES_CODE" | tr -s " " | cut -d " " -f 5 | tr -d "\"")
BASE_CURRENCY_2=$(xmllint --format ${file} | grep "Series SERIES_CODE" | tr -s " " | cut -d " " -f 5 | tr -d "\"" | cut -d "=" -f 2)
#COUNTER_CURRENCY=$(xmllint --format ${file} | grep "Series SERIES_CODE" | tr -s " " | cut -d " " -f 6)
COUNTER_CURRENCY=$(xmllint --format ${file} | grep "Series SERIES_CODE" | tr -s " " | cut -d " " -f 6 | tr -d "\"")
UNIT_MEASURE=$(xmllint --format ${file} | grep "Series SERIES_CODE" | tr -s " " | cut -d " " -f 7)

xmllint --format ${file} | grep "s TIME_PERIOD" | tr -s " " | cut -d " " -f 3,4 | cut -d "=" -f 2,3 | tr -d "OBS_VALUE/>=\"" | grep -E "^199" > tmp.xml
xmllint --format ${file} | grep "s TIME_PERIOD" | tr -s " " | cut -d " " -f 3,4 | cut -d "=" -f 2,3 | tr -d "OBS_VALUE/>=\"" | grep -E "^20" >> tmp.xml

for i in $(cat tmp.xml); do
  date=$(echo "${i}" | cut -d " " -f 1)
  rate=$(echo "${i}" | cut -d " " -f 2)
  #echo "DATE=${date} | ${BASE_CURRENCY} | ${COUNTER_CURRENCY} | ${rate}"
  echo "${date}_${BASE_CURRENCY_2} \"DATE=${date} | ${BASE_CURRENCY} | ${COUNTER_CURRENCY} | ${rate}\""
done
