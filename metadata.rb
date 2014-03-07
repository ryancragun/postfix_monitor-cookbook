name             'postfix_monitor'
maintainer       'Ryan Cragun'
maintainer_email 'ryan@rightscale.com'
license          'Apache 2.0'
description      'Configures postfix collectd monitoring plugin'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
%w(redhat ubuntu centos debian fedora suse).each { |distro| supports distro }

depends 'rightscale'

recipe 'postfix_monitor::default',
  'Configures a collectd tail plugin to monitor postfix'

attribute 'postfix_monitor/mail_log',
  :display_name => 'Postfix Mail Log',
  :description  => 'The postfix mail log location',
  :required     => 'required',
  :recipes      => %w(postfix_monitor::default)

attribute 'postfix_monitor/enable_plugin',
  :display_name => 'Enable Postfix Monitoring',
  :description  => 'Enable or disable the postfix monitoring plugin',
  :required     => 'required',
  :recipes      => %w(postfix_monitor::default),
  :choice       => %w(true false)
