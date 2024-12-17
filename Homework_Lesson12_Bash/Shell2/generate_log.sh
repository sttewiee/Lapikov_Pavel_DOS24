#!/bin/bash
# Генерация лог-файла
LOGFILE="server.log"
echo "2024-11-26 12:30:15 [INFO] user=johndoe ip=192.168.1.10 status=200" > $LOGFILE
echo "2024-11-26 12:31:03 [INFO] user=alice ip=10.0.0.5 status=403" >> $LOGFILE
echo "2024-11-26 12:35:42 [INFO] user=bob ip=172.16.0.1 status=200" >> $LOGFILE
echo "2024-11-26 12:36:00 [INFO] user=johndoe ip=192.168.1.10 status=403" >> $LOGFILE
echo "2024-11-26 12:40:22 [INFO] user=charlie ip=10.0.0.8 status=403" >> $LOGFILE
echo "2024-11-26 12:42:10 [INFO] user=alice ip=10.0.0.5 status=200" >> $LOGFILE
