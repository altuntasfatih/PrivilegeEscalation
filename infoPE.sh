#!/bin/sh
#!/bin/sh
echo Distribution and kernel version
cat /etc/issue
uname -a

echo Mounted filesystems
mount -l
#eğer herhangi bir unmouted file exist,the next stepp would be to try to mount them

echo Network configuration
ifconfig -a
cat /etc/hosts
arp

echo Development tools availability
which gcc
which g++
which python
#farkli development tools lar olabilir,if ı can  run complied programs
#my home directoyr ,ı can complie exploit if we need

echo Installed packages (Ubuntu)
dpkg -l
#paket indirim silmeme iznim olmasa bile,inen paketlerin izinlerine 
#versionlari bakip kontrol edebilirm

echo Services
netstat -tulnpe

echo Processes
ps -aux

echo Scheduled jobs
#check all execute files,which call by  root cron jobs
#if you have permision write,you can easily manipulate this #file then may get shell
find /etc/cron* -ls 2>/dev/null
find /var/spool/cron* -ls 2>/dev/null
#if ı acces /etc /var directiories gives me a great startion positon ,for seachin configuration flash
#Configuration flaws->Yapılandirma hatalari
#flaws defect,flaw,fault
#



echo Readable files in /etc 
find /etc -user `id -u` -perm -u=r \
 -o -group id -g -perm -g=r \
 -o -perm -o=r \
 -ls 2>/dev/null 

echo SUID and GUID writable files
find / -o -group `id -g` -perm -g=w -perm -u=s \
 -o -perm -o=w -perm -u=s \
 -o -perm -o=w -perm -g=s \
 -ls 2>/dev/null 

echo SUID and GUID files
find / -type f -perm -u=s -o -type f -perm -g=s \
 -ls 2>/dev/null

echo Writable files outside HOME
mount -l find / -path “$HOME” -prune -o -path “/proc” -prune -o \( ! -type l \) \( -user id -u -perm -u=w  -o -group id -g -perm -g=w  -o -perm -o=w \) -ls 2>/dev/null

#
#The SUID and SGID bits will appear as the letter "s" if the #permission is available. bildiğim kadariyla bu bitleri set edilmişse
#file root izinleri tarafindan çaliştiriyor
#file permsiion in symblocic mode 
#u user owner of file
#g	group	Users who are members of the file's group
#o	other	Users who are not the owner of the file or members of the file's group
#a	all	All of the above (equivalent to "ugo")
#default file permision umask



#director /var/lib/php5
#directory /var/www/tkwiki/data











