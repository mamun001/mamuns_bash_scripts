
echo
echo This script provides - based on a file of team names
echo
echo 1. email addresses  of this groups in one line to copied to outlook
echo
sleep 3



touch output
rm output

#team_file=teams
team_file=teams
echo Which team file am I processing?
echo
echo $team_file
echo
sleep 3
echo does it exist?
echo
file $team_file
echo
sleep 3

echo sorting team_file
echo 
sleep 1
sort $team_file > junk1
cp junk1 $team_file
rm junk1


echo
echo how many teams to process?
echo
wc -l $team_file
echo
#echo ***************************************************************************************
echo ___________________________________________________________________
echo YOU BETTER HAVE THIS MANY IN THE EMAIL LIST Or else you are missing group who will never be notified
#echo ***************************************************************************************
echo ___________________________________________________________________
echo
sleep 7

echo which repository file am I using to get the email addresses?
repo_file=team_email_repo
echo
sleep 3
echo does it exist?
echo
file $repo_file
echo
sleep 3


echo
echo 
echo processing each line of $team_file
echo

touch junk.teamswithnoemails
rm junk.teamswithnoemails
touch junk.teamswithnoemails


i=0

while read p; do
  #echo $p
  i=`expr $i + 1`  
  #echo $i
  grep -hi $p $repo_file |head -1 | cut -f2 > junk.check
  echo what we are looking for: $p
  echo 
  echo what we found
  cat junk.check
  echo ____________________________________

  if [ -s junk.check ]
   then
     echo file is not empty , thats good
   else
     echo file is empty , that means we did not find email for this group
     echo $p >> junk.teamswithnoemails
     echo email not found for $p
     sleep 5
  fi

  grep -hi $p $repo_file | cut -f2 >> output
  #echo $p
done <$team_file

# puting all BU emails in one line to be copied into TO LINE
team_emails=null;
#echo $a

while read p; do
  #echo $p
  team_emails="$team_emails;$p"
  #echo $a
done <output
echo
echo email group list to be copied 
echo
echo $team_emails
echo
echo ________________________________________________
echo

echo emails not found for ...
cat junk.teamswithnoemails
echo
