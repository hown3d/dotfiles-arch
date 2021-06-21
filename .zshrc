# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

export EDITOR=$(which vim)

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update
else
	source ~/.zplug/init.zsh
fi

# Self-manage
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/fzf",   from:oh-my-zsh
zplug "plugins/archlinux",   from:oh-my-zsh
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "qoomon/zsh-lazyload"
zplug "wfxr/forgit"
zplug "kazhala/dotbare"

zplug check || zplug install
zplug clean --force


# Then, source plugins and add commands to $PATH
zplug load

# Lazyload completions
#lazyload <command-name command-name ...> -- <load-command>
lazyload kubectl -- 'source <(kubectl completion zsh)'
lazyload podman -- 'source <(podman completion zsh)'
lazyload gh -- 'source <(gh completion -s zsh)'

# aliases
# kubectl
alias k="kubectl"
# ls
alias ll="ls -alh"
alias l="ls -lh"
# logo ls
alias ls="logo-ls"
# git
alias gc="git commit -av"
alias gPr="git pull --rebase"
alias gP="git pull"
alias gp="git push"

# pretty ls
source ptSh_set_aliases

 eval "$(starship init zsh)"
