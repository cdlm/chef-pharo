name "seaside-server"
description "Web server for Seaside apps"
run_list "role[base]", "recipe[pharo]"
