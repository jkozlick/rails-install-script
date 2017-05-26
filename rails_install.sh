# Uninstall system version of git if installed
# Install PPA for most up-to-date git release
sudo apt-get remove git -y
sudo add-apt-repository ppa:git-core/ppa -y

# Ensure all package repos are up to date
sudo apt-get update

# Install required dependencies
sudo apt-get install build-essential curl git -y

# Used by certain gems commonly used, suc as erd-rails and rmagic
sudo apt-get install graphviz imagemagick -y

# Install RVM with current Ruby and rails
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB88
2D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=rails && rvm requiree
ments
echo "[[ -s \"/home/$USER/.rvm/scripts/rvm\" ]] && source \"/home/$USER/.rvm/scrr
ipts/rvm\"" >> ~/.bashrc

# Install NVM with current NodeJS
# I do my best to keep this up to date, but it may be worth checking what the most current version ios before you run the script
#  https://github.com/creationix/nvm#install-script

curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
source ~/.nvm/nvm.#!/bin/sh
nvm install stable
nvm use stable
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc

source ~/.bashrc

sudo  apt-get install postgresql postgresql-contrib libpq-dev -y
sudo -u postgres psql -c "CREATE USER $USER WITH CREATEDB SUPERUSER PASSWORD '$USER';"
sudo -u postgres psql -c "CREATE DATABASE $USER WITH OWNER $USER;"

sudo apt-get autoremove -y
