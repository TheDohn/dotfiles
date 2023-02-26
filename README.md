# dotfiles
Doggedly documenting Don's dorky dogmatic dotfiles

Strategy is:

1) Move a config/dotfile to this directory on my local machine:
> mv <absolute_path_to_and_name_of_dotfile> <absolute_path_to_dotfiles_git_dir_and_file_name>


2) symlink back to where file originally was (where -s is the "soft" flag):
> ln -s <absolute_path_to_dotfiles_git_dir_and_file_name> <absolute_path_and_name_of_where_dotfile_before_mv_in_step_1>
