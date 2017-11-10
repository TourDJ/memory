
#### /etc/sudoers
sudo的配置文件，它允许系统管理员集中的管理用户的使用权限和使用的主机。它所存放的位置默认是在/etc/sudoers，属性必须为0411。使用 visudo 命令来对该文件
进行修改。

sudo是linux下常用的允许普通用户使用超级用户权限的工具，允许系统管理员让普通用户执行一些或者全部的root命令。

    ############################################################################
    # sudoers file. 
    # 
    # This file MUST be edited with the 'visudo' command as root. 
    # 
    # See the sudoers man page for the details on how to write a sudoers file. 
    # 

    # Host alias specification 
    Host_Alias      EPG = 192.168.1.1, 192.168.1.2 

    # User alias specification 

    # Cmnd alias specification 
    Cmnd_Alias      SQUID = /opt/vtbin/squid_refresh, /sbin/service, /bin/rm 

    # Defaults specification 

    # User privilege specification 
    root    ALL=(ALL) ALL 
    support EPG=(ALL) NOPASSWD: SQUID 

    # Uncomment to allow people in group wheel to run all commands 
    # %wheel        ALL=(ALL)       ALL 

    # Same thing without a password 
    # %wheel        ALL=(ALL)       NOPASSWD: ALL 

    # Samples 
    # %users  ALL=/sbin/mount /cdrom,/sbin/umount /cdrom 
    # %users  localhost=/sbin/shutdown -h now 
###############################################################


