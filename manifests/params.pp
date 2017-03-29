# Parameters for puppet-freezer
#
class freezer::params {
  include ::openstacklib::defaults

  $api_deploy_method  = 'apache'
  $api_bind_port      = '9090'
  $client_package     = 'python-freezerclient'
  $freezer_db_backend = 'elasticsearch'
  $db_sync_command    = 'freezer-manage db sync'

# TODO: vnogin 
# Test Freezer API wsgi app in Apache
# $freezer_wsgi_script_source = '/usr/bin/freezer-wsgi'

  case $::osfamily {
# TODO: vnogin
# Add RedHat params
#    'RedHat': {
#    }
    'Debian': {
      $api_package_name            = 'freezer-api'
      $scheduler_package_name      = 'freezer'
      $freezer_web_ui_package_name = 'freezer-web-ui'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
