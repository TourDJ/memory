
> sign_and_send_pubkey: signing failed: agent refused operation Permission denied (publickey).

解决办法：

    eval "$(ssh-agent -s)"
    ssh-add
