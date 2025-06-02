#!/bin/bash

# Проверяем, работает ли bluetooth
if ! systemctl is-active --quiet bluetooth; then
    echo "Bluetooth сервис не запущен"
    exit 1
fi

# Сканируем устройства
echo "Запуск сканирования Bluetooth устройств..."
bluetoothctl scan on &
SCAN_PID=$!
sleep 10  # Даем время на сканирование
kill $SCAN_PID

# Получаем список устройств
echo -e "\nДоступные Bluetooth устройства:"
bluetoothctl devices | awk '{print $2" "$3}'

# Альтернативный вариант с более подробной информацией
# bluetoothctl devices | while read -r _ mac name; do
#     echo "$name ($mac)"
# done
