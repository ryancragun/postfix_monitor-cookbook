require 'spec_helper'

describe 'postfix_monitor::default' do
  let(:config_file) { '/usr/lib64/collectd/postfix.conf' }
  let(:chef_run) do
    ChefSpec::ChefRunner.new(:platform => 'centos',
                             :version => '6.0') do |node|
      node.set['postfix_monitor']['enable_plugin'] = 'true'
      node.set['postfix_monitor']['mail_log'] =  '/var/log/mail.log'
      node.set['rightscale']['collectd_plugin_dir'] = '/usr/lib64/collectd/'
    end.converge(described_recipe)
  end

  it 'installs RightScale monitoring' do
    expect(chef_run).to include_recipe('rightscale::setup_monitoring')
  end

  it 'installs a collectd tail monitoring file' do
    expect(chef_run).to create_file(config_file)
  end

  it 'restarts collectd' do
    resource = chef_run.template(config_file)
    expect(resource).to notify('service[collectd]', :restart)
  end
end
