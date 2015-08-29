# directory aliases
alias d="cd ~/Development"
alias w="cd ~/Development/werkspot.com"

# Use color in grep
alias grep='grep --color=auto'

# ls
ls --color=auto &> /dev/null && alias ls='ls --color=auto' #on linux we need ls --color=auto, but on OSX that crashed, this makes it GNU and BSD/Darwin compatible
alias l="ls -a"
alias ll="ls -l"
alias lh="ls -lh"
alias la='ls -A'

#alias muxbackup="cp -R ~/.tmuxinator/ ~/Dropbox/tmuxinator"
#alias muxrestore="chmod 0755 ~/.tmuxinator/* && cp -R ~/Dropbox/tmuxinator/ ~/.tmuxinator"

# Misc
alias v='vim'
alias cl='clear'
alias fu='fresh update'
alias ee='eval $(cat .env)'
alias xml="xmllint --format -"

# Development
alias cc="make cache-clean-quick"
alias wup="w && vagrant reload"
alias wpr="w && vagrant provision"
alias wssh="w && vagrant ssh"
