#!/bin/bash

# Проверка на наличие параметров
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <category> <id>"
    echo "Categories: people, planets, films"
    exit 1
fi

# Входные параметры
CATEGORY="$1" # Категория: people, planets, films
ID="$2"       # ID в указанной категории

# Формирование URL
API_URL="https://swapi.dev/api/$CATEGORY/$ID/"

# Отправляем запрос к API и получаем ответ в формате JSON
RESPONSE=$(curl -s "$API_URL")

# Проверяем, если запрос успешен
if [ $? -ne 0 ]; then
    echo "Ошибка при запросе данных к API."
    exit 1
fi

# Обработка данных в зависимости от категории
if [ "$CATEGORY" == "people" ]; then
    if [ "$RESPONSE" != "null" ]; then
        echo "Информация о персонаже:"
        echo "Имя: $(echo $RESPONSE | jq -r '.name')"
        echo "Рост: $(echo $RESPONSE | jq -r '.height') см"
        echo "Масса: $(echo $RESPONSE | jq -r '.mass') кг"
        echo "Цвет волос: $(echo $RESPONSE | jq -r '.hair_color')"
        echo "Цвет кожи: $(echo $RESPONSE | jq -r '.skin_color')"
        echo "Цвет глаз: $(echo $RESPONSE | jq -r '.eye_color')"
        echo "Год рождения: $(echo $RESPONSE | jq -r '.birth_year')"
        echo "Пол: $(echo $RESPONSE | jq -r '.gender')"
    else
        echo "Персонаж с ID $ID не найден."
    fi
elif [ "$CATEGORY" == "planets" ]; then
    if [ "$RESPONSE" != "null" ]; then
        echo "Информация о планете:"
        echo "Название: $(echo $RESPONSE | jq -r '.name')"
        echo "Диаметр: $(echo $RESPONSE | jq -r '.diameter') км"
        echo "Климат: $(echo $RESPONSE | jq -r '.climate')"
        echo "Гравитация: $(echo $RESPONSE | jq -r '.gravity')"
        echo "Поверхность воды: $(echo $RESPONSE | jq -r '.surface_water')%"
        echo "Население: $(echo $RESPONSE | jq -r '.population')"
    else
        echo "Планета с ID $ID не найдена."
    fi
elif [ "$CATEGORY" == "films" ]; then
    if [ "$RESPONSE" != "null" ]; then
        echo "Информация о фильме:"
        echo "Название: $(echo $RESPONSE | jq -r '.title')"
        echo "Эпизод: $(echo $RESPONSE | jq -r '.episode_id')"
        echo "Режиссер: $(echo $RESPONSE | jq -r '.director')"
        echo "Продюсеры: $(echo $RESPONSE | jq -r '.producer')"
        echo "Дата выпуска: $(echo $RESPONSE | jq -r '.release_date')"
    else
        echo "Фильм с ID $ID не найден."
    fi
else
    echo "Неверная категория. Доступные категории: people, planets, films."
    exit 1
fi

