# Add PPAs to get latest version of some packages

# git PPA - see https://launchpad.net/~git-core/+archive/ubuntu/ppa
sudo apt-add-repository ppa:git-core/ppa

# Update
sudo apt-get update -y

# Upgrade
sudo apt-get dist-upgrade -y
