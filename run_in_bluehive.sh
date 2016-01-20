#!/bin/bash

mkdir ./Results/$1
# Shell script coded by Md. Iftekhar Tanveer (itanveer@cs.rochester.edu)
# Sending to bluehive
# ===================
rm temp/*
scp allSkeletons/$1.csv mtanveer@bluehive.circ.rochester.edu:~/Behavioral_Action_project/Data/
ssh mtanveer@bluehive.circ.rochester.edu "scancel -u mtanveer"
ssh mtanveer@bluehive.circ.rochester.edu "cd ~/Behavioral_Action_project;rm status/*;rm Results/*;sbatch runscript_short.sh $1.csv"

################### In Bluehive ##############################
ssh mtanveer@bluehive.circ.rochester.edu "squeue -u mtanveer"
while true; do
    echo 'please wait ...'
    sleep 30s
    jobcount=$(ssh mtanveer@bluehive.circ.rochester.edu "squeue -u mtanveer"|wc -l)
    #read -p "(e)xit loop? or check Status? [e for exit]:" response
    if [[ $jobcount == 1 ]]
    then
        break
    else
        ssh mtanveer@bluehive.circ.rochester.edu "squeue -u mtanveer"
    fi
done
ssh mtanveer@bluehive.circ.rochester.edu "module load anaconda;cd ~/Behavioral_Action_project;python filter.py -nlo cost Results/*.mat|xargs rm"
scp mtanveer@bluehive.circ.rochester.edu:~/Behavioral_Action_project/Results/*.mat ./temp/
##############################################################

# Results back from bluehive
# ==========================
#
filename=$(ls temp/*.mat | sort -n | head -1)
python -c "from clean import *; gencsv('allSkeleton/$1.csv','$filename')"
mkdir /u/www/hci/projectpages/behavior/Data/$1
mv Results/$1/* /u/www/hci/projectpages/behavior/Data/$1/
cp allvideos/$1.mp4 /u/www/hci/projectpages/behavior/Data/$1/
ffmpeg -i /u/www/hci/projectpages/behavior/Data/$1/$1.mp4 -codec:v libvpx -quality good -cpu-used 0 -b:v 600k -maxrate 600k -bufsize 1200k -qmin 10 -qmax 42 -vf scale=640:-1 -threads 4 -codec:a libvorbis -b:a 128k /u/www/hci/projectpages/behavior/Data/$1/$1.webm
rm /u/www/hci/projectpages/behavior/Data/$1/$1.mp4
echo 'Done!'

