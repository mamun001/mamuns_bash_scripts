#splitting columns into rows

#input file
NF=j2
echo input file = $NF
sleep 3


sleep 3

for i in `seq 1 40`;
 do
  echo $i

# delimeter
#  cut -d\; -f$i junk > junk.$i
#  cut -d\: -f$i $NF > junk.$i
#cut -d ';' -f$i $NF > junk.$i


cut -d ',' -f$i $NF > junk.$i
  #echo ___________________________________
 done


OF=junk.rows
touch $OF
rm $OF
touch $OF
for i in `seq 1 40`;
 do
  echo $i
  cat junk.$i >> $OF
  #echo ___________________________________
 done


echo
echo $OF has all the words in rows
echo


