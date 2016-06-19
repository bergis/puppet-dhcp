class dhcp::params {

  $dnsdomain = [$::domain]

  case $::osfamily {
    'Debian': {
      $dhcp_dir    = '/etc/dhcp'
      $packagename = 'isc-dhcp-server'
      $servicename = 'isc-dhcp-server'
      $root_group  = 'root'
    }

    /^(FreeBSD|DragonFly)$/: {
      $dhcp_dir    = '/usr/local/etc'
      $packagename = 'isc-dhcp43-server'
      $servicename = 'isc-dhcpd'
      $root_group  = 'wheel'
    }

    'RedHat': {
      $dhcp_dir    = '/etc/dhcp'
      $packagename = 'dhcp'
      $servicename = 'dhcpd'
      $root_group  = 'root'
    }

    'OpenBSD': {
      $dhcp_dir    = '/etc'
      $packagename = 'isc-dhcp-server'
      $servicename = 'isc_dhcpd'
      $root_group  = 'wheel'
    }


    default: {
      fail("${::hostname}: This module does not support osfamily ${::osfamily}")
    }
  }
}
