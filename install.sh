# DO NOT run this file as root or use sudo
# This will ensure that the libraries are installed to your user account
#
# You will however, need sudo access on the machine which you will be performing the install. You will be prompted for your sudo password in order for aptitude to install libraries

# Uninstall system version of git if installed
# Install PPA for most up-to-date git release
sudo apt-get remove git -y
sudo add-apt-repository ppa:git-core/ppa -y

# Ensure all package repos are up to date
sudo apt-get update

# Install required dependencies
sudo apt-get install build-essential curl git -y

# Used by certain gems commonly used, such as erd-rails(graphviz) and rmagick(imagemagick)
# If you don't use these gems, you can comment this line, however, they are common enough that it is probably a good idea to have these libraries installed
sudo apt-get install graphviz imagemagick -y

# Install RVM with current Ruby and Rails
curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=rails && rvm requirements
echo "[[ -s \"/home/$USER/.rvm/scripts/rvm\" ]] && source \"/home/$USER/.rvm/scripts/rvm\"" >> ~/.bashrc

# Install NVM with current NodeJS
# I do my best to keep this up to date, but it may be worth checking what the most current version is before you run the script
# https://github.com/creationix/nvm#install-script

curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install stable
nvm use stable
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc

# Load .bashrc so that RVM and NVM scripts work
source ~/.bashrc


# Install PostgreSQL server and client
#
# The postgres username will be the same as your system username, the password
# will also be your username. This can easily be changed after setup is complete if desired

sudo apt-get install postgresql postgresql-contrib libpq-dev -y
sudo -u postgres psql -c "CREATE USER $USER WITH CREATEDB SUPERUSER PASSWORD '$USER';"
sudo -u postgres psql -c "CREATE DATABASE $USER WITH OWNER $USER;"

# Clean up uneeded packages
sudo apt-get autoremove -y
