name "ci-slave"
description "Build slave for Jenkins"
run_list "role[base]", "recipe[build-essential]", "recipe[jenkins::node_ssh]"
