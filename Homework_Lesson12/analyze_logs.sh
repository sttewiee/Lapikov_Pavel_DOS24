#!/bin/bash

# Указываем путь к лог-файлу
LOGFILE="server.log"

# Извлекаем все IP-адреса с кодом ответа 200
echo "Successful logins (IP addresses):"
grep "status=200" $LOGFILE | awk -F "ip=" '{print $2}' | awk -F " status" '{print $1}' | sort | uniq

# Извлекаем всех уникальных пользователей с кодом ответа 403
echo
echo "Users with failed logins:"
grep "status=403" $LOGFILE | awk -F "user=" '{print $2}' | awk -F " ip=" '{print $1}' | sort | uniq
