
NODE=pn7bi01hdn127.company.com

echo
echo is this host real and alive? $NODE
echo
echo
ping -c 1 $NODE
echo
echo
echo trying to ssh to $NODE
echo
echo
ssh $NODE hostname 
echo
echo
ssh $NODE uptime
echo
echo
sleep 3

scp do_* $NODE:/home/johndoe/


echo
echo STOP SERVICES on $NODE cloudera manager
echo STOP SERVICES on $NODE cloudera manager
echo STOP SERVICES on $NODE cloudera manager
echo STOP SERVICES on $NODE cloudera manager
echo STOP SERVICES on $NODE cloudera manager
echo
echo HIT RETURN WHEN DONE
echo
read n
echo
ssh $NODE sudo chmod 744 /home/johndoe/do_yum*
echo
echo ______________________________________________
sleep 3


  echo 
  echo looking for java having ESTAB connections to other hosts
  echo 1 means nothing is running
  echo 10 or more mean all good
  echo
  ssh $NODE sudo netstat -ap | grep ESTAB | grep java | sort
  echo
  ssh $NODE sudo netstat -ap | grep ESTAB | grep java | wc -l
  COUNT=`ssh $NODE sudo netstat -ap | grep ESTAB | grep java | wc -l`
  echo COUNT=$COUNT


  if [ $COUNT -ge 8 ]; then
    echo 
    echo $COUNT active java connections present
    echo NOT GOOD
    echo lets sleep for 20 and try gain
    echo
    sleep 5; echo 5
    sleep 5; echo 10
    sleep 5; echo 15
    sleep 5; echo 20
    echo
    ssh $NODE sudo netstat -ap | grep ESTAB | grep java | sort
    echo
    ssh $NODE sudo netstat -ap | grep ESTAB | grep java | wc -l
    COUNT=`ssh $NODE sudo netstat -ap | grep ESTAB | grep java | wc -l`
    echo COUNT=$COUNT active java connections
    echo
    sleep 3
  else
   echo 
   echo good to proceeed further.
   echo
  fi

  echo
  echo It is NOT WISE to proceed IF number is motre than 7
  echo
  echo __________________________
  sleep 3


  echo 
  echo looking for java , hdfs and datanode processes
  echo
  echo java:2 means all cloudera down, 3 means up
  echo
  ssh $NODE sudo ps -ef | grep java | wc -l
  echo
  echo It is NOT WISE to proceed IF number is motre than 2
  echo
  echo _______________________________
  sleep 3


echo 
echo which java process still running?
echo
ssh $NODE sudo ps -ef | grep java | grep -v grep | cut -dD -f1,2
echo
echo
echo _______________________________
sleep 3


  echo
  echo hdfs
  echo
  ssh $NODE sudo ps -ef | grep hdfs
  echo
  echo
  echo _______________________________
  sleep 3

  echo
  echo datanode
  echo
  ssh $NODE sudo ps -ef | grep -i datanode
  echo
  echo ____________________________________________
  sleep 3
 

  echo
  echo scm
  echo
  ssh $NODE sudo ps -ef | grep -i scm
  echo
  echo ____________________________________________
  sleep 3

  echo
  echo resource manager
  echo
  ssh $NODE sudo ps -ef | grep -i resource
  echo
  echo ____________________________________________
  sleep 3

 
  echo 
  echo doing  yum and curl
  echo
  ssh $NODE sudo /home/johndoe/do_yum*
  echo
  echo ________________________________________
  sleep 3

  echo 
  echo REBOOTING NOW $NODE
  echo REBOOTING NOW $NODE
  echo REBOOTING NOW $NODE
  echo REBOOTING NOW $NODE
  echo REBOOTING NOW $NODE
  echo
  sleep 5
  echo
  ssh $NODE sudo reboot
  echo
  echo ________________________________________
  sleep 3



   
   echo
   echo we need to wait 45 seconds before starting our ping test
   echo because machine can ping for a while BEFORE going down
   echo
   sleep 5
   echo 5
   sleep 5
   echo 10
   sleep 5
   echo 15
   sleep 5
   echo 20
   sleep 5
   echo 25
   sleep 5
   echo 30
   sleep 5
   echo 35
   sleep 5
   echo 40
   sleep 5
   echo 45
   echo
   echo Thats enough waiting
   echo
   echo ________________________________________________
   sleep 3
   
   
   
   
   
   echo 
   echo Now I will ping $NODE up to 9990 times
   echo
   echo as soon 1 ping succeeds , I will stop the pings
   echo
   echo
   ((count = 999))                            # Maximum number to try.
   while [[ $count -ne 0 ]] ; do
       ping -c 1 $NODE                      # Try once.
       rc=$?
       if [[ $rc -eq 0 ]] ; then
           ((count = 1))                      # If okay, flag to exit loop.
       fi
       ((count = count - 1))                  # So we don't go forever.
   done
   
   if [[ $rc -eq 0 ]] ; then                  # Make final determination.
       echo ping is successful now to $NODE
   else
       echo $NODE still times out
   fi
   echo
   echo
   echo ping test should be done above
   echo
   echo _______________________________________________________________________
   sleep 3

echo 
echo we will keep trying to ssh unil we get in
echo
until ssh $NODE uptime
do
  echo "Trying again"
  sleep 3
done
echo
echo ________________________________________________________


echo
echo
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo  NOW START SERVICES ON $NODE USING CLOUDERA MANAGER ON $NODE
echo
echo
echo HIT RETURN WHEN DONE
echo 
read n
echo

  echo 
  echo looking for java , hdfs and datanode processes
  echo
  echo java:2 means all cloudera down, 4 means up
  echo
  ssh $NODE sudo ps -ef | grep java | wc -l
  echo
  echo
  echo _______________________________
  echo
  echo hdfs
  echo
  ssh $NODE sudo ps -ef | grep hdfs
  echo
  echo
  echo _______________________________
  sleep 1


  echo
  echo datanode
  echo
  ssh $NODE sudo ps -ef | grep -i datanode
  echo
  echo ____________________________________________
  sleep 1
  
  echo
  echo scm
  echo
  ssh $NODE sudo ps -ef | grep -i scm
  echo
  echo ____________________________________________
  sleep 1

  echo
  echo resource manager
  echo
  ssh $NODE sudo ps -ef | grep -i resource
  echo
  echo ____________________________________________
  sleep 1

  echo
  echo zookeeper
  echo
  ssh $NODE sudo ps -ef | grep -i zoo
  echo
  echo ____________________________________________
  sleep 1

 
  echo
  echo hive
  echo
  ssh $NODE sudo ps -ef | grep -i hive
  echo
  echo ____________________________________________
  sleep 1

  echo
  echo spark
  echo
  ssh $NODE sudo ps -ef | grep -i spark
  echo
  echo ____________________________________________
  sleep 1

  echo 
  echo looking for java having ESTAB connections to other hosts
  echo 1 means nothing is running
  echo 10 or more mean all good
  echo
  ssh $NODE sudo netstat -ap | grep ESTAB | grep java | sort
  echo
  ssh $NODE sudo  netstat -ap | grep ESTAB | grep java | wc -l
  echo
  echo __________________________
  sleep 3

echo
echo
echo sleeping for 60 seconds. we should allow 60 seconds for any new issues to appear on cloudera manager
echo
sleep 5; echo 5
sleep 5; echo 10
sleep 5; echo 15
sleep 5; echo 20
sleep 5; echo 25
sleep 5; echo 30
sleep 5; echo 35
sleep 5; echo 40
sleep 5; echo 45
sleep 5; echo 50
sleep 5; echo 55


echo
echo
echo now, you should check cloudera manager again. if no new issues show up, you can do the next host.
echo
echo
