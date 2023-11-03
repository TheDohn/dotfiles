

# may need this for Emacs to recongnize zsh themes
#export EMACS="*term*"

#if [ $(hostname) = 'MacBook-Pro' ]; then # this got changed when I updated to Ventura OS
if [ $(hostname) = "Don's-MacBook-Pro" ]; then
    source /Users/donbunk/local_dotfiles/.local_zshrc
    #    #TODO get this working on my local machine
    # elif [$(hostname) = 'XXX Dons macbook pro']; then
    #     source XXX /Users/donbunk/local_dotfiles/.local_zshrc
fi

# basic aliases
alias g='git'
alias d='docker'
alias c='conda'
alias cac='conda activate'
alias cde='conda deactivate'
# spacemacs said to do this
# https://develop.spacemacs.org/doc/FAQ.html
export PATH=~/.local/bin:$PATH



# R recommended adding these in order to install the R openssl package
# I only unquoted what I need in order to install that, leaving the rest for reference
#If you need to have openssl@1.1 first in your PATH, run:
#echo 'export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"' >> ~/.zshrc
#
#For compilers to find openssl@1.1 you may need to set:
#export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
#
#For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"


# add alias so I can open html files directly from command line
alias chrome="open -a 'Google Chrome'"



# making sure it asks before I delete files by putting rm in interactive mode by default
alias rm="rm -i"
# make sure it asks before overwriting files when copying
alias cp="cp -i"
# this doesn't seem to work
# make sure it asks before overwriting files when copying
# alias git checkout .="git checkout . -i"
# flag autocompletion
autoload -U compinit && compinit


#deactivate conda off the bat in case it it running. There is probably a better way to do this
conda deactivate



# this standard way of getting vi key bindings in zsh makes the delete key not work
# vim keybinding in terminal, this might not be best practices
# this might create problems for the delete key
# bindkey -v
# this doesn't work
# change cursor for insert mode in vim
#_fix_cursor() {
#   echo -ne '\e[5 q'
#}
# Change cursor shape for different vi modes.
# https://unix.stackexchange.com/questions/433273/changing-cursor-style-based-on-mode-in-both-zsh-and-vim
# function zle-keymap-select {
#     if [[ ${KEYMAP} == vicmd ]] ||
#            [[ $1 = 'block' ]]; then
#         echo -ne '\e[1 q'
#     elif [[ ${KEYMAP} == main ]] ||
#              [[ ${KEYMAP} == viins ]] ||
#              [[ ${KEYMAP} = '' ]] ||
#              [[ $1 = 'beam' ]]; then
#         echo -ne '\e[5 q'
#     fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# new way to get Vi key bindings in zsh
# https://github.com/jeffreytse/zsh-vi-mode/tree/c4fc3a60d0c8ca9f435dd0e28cdc6ec42c4b7ad8
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# map ESC to jk
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk





