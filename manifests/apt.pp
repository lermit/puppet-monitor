define monitor::apt (
  $tool,
  $enable=true
  ) {

  $bool_enable=any2bool($enable)

  $ensure = $bool_enable ? {
    false => 'absent',
    true  => 'present',
  }

  if ($tool =~ /munin/) {
  }

  if ($tool =~ /collectd/) {
  }

  if ($tool =~ /monit/) {
  }

  if ($tool =~ /nagios/) {
    nagios::service { "$name":
      ensure        => $ensure,
      check_command => 'check_nrpe!check_apt',
    }
  }

  if ($tool =~ /icinga/) {
    icinga::service { "$name":
      ensure        => $ensure,
      check_command => 'check_nrpe!check_apt',
    }
  }

  if ($tool =~ /shinken/) {
    shinken::service { "$name":
      ensure        => $ensure,
      check_command => 'check_nrpe!check_apt',
    }
  }

  if ($tool =~ /puppi/) {
  }

}
