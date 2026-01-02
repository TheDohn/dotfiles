#forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

# for gitu
export GIT_EDITOR=vim

export STARSHIP_CONFIG=~/.starship/starship.toml

# trying this for Python at the command line
# I also have some stuff in .inputrc for this
# but this doesn't work
# set -o vi

# newer python repls don't seem to support VI keybindings, so need to default to the old one
# https://github.com/python/cpython/issues/118840
export PYTHON_BASIC_REPL=1
# although I can't get this to work

#suppress the standard conda env so it only shows up in starship prompt
# https://starship.rs/config/#conda
conda config --set changeps1 False

# I tried to install this w Antidote, and it kept getting screwed up.
# just cloning the repo and calling this seems simpler
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
# BELOW this was working, but seems to be taken care of by oh-my-zsh now
# new way to get Vi key bindings in zsh
# https://github.com/jeffreytse/zsh-vi-mode/tree/c4fc3a60d0c8ca9f435dd0e28cdc6ec42c4b7ad8
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# map ESC to jk
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_ESCAPE_BINDKEY=jk

# this seems to help CTRL+r work in insert mode as well as visual mode
# https://stackoverflow.com/questions/73033698/fzf-keybindings-doesnt-work-with-zsh-vi-mode
# https://github.com/jeffreytse/zsh-vi-mode#initialization-mode
# Do the initialization when the script is sourced (i.e. Initialize instantly)
ZVM_INIT_MODE=sourcing

# now, simply add these two lines in your ~/.zshrc

# source antidote
# source /path/to/antidote/antidote.zsh
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
# still not sure if I need this line below or not?
zsh_plugins=~/.zsh_plugins.txt
# zsh_plugins=~/.antidote_zsh_plugins.txt
antidote load


# eza gives an error, but seems to work
ZSH_LS_BACKEND='eza'
# ZSH_LS_BACKEND='exa'
# ZSH_LS_BACKEND='ls'


# limit history to each tab (in iterm2)
# https://superuser.com/questions/1245273/iterm2-version-3-individual-history-per-tab
unsetopt inc_append_history
unsetopt share_history

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/enable-tab-completion.html
# https://github.com/conda-incubator/conda-zsh-completion/blob/cf03e636d74d0645ca97be371ef01875fc314da1/_conda
autoload -U compinit && compinit


#if [ $(hostname) = 'MacBook-Pro' ]; then # this got changed when I updated to Ventura OS
if [ $(hostname) = "Don's-MacBook-Pro" ]; then
    source /Users/donbunk/local_dotfiles/.local_zshrc
    #    #TODO get this working on my local machine
    # elif [$(hostname) = 'XXX Dons macbook pro']; then
    #     source XXX /Users/donbunk/local_dotfiles/.local_zshrc
    ###################
    #atm I have downloaded emacs for mac osx from https://emacsformacosx.com/
    # on this machine
    # and I need tis alias so I can open from and in the terminal
    # open the Emacs GUI
    # alias emacs='$(/Applications/Emacs.app/Contents/MacOS/Emacs "$@")'
    # er, seems better to update the PATH for this
    # export PATH=/Applications/Emacs.app/Contents/MacOS/$PATH
    # export PATH=/Applications/Emacs.app/Contents/MacOS$PATH
    # open Emacs at the terminal
    # this is the  only way I could get this to work
    alias emacs_nw='$(/Applications/Emacs.app/Contents/MacOS/emacs-nw)'
    # just simplifying this
    alias emacs='open -a Emacs'
    alias spacemacs='open -a Emacs --args --init-directory ~/.emacs_configs/.spacemacs'
    alias minemacs='open -a Emacs --args --init-directory ~/.emacs_configs/.minemacs'
fi

# basic aliases
alias c='conda'
alias cat='bat'
alias d='docker'
alias g='git'
alias ls='eza -lah'
# actually I don't need these with autocomplete now
# alias cac='conda activate'
# alias cde='conda deactivate'
# add alias so I can open html files directly from command line
alias chrome="open -a 'Google Chrome'"
# making sure it asks before I delete files by putting rm in interactive mode by default
alias rm="rm -i"
# alias rmdir="rmdir -i" # this doesnn't work and I don't know how to get it to work with rmdir
# make sure it asks before overwriting files when copying
alias cp="cp -i"
alias p="python -i"
alias pt="ptpython -i --vi"

# spacemacs said to do this
# https://develop.spacemacs.org/doc/FAQ.html
export PATH=~/.local/bin:$PATH

# trying to give lsp & dap the path to ruff
export PATH=/opt/homebrew/Cellar:$PATH
export PATH=/opt/homebrew/lib:$PATH

# trying to get scipy to find openblas, as per Claude
# export OPENBLAS=$(brew --prefix openblas)


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

# this doesn't seem to work
# make sure it asks before overwriting files when copying
# alias git checkout .="git checkout . -i"
# flag autocompletion
autoload -U compinit && compinit

# I shouldn't need this
#deactivate conda off the bat in case it it running. seems like conda wants to activate base right away in a fresh session, which can get confusing
#There is probably a better way to do this
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


# Didn't get this to work, but I am also unclear what I want here
# autosuggestion config
# https://github.com/zsh-users/zsh-autosuggestions
#bindkey '^I' autosuggest-accept
# bindkey '^ ' autosuggest-accept
# bindkey '\t' end-of-line




#LAST PASS CONFIG
LPASS_AGENT_TIMEOUT=60
alias lpp="lpass show -c --password"


#starship theme
eval "$(starship init zsh)"

# ugh, where did this come from? broot may have added it?
source /Users/donbunk/.config/broot/launcher/bash/br

# various aliases
# jiggle
# alias jiggle='bash ~/Documents/mouse_jiggle/jiggle.sh'
# need to get directories straightened out in the python script itself to get this to work
# alias submit_tempo='source ~/Documents/org_mode/IXIS_journal/org_clock_scraper/submit_tempo.sh'

# jiggle () {
#     conda activate jiggle
#     python ~/Documents/mouse_jiggle/jiggle.py ${1}
# }

# # this may run in the background, and not show in the terminal, which is not ideal
# #TODO: make this more like my jiggle function, with updates
# caffeinate_hours() {
#     if [ $# -eq 0 ]; then
#         echo "Usage: caffeinate_hours <hours>"
#         return 1
#     fi

#     # Convert hours to seconds
#     local seconds=$(( $1 * 3600 ))

#     # Run caffeinate with the calculated seconds
#     caffeinate -disu -t "$seconds" #&

#     # echo "Caffeinate activated for $1 hours ($seconds seconds)."
# }


# alias rosetta="arch -x86_64 /bin/zsh"

# stop R asking if I want to save the damn workspace
alias R='R --no-save'
