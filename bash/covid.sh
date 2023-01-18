#!/bin/bash
# This script downloads covid data and displays it

DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA | jq '.[0].positive')
PENDING=$(echo $DATA | jq '.[0].pending')
DEATHINCREASE=$(echo $DATA | jq '.[0].deathIncrease')
HOSPINCREASE=$(echo $DATA | jq '.[0].hospitalizedIncrease')
TODAY=$(date)

echo "On $TODAY, there were $POSITIVE positive COVID cases, $PENDING pending results, and $DEATHINCREASE more deaths. Additionally, hospitalizations have increased by $HOSPINCREASE today."
