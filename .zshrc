# Path to your oh-my-zsh installation.
  export ZSH=${HOME}/.oh-my-zsh

# ワイルドカード(*)による表記を有効にする
setopt nonomatch

# テーマの設定
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

### プロンプトの設定
### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

cURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY='±'
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi
    echo -n "${ref/refs\/heads\//⭠ }$dirty"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue white '%1~'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) 
$SEGMENT_SEPARATOR '




# 個人設定
# ローカル環境向け設定は別ファイルに記述する
[ -f $HOME/dotfiles/local/.zshrc_local ] && . $HOME/dotfiles/local/.zshrc_local


case ${OSTYPE} in
  darwin*)
    # Mac 向けの設定
    # lessコマンド時の色設定
    export LESS='-R'
    export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
    ;;
  linux*)
    # エイリアスの設定
    alias open="xdg-open"
    # alias ls='ls --hide=*.*~'
    alias ls='ls -hF --color=auto --hide=*.*~'
    setopt nonomatch
    # lessコマンド時の色設定
    export LESS='-R'
    export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
    
    # 各言語向けにgitignoreを自動生成できるようにする
    function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
    ;;
  cygwin)
    # エイリアスの設定
    alias open="cygstart"
    alias ls='ls -hF --color=auto --hide=*.*~ --ignore={NTUSER*,ntuser*}'
    setopt nonomatch
    ;;
esac

alias la='ls -a'

# lsコマンド時の色設定を有効にする
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# alias ls="ls -hF --color=auto"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep -i'


# ROS関連の設定は、dotfiles/local/.zshrc_localに記述する
    # source /opt/ros/indigo/setup.bash
    # source $HOME/catkin_ws/devel/setup.zsh
    # source ~/rosbuild_ws/setup.zsh

