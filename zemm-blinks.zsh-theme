# Ryan Arana's take on the Blinks theme - https://github.com/cadetZemm/zemm-blinks.zsh-theme
# Original Blinks theme is here: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/blinks.zsh-theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  elif $(hg root > /dev/null 2>&1); then
    echo "%{%F{blue}%}☿%{%f%k%b%}"
  else
    echo ' '
  fi
}

function _prompt_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo $(git_prompt_info)
  elif $(hg root &> /dev/null); then
    echo $(hg_prompt_info 2> /dev/null) || ""
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_HG_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_HG_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_HG_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{black}%B%F{green}%}%n%{%B%F{blue}%}%{%F{red}%}[∴]%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{black}%}%~%{%B%F{green}%}$(_prompt_info)%E%{%f%k%b%}
%{%K{black}%}$(_prompt_char)%{%K{black}%} %#%{%f%k%b%} '

RPROMPT='%{%B%F{cyan}%}%@ - %D{%A, %B %d, %Y}%{%f%k%b%}'
