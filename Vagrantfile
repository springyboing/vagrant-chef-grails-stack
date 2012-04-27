Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid32"

  # Forward guest port 80 to host port 4567 and name the mapping "web"
  config.vm.forward_port(80, 4567)   
  config.vm.forward_port(8080, 4568)

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.roles_path = "./roles"
    chef.data_bags_path = "./databags"

    # ensure the latest packages
#    chef.add_recipe("apt")
    chef.add_recipe("git")
    chef.add_recipe("subversion")
    chef.add_recipe("java")
#    chef.add_recipe("tomcat")    
    chef.add_recipe("application")
    chef.add_recipe("development")




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