#!/bin/bash

# Получаем информацию о виртуальной памяти
vm_stats=$(vm_stat)

# Извлекаем количество свободных страниц (в 4K блоках)
free_page=$(echo "$vm_stats" | awk '/Pages free:/ {print $3}')
active_page=$(echo "$vm_stats" | awk '/Pages active:/ {print $3}')

# Преобразуем количество свободных страниц в мегабайты
free_mb=$(echo "scale=0; $free_page * 16384 / 1024/ 1024" | bc)
active_mb=$(echo "scale=0; $active_page * 16384 / 1024/ 1024" | bc)

aval=$(echo "$active_mb + $free_mb" | bc)

sketchybar --set $NAME label="$aval MB"

# echo "Available: $aval"
# echo "Free: $free"
