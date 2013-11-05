###
# What the Functions
###

function avaliable_rails_versions {
  #gem list ^rails$ -ra | grep -v "REMOTE GEMS" | awk -F "[()]" '{ for (i=2; i<NF; i+=2) print $i }' | awk 'gsub(", ","\n")'
  cat mock_versions.txt
}

function show_avaliable_rails_versions {
  avaliable_rails_versions | $PAGER
}

function latest_rails_version {
  avaliable_rails_versions | head -n1
}

echo "What version of rails would you like installed?"
show_avaliable_rails_versions
read rails_version
echo ${rails_version}
