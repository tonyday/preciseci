# Setup vim / vundle
# get a vimrc that has a list of plugins to be installed
curl -o ~/.vimrc https://gist.githubusercontent.com/tonyday/bc4062594af2ad06b140/raw/4083d63a47dc4e75af66eafbd511b73bcd5c7418/install_vimrc
# get vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# start vim and execute vundle install
vim +PluginInstall +qall
