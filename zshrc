setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -v
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

#autoload -U colors
autoload -U colors zsh/terminfo
colors

# Set up the prompt
autoload -Uz promptinit
promptinit
PROMPT=$'%m >>> '
RPROMPT=$'[%~]'

# Paths
export PYTHONPATH=${PYTHONPATH}:/mnt/eld_data/scripts/py:/mnt/eld_data/scripts/besl:/mnt/eld_data/scripts/astroquery:/mnt/eld_data/scripts/photutils:/mnt/eld_data/scripts/radex/Radex/radexgrid:/mnt/eld_data/scripts/astrodendro:/mnt/eld_data/scripts/plfit:/mnt/eld_data/scripts/click
export MPLCONFIGDIR=~/.config/matplotlib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/multinest/lib
export GOROOT=/opt/go
export PATH=$PATH:$GOROOT/bin:/opt/bin

# fasd
eval "$(fasd --init auto)"

### Completion ###
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

### Alias ###
# radio
alias radio1="mplayer http://ice.somafm.com/groovesalad"
alias radio2="mplayer http://207.200.96.225:8020"
alias radio3="mplayer http://207.200.96.231:8010"
alias radio4="mplayer http://ice.somafm.com/spacestation"
alias radio5="mplayer http://u17.di.fm:80/di_spacemusic_aacplus"
# ssh
alias eld_data='sshfs svobodb@eldora.as.arizona.edu:/data0/svobodb/ /mnt/eld_data/ -C -o reconnect,auto_cache,workaround=all'
alias eld_data_off='fusermount -u /mnt/eld_data'
alias eld_home='sshfs svobodb@eldora.as.arizona.edu:/home/svobodb/ /mnt/eld_home/'
alias eld_home_off='fusermount -u /mnt/eld_home'
alias eldora="ssh -XC4 svobodb@eldora.as.arizona.edu"
alias greenbank="ssh -XC4 bsvoboda@ssh.gb.nrao.edu"
alias hht="ssh -XC4 obs@smtoast.as.arizona.edu"
alias rasalas="ssh -XC4 bsvoboda@rasalas.as.arizona.edu"
# fasd
alias v='f -e vim'
alias m='f -e mplayer'
alias o='a -e xdg-open'
# ls
alias ls='ls -F --color'
alias ll='ls -lF --color'
alias la='ls -aF --color'
alias grep='grep -n --color'
# misc
alias tmux='tmux -2'
alias ds='pwd > /tmp/cwd'
alias dr='cd "$(< /tmp/cwd)"'
alias workdir='cd /mnt/eld_data'
alias ipnb='ipython notebook --pylab inline'
alias pylab='ipython --pylab'

### Functions ###
# Python command-line calculator
function calc {
	if [[ $# -ge 2 ]]; then
		echo $0: too many arguements
	elif [[ $# -eq 1 ]]; then
		python -c "from math import *; print $1"
	else
		echo "Usage: $0:t [pattern...]"
		return 1
	fi
}
# Directory jump
export MARKPATH=$HOME/.marks
function j {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
	rm -i "$MARKPATH/$1"
}
function marks {
	ls -l "$MARKPATH" | sed 's/  / /g' | cut -d ' ' -f9- | sed 's/ -/\t-/g' && echo
}
# Tab complete
function _completemarks {
	reply=($(ls $MARKPATH))
}
compctl -K _completemarks j
compctl -K _completemarks unmark


