# Get latest nvm
git clone https://github.com/creationix/nvm.git ~/.nvm && \
cd ~/.nvm && \
git checkout `git describe --abbrev=0 --tags`

# Source nvm so that we can use it
source ~/.nvm/nvm.sh

# Install and latest node and set as default
nvm install stable
nvm alias default stable
nvm use default

# Source nvm at login
read -r -d '' VAR <<'EOF'
# Source nvm
source ~/.nvm/nvm.sh
EOF
echo "$VAR" >> ~/.bashrc
echo "$VAR" >> ~/.zshrc
