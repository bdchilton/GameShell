gsh assert check false

find "$(eval_gettext '$GSH_HOME/Garden/Maze')" -name "*$(gettext "silver_coin")*" -type f -print0 | xargs -0 rm -rf
gsh assert check false

find "$(eval_gettext '$GSH_HOME/Garden/Maze')" -name "*$(gettext "silver_coin")*" -type f -print0 | xargs -0 rm -rf
echo "coin" > "$(eval_gettext '$GSH_HOME/Garden/Maze')/silver_coin"
gsh assert check false

find "$(eval_gettext '$GSH_HOME/Garden/Maze')" -name "*$(gettext "silver_coin")*" -type f -exec mv "{}" $GSH_CHEST \;
gsh assert check true
