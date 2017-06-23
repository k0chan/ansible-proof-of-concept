VAGRANT_VERSIONFILE_API=2

Vagrant.configure(VAGRANT_VERSIONFILE_API) do |config|

  config.vm.define "machine1" do |machine|
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.box_version = "20170615.0.0"
    # machine.vm.hostname = "java-server"
    machine.vm.network "private_network", ip: "192.168.33.20"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_ansible_machine1"
    end
  end

  config.vm.define "machine2" do |machine|
    machine.vm.box = "debian/jessie64"
    machine.vm.box_version = "8.5.1"
    # machine.vm.hostname = "php-server"
    machine.vm.network "private_network", ip: "192.168.33.21"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_ansible_machine2"
    end
  end

  config.vm.define "machine3" do |machine|
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.box_version = "20170615.0.0"
    # machine.vm.hostname = "mysql-server"
    machine.vm.network "private_network", ip: "192.168.33.22"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_ansible_machine3"
    end
  end
end
