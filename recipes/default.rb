#
# Cookbook Name:: postfix_monitor
# Recipe:: default
#
# Copyright (C) 2014 Ryan Cragun
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
rightscale_marker

return unless node['postfix_monitor']['enable_plugin'] == 'true'

include_recipe 'rightscale::setup_monitoring'

log 'Installing postfix_monitor collectd plugin..'

conf = ::File.join(node['rightscale']['collectd_plugin_dir'], 'postfix.conf')
template conf do
  backup false
  source 'postfix.conf.erb'
  notifies :restart, 'service[collectd]'
  variables(
    :mail_log => node['postfix_monitor']['mail_log']
  )
end
