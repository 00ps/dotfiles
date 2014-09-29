# my own custom prompt

PROMPT='$fg[green]┌─ $fg[cyan]%m: $fg[green]%~%b $(git_super_status)
$fg[green]└( $fg[white]%* $fg[green])-|▶$reset_color '

RPROMPT='${return_status}$(battery_pct_prompt) $(battery_level_gauge)%{$reset_color%}'
