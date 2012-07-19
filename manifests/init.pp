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
  $my_class                     = param_lookups('my_class'),
  $monitor                      = param_lookups('monitor'),
  $monitor_tool                 = params_lookup( 'monitor_tool' , 'global' ),
  $action_url                   = param_lookups('action_url'),
  $active_checks_enabled        = param_lookups('active_checks_enabled'),
  $address                      = param_lookups('address'),
  $alias                        = param_lookups('alias'),
  $check_command                = param_lookups('check_command'),
  $check_freshness              = param_lookups('check_freshness'),
  $check_interval               = param_lookups('check_interval'),
  $check_period                 = param_lookups('check_period'),
  $contact_groups               = param_lookups('contact_groups'),
  $contacts                     = param_lookups('contacts'),
  $display_name                 = param_lookups('display_name'),
  $event_handler                = param_lookups('event_handler'),
  $event_handler_enabled        = param_lookups('event_handler_enabled'),
  $failure_prediction_enabled   = param_lookups('failure_prediction_enabled'),
  $first_notification_delay     = param_lookups('first_notification_delay'),
  $flap_detection_enabled       = param_lookups('flap_detection_enabled'),
  $flap_detection_options       = param_lookups('flap_detection_options'),
  $freshness_threshold          = param_lookups('freshness_threshold'),
  $high_flap_threshold          = param_lookups('high_flap_threshold'),
  $host_name                    = param_lookups('host_name'),
  $hostgroups                   = param_lookups('hostgroups'),
  $icon_image                   = param_lookups('icon_image'),
  $icon_image_alt               = param_lookups('icon_image_alt'),
  $initial_state                = param_lookups('initial_state'),
  $low_flap_threshold           = param_lookups('low_flap_threshold'),
  $max_check_attempts           = param_lookups('max_check_attempts'),
  $notes                        = param_lookups('notes'),
  $notes_url                    = param_lookups('notes_url'),
  $notification_interval        = param_lookups('notification_interval'),
  $notification_options         = param_lookups('notification_options'),
  $notification_period          = param_lookups('notification_period'),
  $notifications_enabled        = param_lookups('notifications_enabled'),
  $obsess_over_host             = param_lookups('obsess_over_host'),
  $parents                      = param_lookups('parents'),
  $passive_checks_enabled       = param_lookups('passive_checks_enabled'),
  $process_perf_data            = param_lookups('process_perf_data'),
  $retain_nonstatus_information = param_lookups('retain_nonstatus_information'),
  $retain_status_information    = param_lookups('retain_status_information'),
  $retry_interval               = param_lookups('retry_interval'),
  $stalking_options             = param_lookups('stalking_options'),
  $statusmap_image              = param_lookups('statusmap_image'),
  $use                          = param_lookups('use'),
  $vrml_image                   = param_lookups('vrml_image')
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
