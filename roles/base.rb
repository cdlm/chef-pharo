name "base"
description "Base platform config & tools"
run_list "recipe[git]", "recipe[subversion]", "recipe[tmux]", "recipe[zsh]"

