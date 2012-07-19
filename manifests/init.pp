# = Class: monitor
#
# This is the main monitor class
#
#
# == Parameters
#
# Specific class parameters
#
# [*my_class*]
#
#
# [*absent*]
#
#
# [*address*]
#
# This directive is used to define the address of the host.
# Normally, this is an IP address, although it could really be anything
# you want (so long as it can be used to check the status of the host).
# You can use a FQDN to identify the host instead of an IP address,
# but if DNS services are not available this could cause problems.
# Default is $::ipaddress
#
# == Nagios parameters
#
# [*action_url*]
#
# This directive is used to define an optional URL that can be used to
# provide more actions to be performed on the host.
# If you specify an URL, you will see a red "splat" icon in the CGIs
# (when you are viewing host information) that links to the URL you specify
# here. Any valid URL can be used. If you plan on using relative paths, the
# base path will the the same as what is used to access the CGIs
# (i.e. /cgi-bin/nagios/).
#
# [*active_checks_enabled*]
#
# This directive is used to determine whether or not active checks (either
# regularly scheduled or on-demand) of this host are enabled.
# Values:
#   0 = disable active host checks,
#   1 = enable active host checks (default).
#
# [*alias*]
#
# This directive is used to define a longer name or description used to
# identify the host. It is provided in order to allow you to more easily
# identify a particular host. When used properly, the $HOSTALIAS$
# macro will contain this alias/description.
#
# [*check_command*]
#
# ...
#
# [*check_freshness*]
#
# ...
#
# [*check_interval*]
#
# ...
#
# [*check_period*]
#
# ...
#
# [*contact_groups*]
#
# ...
#
# [*contacts*]
#
# ...
#
# [*display_name*]
#
# ...
#
# [*event_handler*]
#
# ...
#
# [*event_handler_enabled*]
#
# ...
#
# [*failure_prediction_enabled*]
#
# ...
#
# TODO continu

class monitor (
  $my_class                     = params_lookup('my_class'),
  $monitor                      = params_lookup('monitor'),
  $monitor_tool                 = params_lookup( 'monitor_tool' , 'global' ),
  $action_url                   = params_lookup('action_url'),
  $active_checks_enabled        = params_lookup('active_checks_enabled'),
  $address                      = params_lookup('address'),
  $alias                        = params_lookup('alias'),
  $check_command                = params_lookup('check_command'),
  $check_freshness              = params_lookup('check_freshness'),
  $check_interval               = params_lookup('check_interval'),
  $check_period                 = params_lookup('check_period'),
  $contact_groups               = params_lookup('contact_groups'),
  $contacts                     = params_lookup('contacts'),
  $display_name                 = params_lookup('display_name'),
  $event_handler                = params_lookup('event_handler'),
  $event_handler_enabled        = params_lookup('event_handler_enabled'),
  $failure_prediction_enabled   = params_lookup('failure_prediction_enabled'),
  $first_notification_delay     = params_lookup('first_notification_delay'),
  $flap_detection_enabled       = params_lookup('flap_detection_enabled'),
  $flap_detection_options       = params_lookup('flap_detection_options'),
  $freshness_threshold          = params_lookup('freshness_threshold'),
  $high_flap_threshold          = params_lookup('high_flap_threshold'),
  $host_name                    = params_lookup('host_name'),
  $hostgroups                   = params_lookup('hostgroups'),
  $icon_image                   = params_lookup('icon_image'),
  $icon_image_alt               = params_lookup('icon_image_alt'),
  $initial_state                = params_lookup('initial_state'),
  $low_flap_threshold           = params_lookup('low_flap_threshold'),
  $max_check_attempts           = params_lookup('max_check_attempts'),
  $notes                        = params_lookup('notes'),
  $notes_url                    = params_lookup('notes_url'),
  $notification_interval        = params_lookup('notification_interval'),
  $notification_options         = params_lookup('notification_options'),
  $notification_period          = params_lookup('notification_period'),
  $notifications_enabled        = params_lookup('notifications_enabled'),
  $obsess_over_host             = params_lookup('obsess_over_host'),
  $parents                      = params_lookup('parents'),
  $passive_checks_enabled       = params_lookup('passive_checks_enabled'),
  $process_perf_data            = params_lookup('process_perf_data'),
  $retain_nonstatus_information = params_lookup('retain_nonstatus_information'),
  $retain_status_information    = params_lookup('retain_status_information'),
  $retry_interval               = params_lookup('retry_interval'),
  $stalking_options             = params_lookup('stalking_options'),
  $statusmap_image              = params_lookup('statusmap_image'),
  $use                          = params_lookup('use'),
  $vrml_image                   = params_lookup('vrml_image')
  ) inherits monitor::params {

  $bool_monitor=any2bool($monitor)

  $ensure = $bool_monitor ? {
    false => 'absent',
    true  => 'present',
  }

  if ( $monitor_tool =~ /munin/) {
  }

  if ( $monitor_tool =~ /collectd/) {
  }

  if ( $monitor_tool =~ /monit/) {
  }

  if ( $monitor_tool =~ /nagios/ or
    $monitor_tool =~ /shinken/) {

    @@nagios_host { "${monitor::host_name}":
      address   => "${monitor::address}",
      host_name => "${monitor::host_name}",
      use       => "${monitor::use}",
    }

    if "${monitor::action_url}" != '' {
      Nagios_host["${monitor::host_name}"] {
        action_url => "${monitor::action_url}",
      }
    }

    if "${monitor::active_checks_enabled}" != '' {
      Nagios_host["${monitor::host_name}"] {
        active_checks_enabled => "${monitor::active_checks_enabled}",
      }
    }

    if "${monitor::alias}" != '' {
      Nagios_host["${monitor::host_name}"] {
        alias => "${monitor::alias}",
      }
    }

    if "${monitor::check_command}" != '' {
      Nagios_host["${monitor::host_name}"] {
        check_command => "${monitor::check_command}",
      }
    }

    if "${monitor::check_freshness}" != '' {
      Nagios_host["${monitor::host_name}"] {
        check_freshness => "${monitor::check_freshness}",
      }
    }

    if "${monitor::check_interval}" != '' {
      Nagios_host["${monitor::host_name}"] {
        check_freshness => "${monitor::check_freshness}",
      }
    }

    if "${monitor::check_interval}" != '' {
      Nagios_host["${monitor::host_name}"] {
        check_interval => "${monitor::check_interval}",
      }
    }

    if "${monitor::check_period}" != '' {
      Nagios_host["${monitor::host_name}"] {
        check_period => "${monitor::check_period}",
      }
    }

    if "${monitor::contact_groups}" != '' {
      Nagios_host["${monitor::host_name}"] {
        contact_groups => "${monitor::contact_groups}",
      }
    }

    if "${monitor::contacts}" != '' {
      Nagios_host["${monitor::host_name}"] {
        contacts => "${monitor::contacts}",
      }
    }

    if "${monitor::display_name}" != '' {
      Nagios_host["${monitor::host_name}"] {
        display_name => "${monitor::display_name}",
      }
    }

    if "${monitor::event_handler}" != '' {
      Nagios_host["${monitor::host_name}"] {
        event_handler => "${monitor::event_handler}",
      }
    }

    if "${monitor::event_handler_enabled}" != '' {
      Nagios_host["${monitor::host_name}"] {
        event_handler_enabled => "${monitor::event_handler_enabled}",
      }
    }

    if "${monitor::failure_prediction_enabled}" != '' {
      Nagios_host["${monitor::host_name}"] {
        failure_prediction_enabled => "${monitor::failure_prediction_enabled}",
      }
    }

    if "${monitor::first_notification_delay}" != '' {
      Nagios_host["${monitor::host_name}"] {
        first_notification_delay => "${monitor::first_notification_delay}",
      }
    }

    if "${monitor::flap_detection_enabled}" != '' {
      Nagios_host["${monitor::host_name}"] {
        flap_detection_enabled => "${monitor::flap_detection_enabled}",
      }
    }

    if "${monitor::flap_detection_options}" != '' {
      Nagios_host["${monitor::host_name}"] {
        flap_detection_options => "${monitor::flap_detection_options}",
      }
    }

    if "${monitor::freshness_threshold}" != '' {
      Nagios_host["${monitor::host_name}"] {
        freshness_threshold => "${monitor::freshness_threshold}",
      }
    }

    if "${monitor::high_flap_threshold}" != '' {
      Nagios_host["${monitor::host_name}"] {
        high_flap_threshold => "${monitor::high_flap_threshold}",
      }
    }

    if "${monitor::hostgroups}" != '' {
      Nagios_host["${monitor::host_name}"] {
        hostgroups => "${monitor::hostgroups}",
      }
    }

    if "${monitor::icon_image}" != '' {
      Nagios_host["${monitor::host_name}"] {
        icon_image => "${monitor::icon_image}",
      }
    }

    if "${monitor::icon_image_alt}" != '' {
      Nagios_host["${monitor::host_name}"] {
        icon_image_alt => "${monitor::icon_image_alt}",
      }
    }

    if "${monitor::initial_state}" != '' {
      Nagios_host["${monitor::host_name}"] {
        initial_state => "${monitor::initial_state}",
      }
    }

    if "${monitor::low_flap_threshold}" != '' {
      Nagios_host["${monitor::host_name}"] {
        low_flap_threshold=> "${monitor::low_flap_threshold}",
      }
    }

    if "${monitor::max_check_attempts}" != '' {
      Nagios_host["${monitor::host_name}"] {
        max_check_attempts => "${monitor::max_check_attempts}",
      }
    }

    if "${monitor::notes}" != '' {
      Nagios_host["${monitor::host_name}"] {
        notes => "${monitor::notes}",
      }
    }

    if "${monitor::notes_url}" != '' {
      Nagios_host["${monitor::host_name}"] {
        notes_url => "${monitor::notes_url}",
      }
    }

    if "${monitor::notification_interval}" != '' {
      Nagios_host["${monitor::host_name}"] {
        notification_interval => "${monitor::notification_interval}",
      }
    }

    if "${monitor::notification_options}" != '' {
      Nagios_host["${monitor::host_name}"] {
        notification_options => "${monitor::notification_options}",
      }
    }

    if "${monitor::notification_period}" != '' {
      Nagios_host["${monitor::host_name}"] {
        notification_period => "${monitor::notification_period}",
      }
    }

    if "${monitor::notifications_enabled}" != '' {
      Nagios_host["${monitor::host_name}"] {
        notifications_enabled => "${monitor::notifications_enabled}",
      }
    }

    if "${monitor::obsess_over_host}" != '' {
      Nagios_host["${monitor::host_name}"] {
        obsess_over_host => "${monitor::obsess_over_host}",
      }
    }

    if "${monitor::parents}" != '' {
      Nagios_host["${monitor::host_name}"] {
        parents => "${monitor::parents}",
      }
    }

    if "${monitor::passive_checks_enabled}" != '' {
      Nagios_host["${monitor::host_name}"] {
        passive_checks_enabled=> "${monitor::passive_checks_enabled}",
      }
    }

    if "${monitor::process_perf_data}" != '' {
      Nagios_host["${monitor::host_name}"] {
        process_perf_data=> "${monitor::process_perf_data}",
      }
    }

    if "${monitor::retain_nonstatus_information}" != '' {
      Nagios_host["${monitor::host_name}"] {
        retain_nonstatus_information =>
          "${monitor::retain_nonstatus_information}",
      }
    }

    if "${monitor::retain_status_information}" != '' {
      Nagios_host["${monitor::host_name}"] {
        retain_status_information => "${monitor::retain_status_information}",
      }
    }

    if "${monitor::retry_interval}" != '' {
      Nagios_host["${monitor::host_name}"] {
        retry_interval => "${monitor::retry_interval}",
      }
    }

    if "${monitor::stalking_options}" != '' {
      Nagios_host["${monitor::host_name}"] {
        stalking_options => "${monitor::stalking_options}",
      }
    }

    if "${monitor::statusmap_image}" != '' {
      Nagios_host["${monitor::host_name}"] {
        statusmap_image => "${monitor::statusmap_image}",
      }
    }

    if "${monitor::vrml_image}" != '' {
      Nagios_host["${monitor::host_name}"] {
        vrml_image => "${monitor::vrml_image}",
      }
    }
  }

}
