# == Class prefs::ssh
#
# Manage ~/.ssh directory
#
class prefs::ssh (
  ) {
  $dir = "${prefs::home}/.ssh"
  $cfg = "${dir}/config"
  file { $dir:
    ensure => directory,
    mode   => '0700',
  }
  file { "${dir}/master":
    ensure  => directory,
    mode    => '0755',
    require => File[$dir],
  }

  concat { $cfg:
    mode    => '0644',
    require => File[$dir],
  }
  concat::fragment { "${cfg}:header":
    target  => $cfg,
    content => "\n# MANAGED BY PUPPET - LOCAL EDITS WILL BE OVERWRITTEN\n",
    order   => '01',
  }
  $hosts = hiera_hash('prefs::ssh::hosts',{})
  create_resources( 'prefs::ssh::host', $hosts )

  $keys = hiera_hash('prefs::ssh::keys',{})
  create_resources( 'prefs::ssh::key', $keys )
}

# == Resource prefs::ssh::host
#
# DOOD?
#
define prefs::ssh::host (
  $txt,
  $order = '02',
  $ensure = present,
  ) {
  $block = strip(regsubst($txt, "\n", "\n\t", 'G'))
  concat::fragment { "${prefs::ssh::cfg}:${name}":
    ensure  => $ensure,
    target  => $prefs::ssh::cfg,
    content => "\nHost ${name}\n\t${block}\n",
    order   => $order,
  }
}

# == Resource prefs::ssh::key
#
# DOOD?
#
define prefs::ssh::key (
  $public,
  $private,
  ) {
  $public_path = "${prefs::ssh::dir}/${name}.pub"
  file { $public_path:
    content => $public,
    mode    => '0644',
  }
  $private_path = "${prefs::ssh::dir}/${name}.pem"
  file { $private_path:
    content => $private,
    mode    => '0600',
  }
}
