name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[build-essential]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[apt]",
  "recipe[git]"
  
  # "recipe[iptables]",
  #   "recipe[users]",
  #   "recipe[sudo]",
) 
override_attributes(
  :authorization => {
    :sudo => {
      :users => ["ubuntu", "vagrant"],
      :passwordless => true
    }
  }
)
