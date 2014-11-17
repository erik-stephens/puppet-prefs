# == Class prefs::config
#
# This class is called from prefs
#
class prefs::config {
  file { "${prefs::home}/.bashrc":
    source => 'puppet:///modules/prefs/bashrc',
    mode   => '0644',
  }
  file { "${prefs::home}/.bash_profile":
    source => 'puppet:///modules/prefs/profile',
    mode   => '0644',
  }
  file { "${prefs::home}/.inputrc":
    source => 'puppet:///modules/prefs/inputrc',
    mode   => '0644',
  }
  file { "${prefs::home}/.gitconfig":
    source => 'puppet:///modules/prefs/gitconfig',
    mode   => '0644',
  }
}
