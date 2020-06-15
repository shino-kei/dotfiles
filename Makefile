prefix=${HOME}
SUDO=sudo
PWD := $(dir $(lastword $(MAKEFILE_LIST)))
PWD=${shell pwd}

all: links install_deps themes

.PHONY: links
links: 
	ln -sf ${PWD}/zsh/zshrc_zprezto ~/.zshrc
	ln -sf ${PWD}/zsh/zpreztorc ~/.zpreztorc
	ln -sf ${PWD}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${PWD}/vim/vimrc ~/.vimrc
	ln -sf ${PWD}/git/gitconfig ~/.gitconfig
	ln -sf ${PWD}/git/tigrc ~/.tigrc
	command cp -f  ${PWD}/git/gitignore_global ~/.gitignore_global
	ln -sf ${PWD}/dircolors.256dark ~/.dircolors
	ln -sf ${PWD}/atcoder/atcoder-tools.toml ~/.atcodertools.toml
	ln -sf ${PWD}/cpp/clang-format ~/.clang-format
	touch ~/.zshrc_local
	touch ~/.setup_ros_ws.sh
		

.PHONY: update
update:
	git stash save
	git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)
	git submodule update --init
	git stash pop ; case "$$?" in * ) exit 0 ;; esac

.PHONY: install_deps 
install_deps: 
	zsh ${PWD}/zsh/install_prezto.sh
	xargs ${SUDO} apt install -y < ${PWD}/apt/requirements.txt
	${SUDO} snap install go --classic
	${SUDO} update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100
	${SUDO} update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100
	${SUDO} update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-6.0 100

.PHONY: themes
themes:
	mkdir -p ~/.theme
	ln -sf ${PWD}/theme/google_dark.theme ~/.theme
	ln -sf ${PWD}/theme/solarized_dark.theme ~/.theme

.PHONY: online-judge
online-judge:
	sudo -E -H pip3 install -r ${PWD}/atcoder/requirements.txt
	

