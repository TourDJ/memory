#!/bin/bash 
disk_list=`sudo vmware-toolbox-cmd disk list`

for disk in ${disk_list}
do
    sudo vmware-toolbox-cmd disk wipe ${disk}
done

sudo vmware-toolbox-cmd disk shrinkonly
