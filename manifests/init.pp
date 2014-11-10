# == Class: prefs
#
# Full description of class prefs here.
#
# === Parameters
#
# [*home*]
#   Explanation of what this parameter affects and what it defaults to.
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
