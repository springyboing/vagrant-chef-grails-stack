# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  config.vbguest.auto_update = false

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"
  #config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.forward_port(80, 9080)   
  config.vm.forward_port(8080, 9090)

  #config.vm.provision :shell do |shell|
  #  shell.inline = "gem update --conservative chef"
  #end

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ["./cookbooks", "./my-cookbooks"]
    chef.roles_path = "./roles"
    #chef.data_bags_path = "./databags"

    chef.add_role("dev")
    #chef.add_role("statsd")

    chef.json.merge!({
        :java => {
          :install_flavor => "openjdk"
        },
        :mysql => {
            :bind_address => "127.0.0.1"
        }

    })

  end

end
