# == Class: prefs
#
# Full description of class prefs here.
#
# === Parameters
#
# [*home*]
#   Your home directory.
#
class prefs (
  $home,
  ) {

  class { '::prefs::install': } ->
  class { '::prefs::config': } ~>
  class { '::prefs::ssh': } ~>
  class { '::prefs::service': } ->
  Class['::prefs']
}
