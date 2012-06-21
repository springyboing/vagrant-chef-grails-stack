# -*- mode: ruby -*-
# vi: set ft=ruby :

# librarian-chef install

puts "User Folder: #{ENV['USER']}"
puts "Home Folder: #{ENV['HOME']}"
# puts 'RSA-KEY: ' + IO.read("#{ENV['HOME']}/.ssh/id_rsa")

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"
  #config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.customize [
    "modifyvm", :id,
    "--name", "GRAILS VM",
    "--memory", "768"
  ]

  config.vm.host_name = "dev.192.168.33.10.xip.io"
  config.vm.network :hostonly, "192.168.33.10"
  config.vm.forward_port(80, 9080)   
  config.vm.forward_port(8080, 9090)

  config.vm.provision :shell do |shell|
    shell.inline = "sudo apt-get -y -qq install build-essential mysql-client libmysqlclient-dev"
  end

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ["./cookbooks", "./my-cookbooks"]
    chef.roles_path = "./roles"
    chef.data_bags_path = "./databags"

    #chef.add_role("database")
    chef.add_role("dev")
    chef.add_role("application")
    # chef.add_role("message-bus")
    # chef.add_role("statsd")
    chef.json = {
      :mysql => {
        :server_root_password => 'password'
      },
      :dev_env => {
        :ssh_key => IO.read("#{ENV['HOME']}/.ssh/id_rsa")
      }
    }

  end

end
