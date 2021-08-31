#! /bin/bash

if [ -d ~/research ]
then
        rm -Rf ~/research
        mkdir ~/research
        cd ~/research
        #touch sys.info 
else
        mkdir ~/research2 && cd ~/research #&& touch sys.info
fi

echo -e "My First Bash Script $(date) \n" >>  ~/research/sys.info

echo -e "Machine name: $(uname -a) \n" >> ~/research/sys.info

echo -e "Machine's IP address is: $(hostname -i) \n" >> ~/research/sys.info

echo -e "Hostname is: $(hostname) \n" >> ~/research/sys.info

echo -e "DNS:\n$(cat /etc/resolv.conf)\n" >> ~/research/sys.info

echo -e "memory info is:\n$(free -m) \n" >> ~/research/sys.info

echo -e "Disk usage is: \n$(df -h /) \n" >> ~/research/sys.info

echo -e "Users currently logged in are:\n$(w) \n" >> ~/research/sys.info

find ~/ -type f -perm 755 >> filesWith755Perm.txt

echo -e "Top 10 process are: \n$(ps -u sysadmin -o user,pid,ppid,time,cmd,%mem,%cpu --sort=-%cpu | head ) \n" >> ~/research/sys.info

echo results are located in /home/sysadmin/research

