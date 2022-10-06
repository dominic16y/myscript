#!/bin/bash
#簡介:本程式用於查看 ppp0 已經連線多長時間
#作者:夢見草
#建立日期:2016/0920	修改日期:2022/1006
#程式架構:
#1.查看此檔 /var/run/ppp0.pid 建立時間，
#2.並將它的時間格式轉換成 +%s 總秒數(也有叫時間戳的)，這樣才能做時間的加減運算
#3.查看當前時間，並轉換成總秒數
#4.兩個數字加減即可得 ppp0 的連線時間
#5.再把相減後的數字格式化出日期
#參考資料:
#http://forums.whirlpool.net.au/archive/579459
#http://mirror.sars.tw/Bash_Shell_by_ols3/c860.html

#變數定義
file1=/var/run/ppp0.pid
pppTime=$(ls -l --time-style=+%s $file1|cut -d " " -f6)
#上面這行是取得ppp0.pid此檔的建立日期，並透過 ls 的參數 --time-style=+%s 將日期轉換成總秒數
present=$(date +%s)
eTime=$(($present-$pppTime))

#1天=24小時=86400秒，1小時=3600秒，

sec=$[ $eTime % 60 ]
# eTime除以60求餘數
min=$[ ($eTime/60) % 60 ]
#eTime除以60，再除60求餘數，這裡的eTime前面可帶$號或不帶都可以 
hour=$[ (eTime/3600) % 24 ]
#eTime除3600
day=$[ eTime/86400 ]
#day=$[ eTime/(3600*24) % 365 ]
#
echo ppp0已連線: $day天,$hour時,$min分,$sec秒

