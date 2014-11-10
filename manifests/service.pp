# == Class prefs::service
#
# This class is meant to be called from prefs
# It ensure the service is running
#
class prefs::service {

  # service { $::prefs::service_name:
  #   ensure     => running,
  #   enable     => true,
  #   hasstatus  => true,
  #   hasrestart => true,
  # }
}
