# dotfiles
Doggedly documenting Don's dorky dogmatic dotfiles

Use Gnu Stow to manage dotfiles.
Rough instructions:
1) Clone this repo to a new machine such that it lives in $HOME/
2) cd into dotfiles
3) run 'stow .', which creates symlinks in the $HOME directory
source:
https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/



OLD Directions for symlinking which I no longer use, but might be useful.

Strategy is:

1) Move a config/dotfile to this directory (~/dotfiles) on my local machine:
> mv <absolute_path_to_and_name_of_dotfile> <absolute_path_to_dotfiles_git_dir_and_file_name>

2) symlink back to where file originally was (where -s is the "soft" flag):
> ln -s <absolute_path_to_dotfiles_git_dir_and_file_name> <absolute_path_and_name_of_where_dotfile_before_mv_in_step_1>

Note: if I am symlinking a full directory, like Hammerspoon, then it seems I need to do something like:
1) Move .hammerspoon to dotfiles
2) Create an empty directory .hammerspoon in ~ (where it used to be)
3) > ln -s <absolute_path>/dotfiles/.hammerspoon <absolute_path>/
and don't put .hammerspoon in that second path (:shrug:)
