#!/bin/bash

clear
echo "Welcome to the Hypixel API command line tool!"
echo "--------------------------------------------"
echo ""

while true; do
  echo "Enter your API key: "
  read var_key
  if [[ -n "$var_key" ]]; then
    break
  fi
  echo "API key cannot be empty, please try again."
done

while true; do
  echo "Enter the type of request (e.g. player): "
  read var_type
  if [[ -n "$var_type" ]]; then
    break
  fi
  echo "Type of request cannot be empty, please try again."
done

var_url="https://api.hypixel.net/$var_type?key=$var_key"

while true; do
  echo "Enter an argument name, or press Enter to stop adding arguments: "
  read var_argname
  if [[ -z "$var_argname" ]]; then
    break
  fi
  echo "Enter the value of $var_argname: "
  read var_argvalue
  if [[ -n "$var_argvalue" ]]; then
    var_url="$var_url&$var_argname=$var_argvalue"
  fi
done

echo ""
echo "Requesting data from: $var_url"
echo ""

var_data=$(curl -s "$var_url")

while true; do
  echo "Enter a jq filter string to filter the results, or type '!' to exit: "
  read var_jq
  if [[ "$var_jq" == "!" ]]; then
    break
  fi
  var_filtered=$(echo "$var_data" | jq "$var_jq")
  echo ""
  echo "$var_filtered" | jq .
  echo ""
done
