Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/precise64'
  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
    v.cpus = 2
  end
  Dir['??_*.sh'].sort.each do |filename|
    config.vm.provision 'shell', path: filename, privileged: false
  end
end
