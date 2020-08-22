################ variables ################ 
NVIM_DIR := ~/.config/nvim

################ pwd ################ 
PWD = $(shell pwd)

################ make ################ 
.PHONY: all
all: zsh nvim tmux fortunes misc

################ zsh ################ 
.PHONY: zsh
zsh: zsh-p10k zsh-synhl zsh-autosuggestions
ifndef NO_CONFIG
	rm -f ~/.zshrc
	sudo ln -s $(PWD)/zshrc.zsh ~/.zshrc
endif

.PHONY: zsh-base
zsh-base:
	sudo apt install zsh
ifndef NO_CONFIG
	rm -f ~/.zprofile
	sudo ln -s $(PWD)/zprofile.sh ~/.zprofile
endif

.PHONY: zsh-ohmyzsh
zsh-ohmyzsh: zsh-base
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

.PHONY: zsh-p10k
zsh-p10k: zsh-ohmyzsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ifndef NO_CONFIG
	rm -f ~/.p10k.zsh
	sudo ln -s $(PWD)/p10k.zsh ~/.p10k.zsh
endif

.PHONY: zsh-synhl
zsh-synhl: zsh-ohmyzsh
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

.PHONY: zsh-nvm
zsh-nvm: zsh-ohmyzsh
	git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

.PHONY: zsh-autosuggestions
zsh-autosuggestions: zsh-ohmyzsh
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

################ tmux ################ 
.PHONY: tmux
tmux: tmux-tpm
ifndef NO_CONFIG
	rm -f ~/.tmux.conf
	sudo ln -s $(PWD)/tmux.conf ~/.tmux.conf
endif

.PHONY: tmux-base
tmux-base:
	sudo apt install tmux

.PHONY: tmux-tpm
tmux-tpm: tmux-base
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

################ fortunes ################ 
.PHONY: fortunes
fortunes:
	sudo apt install fortunes

################ neovim ################ 
.PHONY: nvim
nvim: nvim-plugins nvim-nvr nvim-py

.PHONY: nvim-base
nvim-base:
	cd ~/.local/bin && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && chmod u+x nvim.appimage && ./nvim.appimage 

.PHONY: nvim-py
nvim-py: nvim-base
	python3 -m venv ~/.pynvim/
	source ~/.pynvim/bin/activate && \
		pip3 install pynvim jedi

.PHONY: nvim-nvr
nvim-nvr: nvim-py
	pip3 install neovim-remote

.PHONY: nvim-minpac
nvim-minpac: nvim-base
	git clone https://github.com/k-takata/minpac.git $(NVIM_DIR)/pack/minpac/opt/minpac

.PHONY: nvim-plugpac
nvim-plugpac: nvim-minpac
	curl -fLo $(NVIM_DIR)/autoload/plugpac.vim --create-dirs https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim

.PHONY: nvim-plugins
nvim-plugins: nvim-py nvim-plugpac

################ yarn ################ 
.PHONY: yarn
yarn: npm
	npm install -g yarn

.PHONY: npm
npm: zsh-nvm
	nvm install stable
	nvm use stable

################ others ################ 
.PHONY: misc
misc: bat ripgrep fd

.PHONY: bat
bat:
	sudo apt install bat

.PHONY: ripgrep
ripgrep:
	sudo apt install ripgrep

.PHONY: fd
fd:
	sudo apt install fd-find

.PHONY: tldr
tldr: yarn
	yarn global add tldr
