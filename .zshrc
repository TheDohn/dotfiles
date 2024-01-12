
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-vi-mode
    conda-zsh-completion
    docker
    colored-man-pages
    z
    zsh-autosuggestions
    history
)

source $ZSH/oh-my-zsh.sh

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/enable-tab-completion.html
# https://github.com/conda-incubator/conda-zsh-completion/blob/cf03e636d74d0645ca97be371ef01875fc314da1/_conda
autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


### EVERYTHING BELOW IS PRE-oh-my-zsh

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
# actually I don't need these with autocomplete now
# alias cac='conda activate'
# alias cde='conda deactivate'

# spacemacs said to do this
# https://develop.spacemacs.org/doc/FAQ.html
export PATH=~/.local/bin:$PATH

# trying to give lsp & dap the path to ruff
export PATH=/opt/homebrew/Cellar:$PATH
export PATH=/opt/homebrew/lib:$PATH

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
# alias rmdir="rmdir -i" # this doesnn't work and I don't know how to get it to work with rmdir
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

# BELOW this was working, but seems to be taken care of by oh-my-zsh now
# new way to get Vi key bindings in zsh
# https://github.com/jeffreytse/zsh-vi-mode/tree/c4fc3a60d0c8ca9f435dd0e28cdc6ec42c4b7ad8
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# map ESC to jk
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Didn't get this to work, but I am also unclear what I want here
# autosuggestion config
# https://github.com/zsh-users/zsh-autosuggestions
#bindkey '^I' autosuggest-accept
# bindkey '^ ' autosuggest-accept
# bindkey '\t' end-of-line

#LAST PASS CONFIG
LPASS_AGENT_TIMEOUT=60
alias lpp="lpass show -c --password"
