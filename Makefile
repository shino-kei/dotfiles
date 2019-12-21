prefix=${HOME}
SUDO=sudo
PWD := $(dir $(lastword $(MAKEFILE_LIST)))
PWD=${shell pwd}

all: links install_deps

.PHONY: links
links: 
	ln -sf ${PWD}/zsh/zshrc_zprezto ~/.zshrc
	ln -sf ${PWD}/zsh/zpreztorc ~/.zpreztorc
	ln -sf ${PWD}/tmux.conf ~/.tmux.conf
	ln -sf ${PWD}/vimrc ~/.vimrc
	ln -sf ${PWD}/git/gitconfig ~/.gitconfig
	ln -sf ${PWD}/dircolors.256dark ~/.dircolors
		

.PHONY: update
update:
	git stash save
	git pull --rebase
	git submodule update --init
	git stash pop ; case "$$?" in * ) exit 0 ;; esac

.PHONY: install_deps 
install_deps: 
	xargs ${SUDO} apt install -y < ${PWD}/requirements.txt
	${SUDO} update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100
	${SUDO} update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100
	${SUDO} update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-6.0 100

