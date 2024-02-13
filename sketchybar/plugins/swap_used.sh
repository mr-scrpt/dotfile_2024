#!/bin/bash

# Получаем вывод команды sysctl vm.swapusage
swap_info=$(sysctl vm.swapusage)

# Извлекаем значение "total" с помощью awk
total_swap=$(echo "$swap_info" | awk -F'=|M' '/total/ {print $2}')

sketchybar --set $NAME label="$total_swap MB"

