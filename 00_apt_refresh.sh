# Add PPAs to get more recent vesions of some packages

# git PPA - see https://launchpad.net/~git-core/+archive/ubuntu/ppa
sudo apt-add-repository ppa:git-core/ppa

# Qt5
sudo add-apt-repository -y ppa:canonical-qt5-edgers/ubuntu1204-qt5

# Gstreamer
sudo add-apt-repository -y ppa:elementary-os/stable

# Vim 7.4
sudo add-apt-repository -y ppa:kalakris/vim

# Postgres (for 9.6)
sudo tee /etc/apt/sources.list.d/pgdg.list <<-EOS
deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
EOS
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Tmux 1.9a
sudo add-apt-repository -y ppa:pi-rho/dev

# Update
sudo apt-get update -y

# Upgrade
sudo apt-get dist-upgrade -y
