#!/bin/bash

# Получаем информацию о виртуальной памяти
vm_stats=$(vm_stat)

# Извлекаем количество свободных страниц (в 4K блоках)
free_page=$(echo "$vm_stats" | awk '/Pages free:/ {print $3}')
active_page=$(echo "$vm_stats" | awk '/Pages active:/ {print $3}')
inactive_page=$(echo "$vm_stats" | awk '/Pages inactive:/ {print $3}')
speculative_page=$(echo "$vm_stats" | awk '/Pages speculative:/ {print $3}')
# backeng_page=$(echo "$vm_stats" | awk '/File-backed pages:/ {print $3}')
# compressor_page=$(echo "$vm_stats" | awk '/Pages occupied by compressor:/ {print $5}')
# compression_page=$(echo "$vm_stats" | awk '/Compressions:/ {print $2}')

# Преобразуем количество свободных страниц в мегабайты
free_mb=$(echo "scale=0; $free_page * 16384 / 1024/ 1024" | bc)
speculative_mb=$(echo "scale=0; $speculative_page * 16384 / 1024/ 1024" | bc)

free=$(echo "$free_mb - $speculative_mb" | bc)

sketchybar --set $NAME label="$free MB"

# echo "Available: $aval"
# echo "Free: $free"
