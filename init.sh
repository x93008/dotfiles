#! /bin/bash
sudo pacman -S cmake tmux nvm docker ripgrep neovim xmodmap android-tools scrcpy xclip privoxy

# 解决appimage没有托盘图标
sudo pacman -S appmenu-gtk-module libappindicator-gtk2 libappindicator-gtk3 libdbusmenu-qt5 libdbusmenu-qt6 

# 管理所有appimage，如果不习惯，可以不安装
sudo pacman -S appimagelauncher

git config --global core.editor "nvim"
sudo systemctl enanle docker.service --now
# need reboot
sudo usermod -aG docker $USER
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
pip install conan
ln -s ~/dotfiles/zsh/antigen.zsh ~/antigen.zsh
ln -s ~/dotfiles/nvm ~/.nvm
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim/.vim ~/.vim
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/.Xmodmap ~/.Xmodmap
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/nvm ~/.config/mvm
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/vim/.vim/vimfile ~/.config/nvim/vimfile
ln -s ~/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json
conan remote add conan-local http://artifactory.gz.cvte.cn/artifactory/api/conan/conan-local --insert=0
conan profile new default --detect --force
conan profile update settings.compiler.libcxx=libstdc++11 default
conan config set general.scm_to_conandata=1
