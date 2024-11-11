cat << EOF >> ~/.bashrc
dcompose() { cd ~/Documents/Docker && docker compose up "$@"; }
dcomposed() { cd ~/Documents/Docker && docker compose down "$@"; }
dcomposepull() { cd ~/Documents/Docker && docker compose pull "$@"; }
dpurge() { docker system prune --all -f; }
alias chownall='sudo chown -R $USER:$USER ./*'
alias dstopall='docker stop $(docker ps -a -q)'
alias netrestart='sudo systemctl restart NetworkManager'
alias pihole='ssh pihole@192.168.1.169'
alias vi='nano'
alias vim='nano'
alias loginmedia='ssh media@media.server'
alias loginpi='ssh pi@pi.hole'
alias loginhs='ssh hs@head.scale'
alias chatty='java -jar /home/games/Chatty/Chatty.jar'
export PATH="$PATH:/home/sirrush/.local/bin"
export PATH=/home/sirrush/.local/bin:$PATH
EOF
chown sirrush:sirrush ~/.bashrc
sed --in-place '/default/d' /efi/loader/loader.conf 
sed --in-place '/timeout/d' /efi/loader/loader.conf 
cat << EOF >> /efi/loader/loader.conf 
default *zen*
timeout 1
EOF
cat << EOF >> /etc/pacman.conf
[lizardbyte-beta]
SigLevel = Optional
Server = https://github.com/LizardByte/pacman-repo/releases/download/betatslib
EOF
cat << EOF >> /etc/fstab
media@media.server:/storage               /storage       fuse.sshfs    x-systemd.automount,_netdev,reconnect,IdentityFile=/home/sirrush/.ssh/id_ed25519,allow_other,default_permissions  0   0
EOF
