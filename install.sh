#!/usr/bin/env bash

SOLOISTDIR="${HOME}/soloistgo"
SOLOISTRC_URL="https://raw.github.com/clifferson/rails-go/master/soloistrc"
CHEFFILE_URL="https://raw.github.com/clifferson/rails-go/master/Cheffile"

# We are going to install omnibus chef and then use its embedded ruby/gem for soloist.
OMNIBUS_CHEFCLIENT_URL="https://www.opscode.com/chef/install.sh"
CHEF_EMBEDDED_PATH="/opt/chef/embedded/bin"

echo "I can has root?"
sudo true

## step one install omnibus chef
echo "Installing omnibus chef."
curl -L https://www.opscode.com/chef/install.sh | sudo bash

## step two install soloist
echo "Installing soloist & plist gem"
if [ ! $(gem specification soloist &>/dev/null) ]; then sudo ${CHEF_EMBEDDED_PATH}/gem install soloist --no-rdoc --no-ri; fi
if [ ! $(gem specification plist &>/dev/null) ]; then sudo ${CHEF_EMBEDDED_PATH}/gem install plist --no-rdoc --no-ri; fi

## step three prep the needed dirs and files
echo "Creating soloistgo dir"
mkdir ${SOLOISTDIR}

echo "Downloading soloistrc"
curl ${SOLOISTRC_URL} -o ${SOLOISTDIR}/soloistrc

echo "Downloading Cheffile"
curl ${CHEFFILE_URL} -o ${SOLOISTDIR}/Cheffile

## step four rock it out
echo "Running soloist"
cd ${SOLOISTDIR} && sudo ${CHEF_EMBEDDED_PATH}/soloist

if [ $? -eq 0 ]; then
  echo "Soloist run complete, you might want to delete ${SOLOISTDIR}?"
else
  echo "Soloist failed, run it again: cd ${SOLOISTDIR} && sudo ${CHEF_EMBEDDED_PATH}/soloist"
fi
