# Setup vim / vundle
# Get the list of Vundle plugins to be installed
curl -o ~/.vim_vundles.vim https://raw.githubusercontent.com/tonyday/vudotfiles/master/dots/vim_vundles.vim
# Get a simple vimrc that includes the list of plugins to be installed
curl -o ~/.vimrc https://raw.githubusercontent.com/tonyday/vudotfiles/master/dots/vimrc_install
# get vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# start vim and execute vundle install
vim +PluginInstall +qall
