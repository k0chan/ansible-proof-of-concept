VAGRANT_VERSIONFILE_API=2

Vagrant.configure(VAGRANT_VERSIONFILE_API) do |config|

  config.vm.define "acs" do |acs|
    acs.vm.box = "ubuntu/trusty64"
    acs.vm.hostname = "acs"
    acs.vm.network "private_network", ip: "192.168.33.10"
    acs.vm.provision "shell", path: "provision/acs_init.sh"

    acs.vm.synced_folder "playbook/", "/home/vagrant/playbook"
    acs.vm.synced_folder "playbook/", "/home/vagrant/playbook"

    acs.vm.provider "virtualbox" do |vb|
      vb.name = "poc_ansible_acs"
    end
  end

  config.vm.define "machine" do |machine|
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.hostname = "machine1"
    machine.vm.network "private_network", ip: "192.168.33.20"
    machine.vm.provision "shell", path: "provision/machine_init.sh"
    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_ansible_machine1"
    end
  end
end
