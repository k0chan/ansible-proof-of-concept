VAGRANT_VERSIONFILE_API=2

Vagrant.configure(VAGRANT_VERSIONFILE_API) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.box_version = "8.9.0"

  config.vm.define "acs" do |machine|
      machine.vm.network "private_network", ip: "192.168.40.20"
      machine.vm.hostname = "acs"

      machine.vm.provision "file", source: "provision/keys/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
      machine.vm.provision "shell", path: "provision/init_acs.sh"

      machine.vm.provider "virtualbox" do |vb|
        vb.name = "poc_acs"
      end
    end

  config.vm.define "server1" do |machine|
    machine.vm.network "private_network", ip: "192.168.40.21"

    ssh_pub_key = File.readlines("provision/keys/id_rsa.pub").first.strip
    machine.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_server1"
    end
  end

end
