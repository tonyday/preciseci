# Install ruby from source (no need for ruby version manager)
# Get the source
curl -O https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
# unpack the source
tar xvzf ruby-2.2.3.tar.gz
# configure and make
cd ruby-2.2.3
./configure --prefix=$HOME/ruby
make
make install
cd

# Add ruby bin path to PATH
read -r -d '' VAR <<'EOF'
# Add freshly minted Ruby to PATH
export PATH="$HOME/ruby/bin:$PATH"
EOF
echo "$VAR" >> ~/.bashrc
echo "$VAR" >> ~/.zshrc

# Prevent gem installs from installing documentation (which we don't use)
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler gem
# Use full path since we have not added bin path to PATH in this shell session
~/ruby/bin/gem install bundler

# Configure some git properties
git config --global color.ui true

# Install Heroku toolbelt
curl https://toolbelt.heroku.com/install-ubuntu.sh | sh
