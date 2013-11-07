
### Requires 
 * [Xcode](https://developer.apple.com/xcode/) and [Command Line Tools](http://docwiki.embarcadero.com/RADStudio/XE4/en/Installing_the_Xcode_Command_Line_Tools_on_a_Mac)

## Install and run soloist 

```bash
curl -L https://raw.github.com/clifferson/rails_go/master/install.sh | sh
```

## Attributes you can control via ENV vars.

These attributes expect a curl compatiable url. http://foo.com/soloistrc or file:/path/to/Cheffile

* SOLOISTRC_URL - `export SOLOISTRC_URL="http://foo.com/soloistrc"`
* CHEFFILE_URL - `export CHEFFILE_URL="file:/path/to/Cheffile"`

These default to using the respective files in my soloist-config repo. 


This should be all you have to do to get your OS X 10.8 running.

## What now?
install.sh will install omnibus chef, pull down the Cheffile (for gathing cookbook deps with librarian) and soloistrc which conatins the run list and node objects for soloist,
install and run the [soloist](https://github.com/mkocher/soloist) gem (using the omnibus chef embedded ruby) which will manage a chef-solo run.

cookbooks from [pivotal-sprout](https://github.com/pivotal-sprout/sprout)
omnibus chef from [opscode](http://www.opscode.com/chef/install/)
