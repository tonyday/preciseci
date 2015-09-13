# Install oh-my-zsh
# Based on https://github.com/robbyrussell/oh-my-zsh#manual-installation
# Clone Oh My Zsh from the git repo
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Copy in the default .zshrc config file
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Change the vagrant user's shell to use zsh
sudo chsh -s /bin/zsh vagrant

# Tell zsh to load customisations (if they exist)
cat << 'EOF' >> ~/.zshrc
# Load customisations (if they exist)
[ -f .custom_bash_zsh ] && source .custom_bash_zsh
EOF
