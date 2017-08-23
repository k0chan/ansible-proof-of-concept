VAGRANT_VERSIONFILE_API=2

Vagrant.configure(VAGRANT_VERSIONFILE_API) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.box_version = "8.9.0"

  config.vm.define "server1" do |machine|
    machine.vm.network "private_network", ip: "192.168.40.20"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_server1"
    end
  end

end
