# allows variable substitution in the prompt
setopt prompt_subst

autoload colors; colors

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v
export KEYTIMEOUT=1 # set the vi-mode change delay to 0.1 instead of 0.4 sec

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
# the idea of this theme is to contain a lot of info in a small string, by
# compressing some parts and colorcoding, which bring useful visual cues,
# while limiting the amount of colors and such to keep it easy on the eyes.
# When a command exited >0, the timestamp will be in red and the exit code
# will be on the right edge.
# The exit code visual cues will only display once.
# (i.e. they will be reset, even if you hit enter a few times on empty command prompts)

typeset -A host_repr

# translate hostnames into shortened, colorcoded strings
host_repr=(
    'Marijns-MacBook-Pro.local' "%{$fg_bold[green]%}mkmbp" 
    'Marijns-MacBook-Pro-2.local' "%{$fg_bold[green]%}mkmbp" 
    'Marijns-MBP-2' "%{$fg_bold[green]%}mkmbp" 
    'Marijns-Mac-Pro.local' "%{$fg_bold[green]%}desktop" 
)

# user part, color coded by privileges
local user="%(!.%{$fg[blue]%}.%{$fg[blue]%})%n%{$reset_color%}@"
[[ $USER = 'marijnkoesen' ]] && local user=""
[[ $USER = 'marijn' ]] && local user=""
[[ $USER = 'root' ]] && local user="%{$fg[red]%}bb%{$reset_color%}@"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
local host="${host_repr[$(hostname)]:-$(hostname)}%{$reset_color%}"

# Compacted $PWD
local pwd="%{$fg[blue]%}%c%{$reset_color%}"

zstyle ':zsh-kubectl-prompt:' namespace false


PROMPT_CHAR="$"
[[ $USER = 'root' ]] && PROMPT_CHAR="%{$fg[red]%}#%{$reset_color%}"
PROMPT='${time} ${user}${host} $(spwd)$(git_super_status) ${PROMPT_NEWLINE}${PROMPT_CHAR} '

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

function prompt-single-line {
    PROMPT_NEWLINE=""
}

function prompt-multi-line {
    PROMPT_NEWLINE=$'\n'">> "
}

# i would prefer 1 icon that shows the "most drastic" deviation from HEAD,
# but lets see how this works out
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}?%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

#RPS1='] $(vi_mode_prompt_info) ${return_code} $(which -s rvm-prompt >/dev/null 2>&1 && rvm-prompt)'

KUBECTL_PROMPT='%{$fg[green]%}$ZSH_KUBECTL_PROMPT%{$reset_color%}'
RPS1=${KUBECTL_PROMPT}
function prompt-enable-k8s {
    RPS1=$KUBECTL_PROMPT
}

function prompt-disable-k8s {
    RPS1=''
}


# This one messes with fresh zsh-users/zsh-autosuggestions, if enabled and we get an autocompletion for a command
# but we don't use it, e.g. we type 'kubectl' and it suggests to autocomplete to 'kubectl get pod', but we press
# enter, then the shell history would show 'kubectl get pod', while actually we executed 'kubectl' this is very
# annoying, so i've disabled this method for now, and will fix it later, see also https://github.com/zsh-users/zsh-autosuggestions/issues/162
#function accept-line-or-clear-warning () {
#	if [[ -z $BUFFER ]]; then
#		time=$time_disabled
#		return_code=$return_code_disabled
#	else
#		time=$time_enabled
#		return_code=$return_code_enabled
#	fi
#	zle accept-line
#}
#zle -N accept-line-or-clear-warning
#bindkey '^M' accept-line-or-clear-warning

