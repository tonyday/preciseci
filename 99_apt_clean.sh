# Clean-up the box for re-packaging
# Remove APT cache
sudo apt-get clean -y
# "zero out" drive
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
# Clear bash history
cat /dev/null > ~/.bash_history && history -c
