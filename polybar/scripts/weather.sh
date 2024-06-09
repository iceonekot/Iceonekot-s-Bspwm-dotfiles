#!/bin/bash

API_KEY="138ec1ada8ee47a0a60192037240406"
LOCATION="Poltava"

WEATHER_URL="http://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${LOCATION}&aqi=no"

weather=$(curl -sf ${WEATHER_URL})

if [ ! -z "$weather" ]; then
    weather_temp=$(echo $weather | jq ".current.temp_c" | cut -d "." -f 1)
    weather_desc=$(echo $weather | jq -r ".current.condition.text")

    echo "${weather_temp}°C"
else
    echo "N/A"
fi
