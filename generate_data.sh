#!/bin/bash
let DIFF=(`date +%s`-`date +%s -d "20210619"`)/-86400
rm words.txt
for (( i=$DIFF ; i <= 30 ; i++));
do
  dt=$(date -d "$i days" +%F)
  val=$(curl -s https://www.nytimes.com/svc/wordle/v2/$dt.json | jq -r '"\"" + .solution + "\","')
  if [ $val != "\"\"," ]
  then
    echo $val >> words.txt
  else
    break
  fi
done
