
if type "xtermcontrol" > /dev/null 2>&1; then
  THEME_DIR=~/.theme
  DEFAULT_THEME=google_dark.theme
  SSH_THEME=solarized_dark.theme
  ssh() {
    xtermcontrol --file=${THEME_DIR}/${SSH_THEME}
    command ssh "$@"
    xtermcontrol --file=${THEME_DIR}/${DEFAULT_THEME}
  }
fi
