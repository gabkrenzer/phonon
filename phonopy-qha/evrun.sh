#!/bin/bash -l

echo 0
cd 0
mv POSCAR-0 POSCAR
qsub myjobfile.job
cd ../
sleep 1

for NUM in {1..5} #corresponds to numbers used with volumes.sh; directory names
do
   echo $NUM-
   cd $NUM-
   mv POSCAR--$NUM POSCAR
   qsub myjobfile.job
   cd ../
   sleep 1
done

for NUM in {1..5} #corresponds to numbers used with volumes.sh; directory names
do
   echo $NUM+
   cd $NUM+
   mv POSCAR-$NUM POSCAR
   qsub myjobfile.job
   cd ../
   sleep 1
done

