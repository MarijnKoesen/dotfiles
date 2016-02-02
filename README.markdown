# ~/.dotfiles

## Installation of new macbook

Install [brew](http://brew.sh/)

Next install everything via ansible:

```sh
brew install ansible
ansible-playbook ansible-playbook.yml -v
```

## Installation of dotfiles only

``` sh
FRESH_LOCAL_SOURCE=marijnkoesen/dotfiles bash -c "`curl -sL get.freshshell.com`"
```

My dotfiles are managed by [fresh].

[fresh]: http://freshshell.com

## Setting zsh as default shell on OSX:

* Go to 'System Preferences' > 'Users & Groups'
* Click on the lock to unlock
* Right click on your user and goto on 'Advanced Options'
* Change the shell to `/bin/zsh`

