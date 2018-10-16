fpath=(~/.zsh $fpath)

setopt auto_cd
autoload -U compinit && compinit

source ~/.completion.zsh
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

WORDCHARS=''

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk

setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"
export PATH=$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/usr/bin
export PATH=$HOME/adt/sdk/platform-tools:$HOME/Code/scripts:$PATH
export GOPATH=$HOME/Code
export PATH=$PATH:$GOPATH/bin:~/Library/Python/2.7/bin
export TERM="xterm-256color"
export RUBY_ENV=development

eval "$(rbenv init -)"

unsetopt correct_all
setopt correct
export EDITOR=vim

current_branch_name () {
  git branch | grep "*" | sed "s/\*[^\d]//"
}

current_branch_number () {
  current_branch_name | sed "s/[^0-9]*_.*//"
}

gpo () {
  git push -u origin `current_branch_name`
}

source ~/.git-completion.bash

ssh-add ~/.ssh/id_rsa

#function _update_ps1()
#{
#    export PROMPT="$(~/powerline-zsh.py -m patched $?)"
#    echo -ne "\033]0;${PWD##*/}\007"
#}
#precmd()
#{
#    _update_ps1
#}


source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

# Show history
alias history='fc -l 1'

# List directory contents
alias lsa='ls -lahrt'
alias las='ls -lahrt'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'
alias touchr='touch tmp/restart.txt'
alias gitsumup="git log --no-merges --date=short --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd)%Creset %C(cyan)(%an)%Creset'"
alias dbmigrate="rake db:migrate db:test:prepare"
alias appcd="cd ~/Sites/hipyard-web"
alias be="bundle exec"
alias spec="bundle exec rspec"
alias paraspec="rake \"parallel:spec[4]\""
alias csshx="nocorrect csshx"
alias git="nocorrect git"
alias gam="git commit -a --amend -m"
alias ssh-aws='f() { ssh-keygen -R $1; ssh -oStrictHostKeyChecking=no -i ~/.ssh/aws-compose-dev.pem ubuntu@$1 $2};f'
alias gclone='f() { mkdir -p ~/Code/src/$1/$2/$3 && git clone git@$1:$2/$3 ~/Code/src/$1/$2/$3 && cd ~/Code/src/$1/$2/$3 };f'
alias cssh='f() { ssh chuck.dblayer.com -qt ssh -qt "$@" };f'
alias cmhq='f() { ssh chuck.dblayer.com -qt mhq "$@" };f'
alias dssh='f() { ssh chuck.dblayer.com -qt ssh -qt enterprise-jump sudo compose-jump connect "$@" };f'
alias djump='ssh -t chuck.dblayer.com ssh -t enterprise-jump'
alias ffrkproxy='f() { cd ~/Dropbox/ffrk; mitmdump -s ffrk_drop_tracker.py -s ffrk_enable_timer.py -q };f'
alias 999='f() { git branch -D 9.9.9 && git checkout -b 9.9.9 && git push --set-upstream origin 9.9.9 --force };f'
alias 998='f() { git branch -D 9.9.8 && git checkout -b 9.9.8 && git push --set-upstream origin 9.9.8 --force };f'
alias bcp='f() { git checkout $1 && git pull && git checkout -b $1-$2 && git cherry-pick $3 };f'
alias bcpc='f() { git add . -A && git cherry-pick --continue $1 };f'
alias sshs='f() { echo $@ };f'

cdd() {
    cd $(local-path-to-repo $1)
}

eval "$(hub alias -s)"

touch ~/.env-vars
source ~/.env-vars

# added by travis gem
[ -f /Users/anthony/.travis/travis.sh ] && source /Users/anthony/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anthony/Code/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/anthony/Code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/anthony/Code/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/anthony/Code/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
