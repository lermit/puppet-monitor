# Class: monitor::params
#
# This class defines default parameters used by the main module class monitor
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to monitor class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class monitor::params {

  # General Settings
  $my_class = ''
  $monitor = true
  $monitor_tool = ''
  $address = $::ipaddress
  $host_name = $::fqdn

  # Nagios/Shinken specific
  $action_url = ''
  $active_checks_enabled = ''
  $host_alias = ''
  $check_command = ''
  $check_freshness = ''
  $check_interval = ''
  $check_period = ''
  $contact_groups = ''
  $contacts = ''
  $display_name = ''
  $event_handler = ''
  $event_handler_enabled = ''
  $failure_prediction_enabled = ''
  $first_notification_delay = ''
  $flap_detection_enabled = ''
  $flap_detection_options = ''
  $freshness_threshold = ''
  $high_flap_threshold = ''
  $hostgroups = ''
  $icon_image = ''
  $icon_image_alt = ''
  $initial_state = ''
  $low_flap_threshold = ''
  $max_check_attempts = ''
  $notes = 'Node managed by puppet'
  $notes_url = ''
  $notification_interval = ''
  $notification_options = ''
  $notification_period = ''
  $notifications_enabled = ''
  $obsess_over_host = ''
  $parents = ''
  $passive_checks_enabled = ''
  $process_perf_data = ''
  $retain_nonstatus_information = ''
  $retain_status_information = ''
  $retry_interval = ''
  $stalking_options = ''
  $statusmap_image = ''
  $use = 'generic-host'
  $vrml_image = ''

}
