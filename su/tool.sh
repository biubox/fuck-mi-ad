# ====================================================
#   Copyright ©2018 All rights reserved.
#
#   Author        : Su
#   Email         : box@cifun.cc
#   File Name     : tool.sh
#   Last Modified : 2019-03-29 00:37
#   Describe      :
#
# ====================================================
#!/system/bin/sh
title="▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅▅"
echo "$title"
echo "==                Quick Tools                   =="
echo "$title"
echo "== 1.WiFi PassWord     #    6.Get App list      =="
echo "== 2.Get IP            #    7.Remove App        =="
echo "== 3.Clear Mi-Dir      #    8.Pm disable App    =="
echo "== 4.Cover hosts       #                        =="
echo "== 5.Mount /system     #                        =="
echo "$title"
echo -n "Please Choose:"
read num

gang="●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
echo "$gang"
if  test $num -eq 1
then
    echo `cat /data/misc/wifi/WifiConfigStore.xml |egrep \"SSID\|PreSharedKey` > /sdcard/su/wifi.pw
    cd /sdcard/su/
#    sed -i 's/<string\ name\=\"ConfigKey\"\>\&quot\;/WiFi账号:/g' wifi.pw
    sed -i 's/\<\string\ name\=\"SSID\"\>\&quot\;/WiFi账号:/g' wifi.pw
    sed -i 's/<string\ name\=\"PreSharedKey\"\>\&quot\;/WiFi密码:/g' wifi.pw
    sed -i 's/\&quot\;\<\/string\>//g' wifi.pw
#    sed -i 's/\&quot//g' wifi.pw
#    sed -i 's/\<\/string\>//g' wifi.pw
    sed -i 's/ /\n/g' wifi.pw
#    sed -i '/wifi/!d' wifi.pw
    echo "Successful"
    cat wifi.pw
    echo "$gang"
    
    
elif test $num -eq 2
then curl cip.cc
    echo "$gang" 
    
elif test $num -eq 3
then cd /sdcard/
    for dir in `cat /sdcard/su/del-dir.list`
    do
    rm -rf "$dir"
    done
    echo "Successful"
    echo "$gang" 
    
elif test $num -eq 4
then cp /sdcard/su/hosts /system/etc/
    cat /system/etc/hosts
    echo -e "\n$gang"
    


         
elif test $num -eq 5
#then mount -o remount,rw /dev/block/dm-0 /system
then mount -o remount,rw /system
    echo "Successful"
    echo "$gang"
    /data/tool.sh
    
         
elif test $num -eq 6   
then echo `pm list packages` > /sdcard/su/all-app.list
    cd /sdcard/su/
    sed -i 's/package://g' all-app.list
    sed -i 's/ /\n/g' all-app.list
    echo "Successful"
    echo "$gang"

    
elif test $num -eq 7
then
    for app in `cat /sdcard/su/remove.list |egrep '^com'`
    do
    path=`pm path "$app" |sed 's/package://g'|sed 's/\/[^/]*$//'`
    rm -rf "$path"
done
    echo "Successful"
    echo "$gang"    

    
elif test $num -eq 8
then 
    for pmapp in `cat /sdcard/su/ban-app.list |egrep '^com'`
    do
    pm disable "$pmapp"
    done
    echo "Successful"
    echo -e "\n$gang"
        
else echo "Something Wrong!!!"
     echo "$gang"
fi