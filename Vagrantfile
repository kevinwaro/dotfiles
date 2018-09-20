# -*- mode: ruby -*-
$script = <<-SCRIPT
apt-get update
wget https://apt.puppetlabs.com/puppet5-release-stretch.deb
sudo dpkg -i puppet5-release-stretch.deb
sudo apt-get update
sudo apt-get install -y puppet-agent
SCRIPT

Vagrant.configure(2) do |config|

 config.vm.define "dotfiles1" do |dotfiles1|
   dotfiles1.vm.box ="debian/stretch64"
   dotfiles1.vm.network "private_network", ip: "192.168.200.11"
   dotfiles1.vm.hostname = "dotfiles1"
   dotfiles1.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
   end
   dotfiles1.vm.provision "ansible/dotfiles1", type: "ansible" do |ansible|
     ansible.playbook = "ansible/dotfiles.yml"
     ansible.verbose = "v"
     ansible.extra_vars = {
         "target" => "dotfiles"
     }
    end
 end

 config.vm.define "dotfiles2" do |dotfiles2|
   dotfiles2.vm.box ="debian/stretch64"
   dotfiles2.vm.network "private_network", ip: "192.168.200.12"
   dotfiles2.vm.hostname = "dotfiles2"
   dotfiles2.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
   end
   dotfiles2.vm.provision "shell", inline: $script
   dotfiles2.vm.provision "puppet" do |puppet|
     puppet.synced_folder_type = "rsync"
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file = "main.pp"
     puppet.module_path = "puppet/modules"
   end
 end

end
