#!/usr/bin/env sh

##################################################
# Takes a text file as input containing a list
# of endpoints to call. Example:
# ./diff.sh endpoints.txt
# Compares the result and returns the difference
# between the result from production server
# and the local vagrant machine
##################################################

# reading the file

file="var/log/$1"
vagrant="http://website.com.vagrant"
production="http://website.com"

while IFS= read -r line
do
  echo "------------\nURL: $line \n------------\n"

  # ----------------------
  # call to vagrant machine
  CT="Content-Type:application/json"

  RESPONSE="curl $vagrant$line -H $CT"

  $RESPONSE > /tmp/vagrant.txt

  echo "-- Vagrant response saved \n"

  # ----------------------
  # call to production server
  CT="Content-Type:application/json"
  RESPONSE="curl $production$line -H $CT"

  $RESPONSE > /tmp/production.txt

  echo "-- Production response saved \n"

  # ----------------------
  # difference between responses
  diff=$(diff /tmp/vagrant.txt /tmp/production.txt)

  echo "DIFF: \n $diff \n\n"

  if [ ! -z "$diff" ]; then
    echo '-------------------- DIFF!!!! \n\n'
    echo $line
    echo $line >> /tmp/diff.txt
  fi


  rm /tmp/vagrant.txt
  rm /tmp/production.txt

done < "$file"

