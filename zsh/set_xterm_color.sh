
if type "xtermcontrol" > /dev/null 2>&1; then
  THEME_DIR=~/.theme
  DEFAULT_THEME=google_dark.theme
  SSH_THEME=solarized_dark.theme

  function set_default_theme() {
    xtermcontrol --file=${THEME_DIR}/${DEFAULT_THEME}
  }
  
  function set_ssh_theme() {
    xtermcontrol --file=${THEME_DIR}/${SSH_THEME}
  }

  ssh() {
    trap set_default_theme 1 2 3 15
    set_ssh_theme
    command ssh "$@"
    set_default_theme
  }
fi
