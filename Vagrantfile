# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  #NOTE: if you have a 32bit OS you must comment out the next line and uncomment the one after
  config.vm.box = "lucid64"
  #config.vm.box = "lucid32"
  config.vm.customize [
    "modifyvm", :id,
    "--name", "Yotta Portal - Unbuntu", 
    "--memory", "1024"
  ]
  Vagrant::Config.run do |config|
    config.vm.network :hostonly, "33.33.33.10"
  end
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w( cookbooks local)
    chef.add_recipe "vagrant_main"
    chef.log_level = :debug
  end
  #NOTE: Non-windows users should uncomment the next line a comment out the the line after
  #config.vm.share_folder("v-app", "/yotta/portal", "~/Projects/portal/RolesManagement", :nfs => true)
  config.vm.share_folder("v-app", "/yotta/portal", "c:/portal/RolesManagement")
  
end
