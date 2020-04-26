ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ☳%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
if [ -z $SSH_CLIENT ]
then
  PROMPT='%B%{$FG[172]%}[%{$FG[208]%}%*%{$FG[172]%}] - %B%{$fg[green]%}($USER@%M) %{$FG[172]%}%~%{$reset_color%}%{$fg[red]%} %B| %{$reset_color%}$(git_prompt_info)$(ruby_prompt_info)%{$fg[red]%} %B|%{$reset_color%}%{$FG[172]%}⇒%{$reset_color%} '
else
  PROMPT='%B%{$fg[red]%}፨ %{$FG[172]%}[%{$FG[208]%}%*%{$FG[172]%}] - %B%{$fg[green]%}($USER@%M) %{$FG[172]%}%~%{$reset_color%}%{$fg[red]%} %B| %{$reset_color%}$(git_prompt_info)$(ruby_prompt_info)%{$fg[red]%} %B|%%{$FG[172]%}⇒%{$reset_color%} '
fi
