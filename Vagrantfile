VAGRANT_VERSIONFILE_API=2

Vagrant.configure(VAGRANT_VERSIONFILE_API) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.box_version = "8.9.0"

  ssh_pub_key = File.readlines("provision/keys/acs/id_rsa_acs.pub").first.strip

  config.vm.define "acs" do |machine|
      machine.vm.network "private_network", ip: "192.168.40.20"
      machine.vm.hostname = "acs"

      machine.vm.provision "file", source: "provision/keys/acs/id_rsa_acs", destination: "/home/vagrant/.ssh/id_rsa"
      machine.vm.provision "shell", path: "provision/init_acs.sh"

      machine.vm.provider "virtualbox" do |vb|
        vb.name = "poc_acs"
      end
  end

  config.vm.define "jenkins" do |machine|
      machine.vm.network "private_network", ip: "192.168.40.21"
      machine.vm.network "forwarded_port", guest: 8080, host: 8080
      machine.vm.synced_folder ".", "/vagrant", disabled: true

      machine.vm.provision "shell" do |shell|
        shell.path = "provision/add_pub_key.sh"
        shell.args = [ "#{ssh_pub_key}" ]
      end

      machine.vm.provider "virtualbox" do |vb|
        vb.name = "poc_jenkins"
        vb.memory = 1024
      end
  end

  config.vm.define "server1" do |machine|
    machine.vm.network "private_network", ip: "192.168.40.22"
    machine.vm.synced_folder ".", "/vagrant", disabled: true

    machine.vm.provision "shell" do |shell|
      shell.path = "provision/add_pub_key.sh"
      shell.args = [ "#{ssh_pub_key}" ]
    end

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_server1"
    end
  end

end
