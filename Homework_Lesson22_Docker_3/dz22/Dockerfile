# Шаг 2: Указываем базовый образ
FROM ubuntu:20.04

# Шаг 3: Устанавливаем зависимости
RUN apt-get update && \
    apt-get install -y nginx curl && \
    mkdir -p /app/static

# Шаг 4: Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Шаг 5: Копируем статические файлы
COPY ./static /app/static

# Шаг 6: Открываем порт 8080
EXPOSE 8080

# Шаг 7: Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
