# == Class prefs::config
#
# This class is called from prefs
#
class prefs::config {
  $home = '/Users/e'
  file { "${home}/.bashrc":
    source => 'puppet:///modules/prefs/bashrc',
    mode   => '0644',
  }
  file { "${home}/.bash_profile":
    source => 'puppet:///modules/prefs/profile',
    mode   => '0644',
  }
  file { "${home}/.inputrc":
    source => 'puppet:///modules/prefs/inputrc',
    mode   => '0644',
  }
  file { "${home}/.gitconfig":
    source => 'puppet:///modules/prefs/gitconfig',
    mode   => '0644',
  }
}
