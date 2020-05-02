# The only thing that doesn't work is the auto_reload (eg. after 'git checkout development').
# This kinda sucks because after every change I need to run the 'reload' command to reload the terminal.

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}$(git_prompt_info)%{$fg[red]%}]%{$reset_color%}$ "
