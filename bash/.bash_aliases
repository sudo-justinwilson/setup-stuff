# personal bash aliases and settings:

# virtualbox cmds:
#list all vms:
alias vboxl="vboxmanage list vms"
# list running vms:
alias vboxlr="vboxmanage list runningvms"
# general alias for vboxmanage:
alias vbox="vboxmanage"
# start a vm (put options after vm id/name:
#alias vboxs="vboxmanage startvm"
# the following are all controlvm sub-commands:
alias vboxcontrol="vboxmanage controlvm"
# I wanted to make aliases for poweroff,savestate,etc.. but the vm name/id needs to go before the options???

# ZFS
alias zfs="sudo zfs"
alias zpool="sudo zpool"

# Docker
# general docker:
alias docker="sudo docker"

# rhce:
alias sshrhce1='ssh root@rhce1.local'
alias sshrhce2='ssh root@rhce2.local'
alias sshrhce3='ssh root@rhce3.local'

# set git login:
git config user.name "sudo-justinwilson"
git config user.email "sudo.justin.wilson@gmail.com"
