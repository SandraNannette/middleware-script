#!/bin/bash

    #Author : sandra
    #Date : 01-March-2022

## ---------- script that Install some packages in Linux -----------------

if [ $USER != root ] 
 
then
echo " creation of sonarQube server in progress please be patient!!!"

else

echo "you must be a regular user to run this script"
exit 1
fi


echo " "
sudo yum update -y
sleep 3

 sudo yum install java-11-openjdk-devel -y
 sudo yum install java-11-openjdk -y
echo " "
#let's move to the opt directory 
cd /opt
 sudo yum install wget -y 
if  [ $? -eq 0 ]
then

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
else

echo "wget not install"
fi
# Extract packages
echo " "

sudo yum install unzip -y

if [ $? -eq 0 ]
then
sudo unzip /opt/sonarqube-9.3.0.51899.zip

else

echo "unzip installation failed"
fi

sleep 3
 #"Change ownership to the user and Switch to Linux binaries directory to start service"
 echo " " 
 sleep 3

 sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
 cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
 echo " "
 sleep 2
./sonar.sh start

# Connect to SonarQube server

sudo yum install net-tools
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

echo -e "\n please use this link to connect to the SonarQube server through the browser: http://$(ifconfig eth1 | grep 192 | awk '{print $2}'):9000"

echo -e "\n Here are the defautl credentials for access\n"
echo  " Login: admin Passwd:admin"
echo  "Old password: admin  New passwd: school1 "

                 echo "End" 
