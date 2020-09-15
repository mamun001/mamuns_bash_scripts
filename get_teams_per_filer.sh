
# This script returns teams from an input file of filers h_filers_all

while read p; do
  echo $p
  grep -i $p hold | cut -d, -f3 > j3
  grep -i $p hold | cut -d, -f4 > j4
  grep -i $p hold | cut -d, -f5 > j5
  grep -i $p hold | cut -d, -f6 > j6
  grep -i $p hold | cut -d, -f7 > j7
  grep -i $p hold | cut -d, -f8 > j8
  cat j3 > j_all
  cat j4 >> j_all
  cat j5 >> j_all
  cat j6 >> j_all
  cat j7 >> j_all
  cat j8 >> j_all
  sort j_all | uniq | sort
  echo
  echo _____________
  echo
done < h_filers_all

rm j3 j4 j5 j6 j7 j8
