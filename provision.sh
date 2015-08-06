# Update
sudo apt-get update -y

# Upgrade
sudo apt-get dist-upgrade -y

# Install git
sudo apt-get install -y git-core

# Install curl
sudo apt-get install -y curl

# Install some required libraries
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libyaml-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libxslt1-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y python-software-properties
sudo apt-get install -y libffi-dev

# Install ruby from source (no need for ruby version manager)
# Get the source
curl -O https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
# unpack the source
tar xvzf ruby-2.2.2.tar.gz
# configure and make
cd ruby-2.2.2
./configure --prefix=$HOME/ruby
make
make install
cd

# Add ruby bin path to PATH
echo 'export PATH="$HOME/ruby/bin:$PATH"' >> ~/.bashrc

# Prevent gem installs from installing documentation (which we don't use)
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler gem
# Use full path since we have not added bin path to PATH in this shell session
~/ruby/bin/gem install bundler

# Configure some git properties
git config --global color.ui true

# Install nodejs
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

# Install Postgres
sudo apt-get install -y postgresql postgresql-contrib

# ----- change Postgres configuration to allow "trusted" local connections
# ipv4 & ipv6
sudo sed -i."$(date +%FT%T)" '/host *all *all */ s/md5/trust/' /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i."$(date +%FT%T)" '/local *all *all */ s/peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i."$(date +%FT%T)" '/local *all *postgres */ s/peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf

# ----- reload postgres config
sudo service postgresql reload

# ----- install library needed to build pg gem
sudo apt-get install -y libpq-dev

# ----- install tree
sudo apt-get install -y tree

# Install Heroku toolbelt
curl https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Setup some useful aliases and bash stuff
cat << 'EOF' > ~/.bash_aliases

# Include git branch in bash prompt
source /etc/bash_completion.d/git-prompt

# I decided we needed just the tiniest bit of bling
# Some color stuff
None='\e[0m'
Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Magenta='\e[0;35m'
Cyan='\e[0;36m'
White='\e[0;37m'

_host="${Blue}\h${None}"
_dir="${Green}\w${none}"
_git="${Red}\$(__git_ps1)${None}"

export PS1="${_host}[${_dir}]${_git} "

# Some useful aliases
alias be="bundle exec"
alias bef="bundle exec foreman"
alias befr="bundle exec foreman run"
alias gs="git status -s"
alias gss="git status"
alias gd="git diff"
alias gl="git log --oneline --decorate --color --graph"
alias gp="git push"
alias gwc="git whatchanged -p --abbrev-commit --pretty=medium"
alias glola='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'

EOF

# Clean-up the box for re-packaging
# Remove APT cache
sudo apt-get clean -y
# "zero out" drive
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
# Clear bash history
cat /dev/null > ~/.bash_history && history -c
