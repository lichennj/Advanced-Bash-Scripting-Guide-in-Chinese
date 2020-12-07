#!/usr/local/bin/bash
#!/bin/sh
# Bash脚本标准起始行
# First override

LOG_DIR=/var/log 
ROOT_UID=0
LINES=50
E_XCD=86
E_NOTROOT=87

echo $BASH_VERSION

if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Must be root to run this script"
    exit $E_NOTROOT
fi

if [ -n "$1" ]
# optional filed for saved line number
then
    lines=$1
else
    lines=$LINES
fi

cd $LOG_DIR

# if [ `pwd` != "$LOG_DIR" ]
# then
#     echo "Can't change to $LOG_DIR"
#     exit $E_XCD
# fi

cd /var/log || {
    echo "Can't change to log dir"
    exit $E_xcd
}

tail -n $lines messages > mesg.temp
mv mesg.temp messages

# cat /dev/null > messages
# cat /dev/null > wtmp

cat /dev/null > wtmp
echo "Logs cleaned up."

exit 0
# 不带参数的exit返回上一条指令的运行结果

