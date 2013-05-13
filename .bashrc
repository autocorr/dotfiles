# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=$PATH:/scisoft/bin:/home/bsvoboda/mygbtidl/bin
export IDL_PATH="<IDL_PATH>"
export IDL_PATH=${IDL_PATH}:+/usr/local/itt/idl:+/mnt/eld_data/scripts/idl
export PYTHONPATH=${PYTHONPATH}:/mnt/eld_data/scripts/py:/mnt/eld_data/scripts/besl

# Fasd
eval "$(fasd --init auto)"
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ] ; then
	fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# User specific aliases and functions
alias eldora='ssh -XC4c arcfour,blowfish-cbc svobodb@eldora.as.arizona.edu'
alias greenbank='ssh -XC4c arcfour,blowfish-cbc bsvoboda@ssh.gb.nrao.edu'
alias eld_data='sshfs svobodb@eldora.as.arizona.edu:/data0/svobodb/ /mnt/eld_data/'
alias eld_home='sshfs svobodb@eldora.as.arizona.edu:/home/svobodb/ /mnt/eld_home/'
alias workdir1='cd /mnt/eld_data/GBT/h2o_masers/data/'
alias v='f -e vim'
alias m='f -e mplayer'
alias o='a -e xdg-open'
alias ll='ls -l'
