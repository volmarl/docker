docker ps -q | xargs docker kill
service docker stop
cd /var/lib/docker/devicemapper/mnt
umount ./*
mv /var/lib/docker/ /shared/docker/
#mv /var/lib/docker $dest
#ln -s $dest /var/lib/docker
ln -s /shared/docker/docker /var/lib/docker
service docker start
