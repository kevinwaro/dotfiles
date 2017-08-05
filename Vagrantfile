# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "dotfilevm" do |dotfilevm|
     dotfilevm.vm.box = "debian/jessie64"
     dotfilevm.vm.hostname = "dotfilevm"
     dotfilevm.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
        vb.cus = 1
     end
     dotfilevm.vm.provision "puppet" do |puppet|
         puppet.manifests_path = "puppet/manifests"
         puppet.modules_path = "puppet/modules"
         puppet.manifest_file = "dotfiles.pp"
     end
  end
end
