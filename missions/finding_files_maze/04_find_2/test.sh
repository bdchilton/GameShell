gsh assert check false

find "$(eval_gettext '$GSH_HOME/Garden/Maze')" -type f -print0 | xargs -0 grep -l "$(gettext "ruby")" | xargs rm
gsh assert check false

find "$(eval_gettext '$GSH_HOME/Garden/Maze')" -type f -print0 | xargs -0 grep -l "$(gettext "ruby")" | xargs rm
echo "ruby" > "$(eval_gettext '$GSH_HOME/Garden/Maze')/12345"
gsh assert check false

find "$(eval_gettext '$GSH_HOME/Garden/Maze')" -type f -print0 | xargs -0 grep -l "$(gettext "ruby")" | xargs -I"{}" mv "{}" "$GSH_CHEST"
gsh assert check true
