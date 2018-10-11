#!/system/bin/sh

echo "init.d script installer"
sleep 2
echo "Are you installed busybox in your current system?
(yes=any no=2):"
read ins

if [ $ins -eq 2 ]
then
echo "Please install busybox binary file first!"
exit
fi

echo "Mounting System as rw..."
busybox mount -o remount,rw -t auto /system
echo "Checking install-recovery.sh is Exist..."
if [ -e /system/etc/install-recovery.sh ] 
then
echo "Not found install-recovery.sh, Creating..."
echo "# init.d support" >> /system/etc/install-recovery.sh
echo "run-parts /system/etc/init.d/" >> /system/etc/install-recovery.sh
echo "" >> /system/etc/install-recovery.sh
awk '!x[$0]++' /system/etc/install-recovery.sh > /sdcard/install-recovery.sh
cat /sdcard/install-recovery.sh > /system/etc/install-recovery.sh
echo "" >> /system/etc/install-recovery.sh
rm /sdcard/install-recovery.sh
else
echo "Create install-recovery.sh file directly!"
echo "#!/system/bin/sh" > /system/etc/install-recovery.sh
echo "# init.d support" >> /system/etc/install-recovery.sh
echo "run-parts /system/etc/init.d/" >> /system/etc/install-recovery.sh
echo "" >> /system/etc/install-recovery.sh
fi

echo "Setting install-recovery.sh file permissions..."
chmod 755 /system/etc/install-recovery.sh
chown 0.0 /system/etc/install-recovery.sh
echo "Checking init.d folder is Exist..."
if [ -e /system/etc/init.d ]
then
echo "Found init.d folder!"
else 
echo "Not found init.d folder, Creating..."
mkdir /system/etc/init.d
fi

echo "Creating base script files..."
echo "#!/system/bin/sh" > /system/etc/init.d/08setperm
echo "#Script to set correct permissions to /system/etc/init.d folder by Ryuinferno @ XDA 2012" >> /system/etc/init.d/08setperm
echo "busybox mount -o remount,rw -t auto /system;" >> /system/etc/init.d/08setperm
echo "busybox chmod -R 777 /system/etc/init.d;" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm
echo "#!/system/bin/sh" > /system/etc/init.d/00test
echo "#Init.d Test" >> /system/etc/init.d/00test
echo "busybox mount -o remount,rw -t auto /system" >> /system/etc/init.d/00test
echo "busybox mount -o remount,rw -t auto /data" >> /system/etc/init.d/00test
echo "" >> /system/etc/init.d/00test
echo "if [ -e /data/Test.log ]; then" >> /system/etc/init.d/00test
echo "rm /data/Test.log" >> /system/etc/init.d/00test
echo "fi" >> /system/etc/init.d/00test
echo "" >> /system/etc/init.d/00test
echo "echo  "Ryuinferno @ XDA 2012" > /data/Test.log" >> /system/etc/init.d/00test
echo "echo  "Init.d is working !!!" >> /data/Test.log" >> /system/etc/init.d/00test
echo "" >> /system/etc/init.d/00test

echo "Setting permissions..."
chmod 777 /system/etc/init.d/08setperm
chmod 777 /system/etc/init.d/00test
chown 0.0 /system/etc/init.d
chown 0.0 /system/etc/init.d/08setperm
chown 0.0 /system/etc/init.d/00test

echo "Checking sysint is Exist..."
if [ -e /system/bin/sysint ]
then
echo "Found, Updating sysint file..."
echo "#!/system/bin/sh" >> /system/bin/sysint
echo "# init.d support" >> /system/bin/sysint
echo "" >> /system/bin/sysint
echo "export PATH=/sbin:/system/sbin:/system/bin:/system/xbin" >> /system/bin/sysint
echo "/system/bin/logwrapper run-parts /system/etc/init.d" >> /system/bin/sysint 
echo "" >> /system/bin/sysint
awk '!x[$0]++' /system/bin/sysint > /sdcard/sysint
cat /sdcard/sysint > /system/bin/sysint
echo "" >> /system/bin/sysint
rm /sdcard/sysint
else
echo "Not found, Creating file..."
echo "#!/system/bin/sh" > /system/bin/sysint
echo "# init.d support" >> /system/bin/sysint
echo "" >> /system/bin/sysint
echo "export PATH=/sbin:/system/sbin:/system/bin:/system/xbin" >> /system/bin/sysint
echo "/system/bin/logwrapper run-parts /system/etc/init.d" >> /system/bin/sysint 
echo "" >> /system/bin/sysint
fi

echo "Setting permissions..."
chmod 755 /system/bin/sysint
chown 0.2000 /system/bin/sysint
echo "Done!"
