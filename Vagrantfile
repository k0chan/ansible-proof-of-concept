VAGRANT_VERSIONFILE_API=2

Vagrant.configure(VAGRANT_VERSIONFILE_API) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.box_version = "8.5.1"
  config.ssh.insert_key = false

  # ruby syntax loop for multiple java machines develop, stable and prod environment
  config.vm.define "javamachine1" do |machine|
    # machine.vm.hostname = "java-server"
    machine.vm.network "private_network", ip: "192.168.40.20"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_javamachine1"
    end
  end

  config.vm.define "javamachine2" do |machine|
    # machine.vm.hostname = "java-server"
    machine.vm.network "private_network", ip: "192.168.40.21"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_javamachine2"
    end
  end

  config.vm.define "javamachine3" do |machine|
    # machine.vm.hostname = "java-server"
    machine.vm.network "private_network", ip: "192.168.40.22"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_javamachine3"
    end
  end

  config.vm.define "phpmachine1" do |machine|
    # machine.vm.hostname = "php-server"
    machine.vm.network "private_network", ip: "192.168.40.30"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_phpmachine1"
    end
  end

  config.vm.define "mysqlmachine1" do |machine|
    # machine.vm.hostname = "mysql-server"
    machine.vm.network "private_network", ip: "192.168.40.40"

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "poc_mysqlmachine1"
    end
  end
end
