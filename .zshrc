# Historique zsh
HISTFILE=~/.zsh_history
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# Raccourci application 
 alias ll='ls -l'
 alias la='ls -A'
#alias l='ls -CF'
 alias ipa='ip -br -c a && ip r | grep default --color &&  ip -4 addr show ens33 && ip -6 addr show ens33 && resolvectl'                      
 alias cls='clear'
 alias update='sudo apt update'
 alias fetch='neofetch'

# enable color support of ls and also add handy aliases
 alias grep="grep --color=always"
 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'

# Alias's for multiple directory listing commands
 alias la='ls -Alh' # show hidden files
 alias ls='ls -aFh --color=always' # add colors and file type extensions
 alias lx='ls -lXBh' # sort by extension
 alias lk='ls -lSrh' # sort by size
 alias lc='ls -lcrh' # sort by change time
 alias lu='ls -lurh' # sort by access time
 alias lr='ls -lRh' # recursive ls
 alias lt='ls -ltrh' # sort by date
 alias lm='ls -alh |more' # pipe through 'more'
 alias lw='ls -xAh' # wide listing format
 alias ll='ls -Fls' # long listing format
 alias labc='ls -lap' #alphabetical sort
 alias lf="ls -l | egrep -v '^d'" # files only
 alias ldir="ls -l | egrep '^d'" # directories only
 alias free='free -m'                      # show sizes in MB

# Show current network information

netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet / {print $1,$2}'
	echo ""
	/sbin/ifconfig | awk /'inet / {print $3,$4}'
	echo ""
	/sbin/ifconfig | awk /'inet / {print $5,$6}'
	echo ""
	echo "---------------------------------------------------"
}
# # ex - archive extractor
# # usage: ex <file>

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# PS1='\[\e[91;1m\][\[\e[93m\]\h\[\e[92m\]@\[\e[94m\]\u\[\e[0m\] \[\e[95;1m\]\w\[\e[91m\]]\[\e[0m\]\\$ '
# Chargement de Starship
eval "$(starship init zsh)"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin
