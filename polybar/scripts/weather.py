#!/bin/bash

API_KEY="b1a9ab4c16844468b1d190907240406"
LOCATION="Poltava"

WEATHER_URL="http://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${LOCATION}&aqi=no"

weather=$(curl -sf ${WEATHER_URL})

if [ ! -z "$weather" ]; then
    weather_temp=$(echo $weather | jq ".current.temp_c" | cut -d "." -f 1)
    weather_desc=$(echo $weather | jq -r ".current.condition.text")

    echo "${weather_temp}°C - ${weather_desc}"
else
    echo "N/A"
fi
