#!/bin/bash
EXITCODE_RESULT=0
sudo apt-get install ca-certificates curl gnupg
EXIT_CODE_1=$?
sudo curl -fsSL https://get.docker.com -o get-docker.sh
EXIT_CODE_2=$?
sudo sh ./get-docker.sh
EXIT_CODE_3=$?
sudo systemctl enable docker.service
EXIT_CODE_4=$?
sudo systemctl enable containerd.service
EXIT_CODE_5=$?
sudo curl -SL https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
EXIT_CODE_6=$?
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
EXIT_CODE_7=$?
sudo chmod 755 /usr/bin/docker-compose
EXIT_CODE_8=$?

for i in ${!EXIT_CODE_*}
do
    # check if the values of the EXIT_CODE vars contain 1
    EXITCODE_RESULT=$(($EXITCODE_RESULT || ${!i}))
    if [ ${!i} -ne 0 ]
    then
        var_fail+="'$i' "
    else
        var_succ+="'$i' "
    fi
done
