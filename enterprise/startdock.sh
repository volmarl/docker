sudo docker stop $1
sudo docker rm $1
sudo docker run -d -p ${3}:8081 -p ${2}:3000 --name $1 -t -i aerospike/enterprise /bin/bash
DCID=$(docker ps|grep $1|awk '{print $1}')
echo "Container ID=$DCID"
PID=$(docker inspect --format '{{ .State.Pid }}' $DCID)
echo "PID=$PID"
nsenter --target $PID --mount --uts --ipc --net --pid "loadshm.sh"
