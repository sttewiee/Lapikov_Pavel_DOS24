#!/bin/bash

# URL API для получения информации о персонажах (например, Люк Скайуокер)
API_URL="https://swapi.dev/api/people/1/"  # Люк Скайуокер

# Отправляем GET-запрос к API и получаем ответ в формате JSON
RESPONSE=$(curl -s "$API_URL")

# Проверяем, если запрос успешен
if [[ $? -ne 0 ]]; then
    echo "Ошибка при запросе данных с API."
    exit 1
fi

# Используем jq для обработки JSON и извлекаем читаемую информацию
NAME=$(echo "$RESPONSE" | jq -r '.name')
HEIGHT=$(echo "$RESPONSE" | jq -r '.height')
MASS=$(echo "$RESPONSE" | jq -r '.mass')
HAIR_COLOR=$(echo "$RESPONSE" | jq -r '.hair_color')
SKIN_COLOR=$(echo "$RESPONSE" | jq -r '.skin_color')
BIRTH_YEAR=$(echo "$RESPONSE" | jq -r '.birth_year')
GENDER=$(echo "$RESPONSE" | jq -r '.gender')

# Выводим информацию в читаемом виде
echo "Информация о персонаже: $NAME"
echo "Рост: $HEIGHT см"
echo "Масса: $MASS кг"
echo "Цвет волос: $HAIR_COLOR"
echo "Цвет кожи: $SKIN_COLOR"
echo "Год рождения: $BIRTH_YEAR"
echo "Пол: $GENDER"
