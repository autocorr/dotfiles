setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -v
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

#autoload -U colors
#colors
autoload -U colors zsh/terminfo
colors

# Set up the prompt
autoload -Uz promptinit
promptinit
PROMPT=$'%m >>> '
RPROMPT=$'[%~]'

# fasd
eval "$(fasd --init auto)"

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

### Alias commands ###
# radio
alias radio1="mplayer http://ice.somafm.com/groovesalad"
alias radio2="mplayer http://207.200.96.225:8020"
alias radio3="mplayer http://207.200.96.231:8010"
alias radio4="mplayer http://ice.somafm.com/spacestation"
alias radio5="mplayer http://u17.di.fm:80/di_spacemusic_aacplus"
# ssh
alias eld_data='sshfs svobodb@eldora.as.arizona.edu:/data0/svobodb/ /mnt/eld_data/'
alias eld_data_off='fusermount -u /mnt/eld_data'
alias eld_home='sshfs svobodb@eldora.as.arizona.edu:/home/svobodb/ /mnt/eld_home/'
alias eld_home_off='fusermount -u /mnt/eld_home'
alias eldora="ssh -XC4c arcfour,blowfish-cbc svobodb@eldora.as.arizona.edu"
alias greenbank="ssh -XC4c arcfour,blowfish-cbc bsvoboda@ssh.gb.nrao.edu"
# fasd
alias v='f -e vim'
alias m='f -e mplayer'
alias o='a -e xdg-open'
# ls
alias ll='ls -l'
alias la='ls -a'
alias grep='grep -n --color'
# misc
alias tmux='tmux -2'
alias ds='pwd > /tmp/cwd'
alias dr='cd "$(< /tmp/cwd)"'
alias workdir='cd /mnt/eld_data'
# vi
alias vi_besl='vim -p /mnt/eld_data/scripts/besl/besl/*.py /mnt/eld_data/scripts/besl/besl/bplot/*.py'
