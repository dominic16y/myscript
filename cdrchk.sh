#!/bin/bash
#用途說明:快速查看CDR特定欄位。本程式需要搭配 csvtool 程度使用，才能正確的讀取出CSV內的資料
########底下為變數設定##########
#1確定檔名
logname=/var/log/asterisk/cdr-csv/$1.csv
#2指定日期範圍
dateRange=$2
#3指定欄位
column=$3
#########以上為變數設定#########
#使用說明:本程式後面要帶3個參數，分別用空格隔開
#語法: cdrchk.sh log檔名 指定日期範圍 指定欄位數字
#範例: cdrchk.sh A0000000013 2015-08 14

#日期範圍說明:一定要填，可指定年月日，語法: 年-月-日 ，若只想指定年月，語法:年-月
#若不想指定範圍則需填入 .*
      
if [ "${1}" == "" -o "${1}" == "help" -o "${1}" == "h" ] ;then
echo 使用說明:本程式後面要帶3個參數，分別用空格隔開
echo "語法: cdrchk.sh log檔名 指定日期範圍 指定欄位數字"
echo "範例: cdrchk.sh A0000000013 2015-08 14"
echo "日期範圍說明:一定要填，可指定年月日，語法1:年-月-日 語法2:年-月"
echo "若不想指定日期範圍則需填入 .*"
exit 
fi


#egrep "$dateRange" $logname | cut -d, -f$column
egrep "$dateRange" $logname | csvtool col $column -


