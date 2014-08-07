mount -o remount,rw -t proc /proc/sys /proc/sys
bash -c "echo 1073741824 > /proc/sys/kernel/shmmax"
bash -c "echo 4294967296 > /proc/sys/kernel/shmall"
mount -o remount,ro -t proc /proc/sys /proc/sys
