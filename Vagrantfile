Vagrant.configure('2') do |config|
  config.vm.hostname = 'postfix-monitor'
  config.vm.box = 'RightImage_CentOS_6.5_x64_v13.5.2'
  config.vm.box_url = 'https://rightscale-vagrant.s3.amazonaws.com/virtualbox/centos/6.5/RightImage_CentOS_6.5_x64_v13.5.2.box'
  config.vm.network :private_network, :ip => '33.33.33.11'
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
  end
  config.rightscaleshim.run_list_dir = 'runlists/default'
  config.rightscaleshim.shim_dir = 'rightscaleshim/default'
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.binary_path = '/opt/rightscale/sandbox/bin'
    chef.provisioning_path = '/tmp/vagrant-chef-solo'
    chef.file_cache_path = chef.provisioning_path
    chef.run_list = [
      # use rightscaleshim runlists
    ]
  end
end
