#!/bin/bash

# Путь к файлу, где хранится баланс
BALANCE_FILE="$HOME/.wallet_balance"

# Чтение баланса из файла
if [[ -f "$BALANCE_FILE" ]]; then
    BALANCE=$(cat "$BALANCE_FILE")
else
    BALANCE="29"
fi

# Вывод баланса
echo "$BALANCE ₴"
