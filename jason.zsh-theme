local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜%s)"
PROMPT='${ret_status} %{$fg_bold[green]%}%n@%m%{$fg_bold[green]%}%p %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$fg[green]%}%~%{$reset_color%}
>'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}✗%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
