#!/bin/bash
#author fengkun0423@gmail.com
DATE=$(date -d yesterday +%Y%m%d)
LOG_PATH=/opt/log/nginx/
LOG_NAME=access.log
BASE_PATH=/opt/log/nginx/
SAVE_LOG_NAME=${DATE}.${LOG_NAME}

mv ${LOG_PATH}${LOG_NAME} ${BASE_PATH}${SAVE_LOG_NAME}

kill -USR1 $(cat /run/nginx.pid)!


