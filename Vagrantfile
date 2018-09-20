# -*- mode: ruby -*-
Vagrant.configure(2) do |config|

 config.vm.define "dotfiles" do |dotfiles|
   dotfiles.vm.box ="debian/stretch64"
   dotfiles.vm.network "private_network", ip: "192.168.200.11"
   dotfiles.vm.hostname = "dotfiles"
   dotfiles.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
   end
   dotfiles.vm.provision "ansible/dotfiles", type: "ansible" do |ansible|
     ansible.playbook = "ansible/dotfiles.yml"
     ansible.verbose = "v"
     ansible.extra_vars = {
         "target" => "dotfiles"
     }
    end
 end

end
