;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(toml
     ibuffer
     ;; docker
     (lua :variables
          lua-backend 'lsp)
     ;;python
     octave ;;I think this is for viewing Matlab files
     sql
     ;; (sql :variables sql-auto-indent nil)
     html
     ;; needed to install mactex first and add append dir to PATH https://formulae.brew.sh/cask/mactex
     ;; (latex :variables latex-backend 'lsp) # I think this worked, but commented it out since lsp may have been given me problems overall
     csv
     vimscript
     javascript
     yaml
     debug
     ;; dap
     (dap :variables
          dap-python-debugger 'debugpy ;; this is ptvsd is default I think, but that is deprecated
          ;; dap-auto-configure-features '(sessions locals controls tooltip)
          ;; just trying this
          ;; dap-auto-configure-features '(sessions locals controls tooltip)
          )
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;;auto-completion
     ;; defaults for auto-completion if I end up wanting to use them:
     ;; (auto-completion :variables
     ;;                  auto-completion-return-key-behavior 'complete
     ;;                  auto-completion-tab-key-behavior 'cycle
     ;;                  auto-completion-complete-with-key-sequence nil
     ;;                  auto-completion-complete-with-key-sequence-delay 0.1
     ;;                  auto-completion-minimum-prefix-length 2
     ;;                  auto-completion-idle-delay 0.2
     ;;                  auto-completion-private-snippets-directory nil
     ;;                  auto-completion-enable-snippets-in-popup nil
     ;;                  auto-completion-enable-help-tooltip nil
     ;;                  auto-completion-use-company-box nil
     ;;                  auto-completion-enable-sort-by-usage nil)
     (auto-completion :variables
                      ;; nice page about yasnippets: https://jaketrent.com/post/code-snippets-spacemacs/
                      auto-completion-return-key-behavior 'complete
                      auto-completion-private-snippets-directory "/Users/donbunk/dotfiles/yasnippets"
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t
                      auto-completion-use-company-box t
                      auto-completion-tab-key-behavior 'cycle
                      ;; auto-completion-tab-key-behavior 'complete
                      ;; auto-completion-tab-key-behavior nil
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-minimum-prefix-length 1
                      auto-completion-idle-delay 0.2 ;; setting this to 0.0 seemed to make company very slow
                      ;; spacemacs-default-company-backends '(company-anaconda)
                      )
     ;; better-defaults ;; this is just for emacs
     emacs-lisp
     (git :variables
          git-enable-magit-delta-plugin t
          git-enable-magit-gitflow-plugin t
          ;;         :packages I think I had this from when I was having magit problems, but don't need it anymore
          ;; magit magit-section evil-collection evil-surround git-timemachine transient
          ) ;; provides magit
     helm
     ;; lsp
     (lsp
      lsp-sonarlint t
      lsp-headerline-breadcrumb-enable nil ;; shows directory at top
      lsp-headerline-breadcrumb-mode nil
      lsp-lens-enable t ;; not entirely sure if this is working
      )
     ;;(lsp :variables lsp-lens-enable t) ;; not 100% sure how to work this yet
     ;; lsp ;; I don't think I want this on for everything
     markdown
     multiple-cursors
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     outshine ;; this gives section -folding in ess (and maybe other) modes
     spell-checking
     syntax-checking
     version-control
     treemacs
     ;; python
     (python :variables
             ;; python-backend 'anaconda
             python-backend 'lsp ;; this does seem to offer more functionality
             python-spacemacs-indent-guess 'nil
             ;; python-lsp-server 'pylsp
             ;; Oct 21, 2023: I needed to run `brew install python-lsp-server' to get any python-lsp-server to work
             ;; python-lsp-server 'mspyls ;; the default OCT 21, 2023 - couldn't get this to install, July 6, 2024: mspyls may be deprecated?
             python-lsp-server 'pyright ;; PYRIGHT MAY HANG PYTHON FILES!!!(Oct 21, 2023) seems like the new version after msplys ;; THIS MAY HAVE CAUSED PROBLEMS WITH TOO MANY FILES (buffers?) OPEN!!
             )
     (ess :variables
          ess-indent-level 5
          ess-style 'RStudio
          ;; ess-style nil
          ;; added the stuff below trying to fix the indenting with evil-paste
          ;; ess-indent-with-fancy-comments nil
          ;; ess-tab-complete-in-script nil
          ;; ess-tab-complete-in-buffer nil
          ;; ess-indent-offset nil
          ;; ess-offset-arguments nil
          ;; ess-offset-arguments-newline nil
          ;; ess-offset-block nil
          ;; ess-offset-continued nil
          ;; ess-align-nested-calls nil
          ;; ess-align-arguments-in-calls nil
          ;; ess-align-continuations-in-calls nil
          ;; ess-align-blocks nil
          ;; ess-indent-from-lhs nil
          ;; ess-indent-from-chain-start nil
          ;; ess-indent-with-fancy-comments nil
          ess-r-backend 'ess ;; I think this is default
          ;; ess-r-backend 'lsp
          ) ;; I can't tell what this does?
     ;; I think I want to turn f an t off since they interfere with searching help buffers etc. for which ESC closes
     ;; (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     ;; ess-r-backend 'lsp ;; note that TAB completion with a popup doesn't see to work at all with lsp backend (?)
     ;;) this ) may be screwing things up
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     ;; evil-better-jumper ;; had this on old machine but didn't move it over
     themes-megapack
     ;; for custom themes
     theming
     evil-better-jumper
     conda
     eww
     ;;(conda :variables conda-anaconda-home "/your/path/here") # need to figure this out yet
     spacemacs-purpose
     (json :variables json-fmt-tool 'web-beautify)
     ;; I tried multiple cursors but I am still trying to figure out if I can use this functionality efficiently
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
     colors
     pdf ;; this gave an error and crashed the first time I loaded it, but was fine after I restarted Emacs
     command-log
     tern ;;I only added this bc Spacemacs keeps uninstalling it and reinstalling it, and trying to stop that
     (tree-sitter :variables
                  ;; spacemacs-tree-sitter-hl-black-list '(js2-mode rjsx-mode) ;;in case I want to block some modes
                  tree-sitter-syntax-highlight-enable t ;; this turns it on afaik
                  ;; tree-sitter-fold-enable t ;; something spacemacs has, I don't think I want
                  ;; tree-sitter-fold-indicators-enable nil ;; something spacemacs has, I don't think I want
                  )
     (spacemacs-layouts :variables
                        spacemacs-layouts-restricted-functions
                        '(spacemacs/window-split-double-columns
                          spacemacs/window-split-triple-columns
                          spacemacs/window-split-grid
                          winner-undo ;; for some reason this doesn't seem to get fixed to the layout?
                          winner-redo)
                        spacemacs-layouts-restrict-spc-tab t
                        )
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ess-view-data
                                      dockerfile-mode
                                      sqlite3 ;; for magit
                                      ;; dired+
                                      ;; dired+ emacs-wiki
                                      ;; dirvish
                                      ;; pdf-tools ;; I seem to have needed to install this separately for it to work with dirvish
                                      ;; ejc-sql
                                      ;; org-modern ;; couldn't get this to work
                                      ;; general-auto-unbind-keys
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only)
  ) ;;this ) may have screwed things up

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-oceanic-next
                         gruvbox-dark-hard
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14.0 ;; note that this increases the size of the Helm buffer, thank god!!
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Global"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4) dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; (dirvish-override-dired-mode)

  ;; evil-shift-right got really screwed up in visual mode in ~mid 2024
  ;; this appears to fix it
  ;; https://emacs.stackexchange.com/questions/48719/keep-text-selection-after-indenting-with-evil
  (defun my/evil-shift-right ()
    (interactive)
    (evil-shift-right evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))
  (defun my/evil-shift-left ()
    (interactive)
    (evil-shift-left evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))
  (evil-define-key 'visual global-map (kbd ">") 'my/evil-shift-right)
  (evil-define-key 'visual global-map (kbd "<") 'my/evil-shift-left)



  ;; https://deepumohan.com/tech/query-aws-athena-with-emacs-using-jdbc/
  ;; (plist-put ejc-jdbc-drivers
  ;;            "awsathena"
  ;;            [com.simba.athena/athena-jdbc "2.0.9"])
  ;; (ejc-create-connection "sandbox"
  ;;                        :dbtype "awsathena"
  ;;                        ;; TODO need to find out where this lives
  ;;                        :classpath "~/.m2/repository/com/simba/athena/athena-jdbc/2.0.9/athena-jdbc-2.0.9.jar"
  ;;                        ;; :classname "com.simba.athena.jdbc.Driver"
  ;;                        ;; :subprotocol "awsathena"
  ;;                        ;; :subname "//athena.eu-west-1.amazonaws.com:443/my_database;S3OutputLocation=s3://my-athena-bucket/"
  ;;                        ;; :user (getenv "AWS_ACCESS_KEY_ID")
  ;;                        ;; :password (getenv "AWS_SECRET_ACCESS_KEY")
  ;;                        ;; You can also use connectin-uri like below
  ;;                        :connection-uri (concat "jdbc:awsathena://athena.us-east-1.amazonaws.com:443/my_database;"
  ;;                                                "User=MEEEEEEEEE;"
  ;;                                                "Password=MYPASSORD";"
  ;;                                                "S3OutputLocation=s3://athena-query-results-STAGE-ACCOUNT_ID"))



  ;; open docker files in shell-script mode
  ;; (add-to-list 'auto-mode-alist '("\\.bar\\'" . foo-mode))

  ;; this may be changing indents on save, unless they are nill (otherwise changing indents on a save is a PITA)
  (setq emacs-lisp-format-on-save nil)
  (setq buffer-auto-save-file-format nil)

  ;; (setq evil-auto-indent nil)

  ;; (setq ess-indent-offset nil)
  ;; (setq ess-offset-arguments nil)
  ;; (setq ess-offset-arguments-newline nil)
  ;; (setq ess-offset-block nil)
  ;; (setq ess-offset-continued nil)
  ;; (setq ess-align-nested-calls nil)
  ;; (setq ess-align-arguments-in-calls nil)
  ;; (setq ess-align-continuations-in-calls nil)
  ;; (setq ess-align-blocks nil)
  ;; (setq ess-indent-from-lhs nil)
  ;; (setq ess-indent-from-chain-start nil)
  ;; (setq ess-indent-with-fancy-comments nil)

  ;;https://github.com/syl20bnr/spacemacs/issues/10638#issuecomment-386519064
  ;; (eval-after-load "company"
  ;; '(add-to-list 'company-backends 'company-anaconda))

  ;; LSP is watching too much stuff
  ;; https://emacs-lsp.github.io/lsp-mode/page/file-watchers/
  (with-eval-after-load 'lsp-mode
    ;; (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\ixis\.kubernetes\\'") ;; trying to ignore the our directory. didn't get this to work
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlruns\\'") ;; ML Flow stuff
    ;; ML Flow stuff for some reason I don't think this one works? that might be bc/ it is excluded in the git ignore?
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\select_mlruns\\'")
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\select_mlruns.*\\'")
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.*select_mlruns.*\\'")
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\prod_mlruns\\'") ;; ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\prod_mlruns_testing\\'") ;; ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlruns_testing\\'") ;; ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlartifacts\\'") ;; ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlartifacts_OLD\\'") ;; ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlruns.*\\'") ;; more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\scratch/mlruns.*\\'") ;; more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\scratch/misc_mlflow.*\\'") ;; more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlruns_fine_but_had_to_rename\\'") ;; and more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlartifacts_OLD\\'") ;; and more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\TEST_RUNS\\'") ;; and more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\old_files\\'") ;; misc stuff in p2e
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\mlruns_fine_but_OLD\\'") ;; and more ML Flow stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\ray_misc\\'") ;; Ray stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\ray_misc/ray_examples/checkpoints\\'") ;; Ray stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\ray_misc/ray_examples/checkpoints.*\\'") ;; Ray stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\pipelines/.*stages\\'") ;; Spark stuff
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\kfp-tekton\\'") ;; some stuff in the kubernetes project
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\kubeflow\\'") ;; more stuff in the kubernetes project
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.jupyter\\'") ;; more stuff in the kubernetes project
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.tensorboard\\'") ;; more stuff in the kubernetes project
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\OLD_dont_watch_lsp\\'") ;; more stuff in the kubernetes project
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\metaflow\\'") ;; metaflow might blow this up
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\metaflow\\'") ;; metaflow might blow this up
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\metaflow_card_cache\\'") ;; metaflow might blow this up
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\output\\'") ;; output dir esp in p2e
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.idea\\'") ;; I think PyCharm might create this
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.ropeproject\\'") ;; I don't know what this is
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\local_registry\\'") ;; local model registry for Rocky Horror
    )
  ;; (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'")

  ;; testing if I remove caching lsp completion will speed up
  (setq lsp-completion-no-cache t)


  ;; make this wider, or else peek mode wraps between the two windows
  (setq lsp-ui-peek-list-width 100)

  ;; overwrite zsh default for now while I play with iterm2
  ;; while I don't like iterm2 customization
  ;; it is nice bc when I launch a terminal from Emacs (SPC ")
  ;; it automatically adds that as a tab to iterm2, which is really nice for organization
  (setq terminal-here-mac-terminal-command 'iterm2)

  ;; I was getting an error about svgs after I upgraded my work machine to OS 13.3.1 on April 19, 2023
  ;; A comment on this stack overflow post said to add this to my config:
  ;; and it worked
  (add-to-list 'image-types 'svg)

  ;;  (setq dap-python-debugger 'debuggy)

  ;; show file size in human readable format
  ;; https://emacs.stackexchange.com/questions/33548/how-show-size-in-kb-in-dired-mode
  (setq dired-listing-switches "-alFh")

  ;; this doesn't seem to help me
  ;; trying to make evil search work with folded org docs
  ;; https://github.com/emacs-evil/evil/issues/1630
  (setq org-fold-core-style 'overlays)

  ;; from:  https://github.com/emacs-evil/evil/issues/1630
  ;; this did allow search hits to highlight within folded regions, I think
  ;; but now typing n doesn't go to other matches
  ;;(setq org-fold-core-style 'overlays)

  ;; not clear if I should be modifying anything in this function?
  ;; trying to modify themes here
  ;; this was just a test - it worked, but I had to restart spacemacs to get it to work
  (setq theming-modifications
        '((cyberpunk
           (org-todo :foreground "#0000FF")
           )
          (gruvbox-dark-hard
           ;;(org-todo :foreground "#0000FF") ;; tried blue as a test
           (org-todo :foreground "#fabd2f")
           ;; make the background in search less harsh in Gruvbox - but I couldn't get this to work
           ;;(set-face-attribute 'lazy-highlight nil :foreground "black" :background "green")
           )
          ;; I found this from using describe-char
          (doom-oceanic-next
           ;; default is Foreground: #65737E, but that is too light in some cases
                                        ;  (font-lock-comment-face :foreground "#111111") ;; insert another color here to lighten comments
           ;; this got hard to see in Emacs 29.X for some reason
           ;; (default  :distant-foreground "gray97")
           (default  :distant-foreground "gray93")
           ;; (default  :distant-foreground "plum1")
           ;; (default  :distant-foreground "LightGoldenrod1")
           )
          ))
  ;; set window size and placement
  (setq initial-frame-alist '((top . 30) (left . 300) (width . 152) (height . 81)))


  ;; set dir for conda envs
  ;;TODO I might need to update this for the new machine
  (setq-default dotspacemacs-configuration-layers
                '((conda :variables conda-anaconda-home "~/opt/anaconda3/envs")))
  ;;NOTE i think they are in on the new machine:: /opt/homebrew/Caskroom/miniconda/base/envs/DTW
  )







(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; (require 'dired+)  ; Enable dired+ as per link below:
  ;; https://gist.github.com/synic/5c1a494eaad1406c5519

  ;; trying to get company autocomplete working in python buffers
  ;;https://github.com/syl20bnr/spacemacs/issues/10638#issuecomment-386519064
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
  ;; https://github.com/pythonic-emacs/company-anaconda
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

  ;; (setq dap-python-debugger 'debugpy)

  ;; (setq sql-auto-indent nil)
  ;; (setq sql-use-indent-support nil)

  ;; (setq evil-auto-indent nil) ;; trying to eliminate indentation in ESS mode

  ;; (setq ess-indent-offset nil)
  ;; (setq ess-offset-arguments nil)
  ;; (setq ess-offset-arguments-newline nil)
  ;; (setq ess-offset-block nil)
  ;; (setq ess-offset-continued nil)
  ;; (ess-align-nested-calls . #1=("ifelse"))
  ;; (setq ess-align-arguments-in-calls nil)
  ;; (setq ess-align-continuations-in-calls nil)
  ;; (ess-align-blocks . #3=(control-flow))
  ;; (setq ess-indent-from-lhs nil)
  ;; (setq ess-indent-from-chain-start nil)
  ;; (setq ess-indent-with-fancy-comments nil)




  ;; (setq ess-indent-offset nil)
  ;; (setq ess-offset-arguments nil)
  ;; (setq ess-offset-arguments-newline nil)
  ;; (setq ess-offset-block nil)
  ;; (setq ess-offset-continued nil)
  ;; (setq ess-align-nested-calls nil)
  ;; (setq ess-align-arguments-in-calls nil)
  ;; (setq ess-align-continuations-in-calls nil)
  ;; (setq ess-align-blocks nil)
  ;; (setq ess-indent-from-lhs nil)
  ;; (setq ess-indent-from-chain-start nil)
  ;; (setq ess-indent-with-fancy-comments nil)



  ;; ~~~~~~~******~~~~~~******~~~~~~******~~~~~~******~~~~~******
  ;; tab-bar-mode
  ;; ~~~~~~~******~~~~~~******~~~~~~******~~~~~~******~~~~~******
  ;; I spent some time configuring this but ultimately moved to using Perspectives (layouts)
  ;; (tab-bar-mode)
  ;;
  ;; customize tab-bar-mode, specifically so that the active tab is distinguishable from the inactive tabs
  ;; used this to get the code below:
  ;; https://stackoverflow.com/questions/7709158/how-do-i-customize-the-emacs-interface-specifically-the-tabs-fonts-in-windows
  ;; used this to understand which variables to grab:
  ;; https://www.youtube.com/watch?v=C7ZlNRbWdVI
  ;; these colors were select to match Doom oceanic next theme
  (set-face-attribute
   'tab-bar-tab nil
   :background "#1B2B34"
   :foreground "#EC5f67")
  (set-face-attribute
   'tab-bar-tab-inactive nil
   :background "#1B2B34"
   :foreground "#A7ADBA")
  ;;
  ;; a new tab opens the Spacemacs dashboard
  ;; (setq tab-bar-new-tab-choice "*spacemacs*") ;;this seemed to get stuck and gt/T wasn't allowed
  ;; a new tab opens the scratch buffer
  (setq tab-bar-new-tab-choice "*scratch*")
  ;;
  ;; these some code to get a timer for this, but its above my head:
  ;; https://www.emacswiki.org/emacs/TabBarMode
  ;; #########################################################################################################

  (blink-cursor-mode 1)

  ;; removes ** and // around bold and italics
  ;; this actually can get confusing if you don't show these
  ;; (setq org-hide-emphasis-markers t)

  ;; Based on definition I thought that (spacemacs/jump-to-definition) would use "the best tool"
  ;; but it doesn't seem to switch to dumb jump, which I think is the best tool
  ;; note that gd used to work fine in Lisp files, so it was working in some sense before I hard-wired this in
  ;;TODO: look into alternatives since dump jump says dump-jump-go is deprecated in favor of xref-find stuff

  ;; OPTION 1 this stopped working around April 22, 2023, so I changed it directly to xref-find-references as below
  ;; (define-key evil-normal-state-map (kbd "gd") 'dumb-jump-go)
  ;; OPTION 2 this stopped working for R files around May 15, 2023, so I dropped the definition completely ()
  ;; I was getting an error "(assertion failed: (directory-name-p dir) emacs),""
  ;; (define-key evil-normal-state-map (kbd "gd") 'xref-find-references)
  ;; Version 3: June 17, 2023.
  ;; This link had a similar situation to me:
  ;;https://martinfowler.com/articles/2023-xref-problem.html
  ;; following this I set, which restores dumb jumper
  (setq dumb-jump-force-searcher 'ag)
  ;; so now this works again:
  (define-key evil-normal-state-map (kbd "gd") 'dumb-jump-go)
  ;; note that for Python, lsp-mode has a searcher that works better, this is mostly for ESS mode (R files)
  ;; ideally I would have something here that defaults to lsp to find definitions (lsp-find-definition) in python mode, and dumb jump for R, but that will require some work
  ;; this works well enough for both

  ;; the default helm buffer list is filtered, switch this to the unfiltered version
  (define-key evil-normal-state-map (kbd "<SPC>bb") 'lazy-helm/spacemacs/helm-buffers-list-unfiltered )

  ;; around July 7 2023 this got screwed up so forcing this to be Evil motion for avy-goto-char-timer
  (define-key evil-normal-state-map (kbd "<SPC>jj") 'evil-avy-goto-char-timer)


  ;; try to unset this since it is too dangerous to live (too easy to hit accidentally)
  ;; unbinding keys that involve the leader key might be challenging:
  ;; https://emacs.stackexchange.com/questions/68328/general-el-error-key-sequence-starts-with-non-prefix-key
  ;;(global-unset-key (kbd "SPC q q"))
  ;; (global-set-key "SPC q q") ;; I don't think this is correct
  ;; this should work along with the global-auto-unbind-keys, but it doesn't, as per:
  ;; https://emacs.stackexchange.com/questions/68328/general-el-error-key-sequence-starts-with-non-prefix-key
  ;; (global-set-key (kbd "SPCqq") nil)
  ;; (global-set-key (kbd "q q") nil)
  ;; (define-key (kbd "SPC q q ") nil) ;; this doesn't work
  (spacemacs/set-leader-keys "qq" nil) ;; ok this works but the option still shows in the keybinding prompts but whatever

  ;; this kills buffers and is kind of dangerous (although I think is saves them)
  (global-unset-key (kbd "s-k"))

  ;; this is very close to "M-k" (ALT-K) which is a common org binding I use
  ;; this binding deletes lines which is super dangerous and annoying
  (global-unset-key (kbd "C-k"))

  ;; start org model documents in collapsed/folded state
  ;; this was working but I removed it in case it was increasing the time to load org documents
  (setq org-startup-folded t)

  ;; trying to remap this so I can use more features in ess-data-view
  ;; but neither of these worked
  ;; (define-key map "RET" 'ido-select-text)
  ;; (define-key ess-mode-map  "RET" 'ido-select-text)
  ;; this was another swing at this that didn't work
  ;; (define-key 'ido-minor-mode-map-entry "C-h" 'ido-select-text)
  ;; (define-key map "C-h" 'ido-select-text)

  ;; allows sorting commands in dired that are not present in native Mac OS "ls" command
  ;; install gls via 'brew install coreutils'
  (setq insert-directory-program "gls" dired-use-ls-dired t)

  ;; I need to typically reload my dotfile for this to work in ESS, maybe other major modes as well
  (setq delete-by-moving-to-trash t)
  (setq trash-directory "~/.Trash")

  ;; for searching files and directories
  (spacemacs/set-leader-keys "fd" 'find-name-dired)

  ;; remap to a more meaningful binding (rather than 'SPC r y)
  (spacemacs/set-leader-keys "rk" 'lazy-helm/helm-show-kill-ring)


  (setq-default evil-escape-key-sequence "jk")
  ;; so that jk or kj escapes
  (setq-default evil-escape-unordered-key-sequence t)

  ;; trying to get dumb jump to work

  ;; misc
  ;; (add-to-list 'spacemacs-jump-handlers 'jump-handler)
  ;;(add-to-list 'spacemacs-jump-handlers 'dumb-jump-go)

  ;; this was the final stuff I landed on, but commenting out for now in favor of lisp
  ;;(add-to-list 'spacemacs-jump-handlers 'dumb-jump)
  ;;(add-to-list 'spacemacs-jump-handlers-ess-r-mode 'dumb-jump)
  ;;(add-to-list 'spacemacs-jump-handlers-ess-mode 'dumb-jump)
  ;;(add-to-list 'spacemacs-jump-handlers-python-mode 'dumb-jump)
  ;;(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  ;; for using helm for showing definitions, I think
  ;;(setq xref-show-definitions-function #'xref-show-definitions-completing-read)



  ;; declaring this variable as per https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
  ;; machine-dependent configurations
  ;; I can't change the name of my work machine, so it is this generic string


  ;; just testing, can delete
  ;; but settled on the (cond ...) function below
  ;;  (setq org-directory "") ;; need to make this empty else it gets prepended to everything below, probably a better way to think about it

  ;;  (if  (string= system-name "MacBook-Pro")
  ;;     (
  ;;       (setq org-directory "") ;; need to make this empty else it gets prepended to everything below, probably a better way to think about it
                                        ; ;       (setq org-agenda-files (list "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal.org"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2022_Q2.org"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2022_Q1.org"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_journal_2021_09_10_11_21.org"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_journal_2021_06_07_08.org"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_journal_2021_05.org"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_todo.org_archive"
  ;;                                    "/Users/donbunk/Documents/org_mode/IXIS_todo.org"))
  ;;     ))
  ;;  (if (string= system-name "DB-personal-Macbook-Pro.local")
  ;;      (
  ;;       (setq org-directory "")
  ;;       (setq org-agenda-files nil)
  ;;       ))


  (cond
   ((string= system-name "Don's-MacBook-Pro")
    (setq org-directory "") ;; need to make this empty else it gets prepended to everything below, probably a better way to think about it
    ;; TODO I really should just reorganize the directory itself so I can drop that in there
    ;; (setq org-agenda-files (list "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2023_Q3.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2023_Q2.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2023_Q1.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2022_Q4.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2022_Q3.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2022_Q2.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_Journal_2022_Q1.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_journal_2021_09_10_11_21.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_journal_2021_06_07_08.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_journal/IXIS_journal_2021_05.org"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_todo.org_archive"
    ;;                              "/Users/donbunk/Documents/org_mode/IXIS_todo.org"))
    ;; just adding the directory should actually be enough
    (setq org-agenda-files (list
                            "/Users/donbunk/Documents/org_mode/"
                            "/Users/donbunk/Documents/org_mode/IXIS_journal/"
                            ))
    )
   ((string= system-name "DB-personal-Macbook-Pro.local")
    (setq org-directory "")
    (setq org-agenda-files nil)
    )
   )

  (setq org-todo-keywords
        '((sequence "TODO(t)" "IN PROGRESS(i)" "BLOCKED(b)" "|" "WON'T DO(w)" "DONE(d)")))

  ;; block parent TODO states based on children
  (setq org-enforce-todo-dependencies t)
  (setq org-enforce-todo-checkbox-dependencies t)


  ;; set org clock tables to collect data in the way I record, and larger width bc of long ticket names
  (setq org-clock-clocktable-default-properties
        '(:scope subtree :maxlevel 4 :narrow 80!))


  ;; I am taking this out for now since it means I can't use h & l to navigate as I am in a text doc
  ;; maybe what I want is H & L?
  ;; map h and l for up and down a directory
  ;; this isn't ideal though since this opens a new buffer for each command
  ;; which I like to avoid sometimes
  ;; this is from https://www.youtube.com/watch?v=PMWwM8QJAtU&t=2086s
  ;;(evil-collection-define-key 'normal 'dired-mode-map
  ;;  "h" 'dired-up-directory
  ;;  "l" 'dired-find-file)
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-up-directory
    "L" 'dired-find-file
    ;; "a" evil-append
    )

  ;; (with-eval-after-load 'dired
  ;; (define-key dired-mode-map "a" 'evil-append))


  (setq-default tab-width 5)
  (setq-default evil-shift-width 5)


  ;; this is from https://www.reddit.com/r/emacs/comments/6xykvh/how_to_configure_emacs_to_recognize_firefox/
  ;; and from this https://sqa.stackexchange.com/questions/7911/how-to-set-firefox-path-on-mac-os-for-selenium-webdriver
  (setq browse-url-firefox-program "/Applications/Firefox.app/Contents/MacOS/firefox-bin")


  ;; Transparency
  ;; turned this off - what I really want is just the background and not the text to be transparent
  ;;(spacemacs/enable-transparency)

  ;; current org clock in mode line
  (setq spaceline-org-clock-p t)


  ;; I want these but I am getting an error rn on them
  ;; (define-key ess-mode-map (kbd "M--") " <-")
  ;; (define-key ess-mode-map (kbd "C-S-m") " %>%")
  ;; for whatever reason these have to be embedded within a hook
  ;; they work without a hook as well, but give an error on startup
  ;; see https://stat.ethz.ch/pipermail/ess-help/2012-June/007962.html
  (add-hook 'ess-mode-hook
            (lambda ()
              (define-key ess-mode-map (kbd "M--") " <-")
              (define-key ess-mode-map (kbd "C-S-m") " %>%")))

  (spacemacs/set-leader-keys-for-major-mode 'ess-r-mode "v" 'ess-view-data-print)

  ;; try turning off minor modes
  ;; hs-minor mode screws with outline-mode
  ;; with it off I can use zo and zc to open and close sections
  (add-hook 'ess-mode-hook (lambda () (hs-minor-mode -1)))
  (add-hook 'python-mode-hook (lambda () (hs-minor-mode -1)))
  ;; this is friggin slow as hell
  ;;(add-hook 'ess-mode-hook (lambda () (flycheck-mode -1)))
  ;;(add-hook 'python-mode-hook (lambda () (flycheck-mode -1)))
  ;; I just plain hate this
  ;; (add-hook 'ess-mode-hook (lambda () (electric-indent-mode -1)))
  ;; this seems to finally turn this off
  (add-hook 'ess-r-mode-hook (lambda () (electric-indent-mode -1)))

  ;;(add-hook 'python-mode-hook (lambda () (electric-indent-mode -1)))

  ;; map h and l for up and down a directory
  ;; this isn't ideal though since this opens a new buffer for each command
  ;; which I like to avoid sometimes
  ;; this is from https://www.youtube.com/watch?v=PMWwM8QJAtU&t=2086s
  ;;(evil-collection-define-key 'normal 'dired-mode-map
  ;;  "h" 'dired-up-directory
  ;;  "l" 'dired-find-file)

  ;; so that when you switch projects you open direct and you don't have to pick a file in that project
  ;; i.e. SPC p p
  ;; from the docs https://docs.projectile.mx/projectile/configuration.html
  ;; this doesn't seem to work all the time though (?)
  (setq projectile-switch-project-action #'projectile-dired)

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(sqlite3 cl-lib seq dirvish afternoon-theme alect-themes ample-theme ample-zen-theme anti-zenburn-theme apropospriate-theme auto-dictionary auto-yasnippet badwolf-theme better-jumper birds-of-paradise-plus-theme browse-at-remote bubbleberry-theme busybee-theme cherry-blossom-theme chocolate-theme clues-theme color-identifiers-mode color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow command-log-mode company-anaconda company-box frame-local company-lua company-quickhelp company-statistics company-web web-completion-data conda cyberpunk-theme dactyl-mode dakrone-theme dap-mode lsp-docker bui darkmine-theme darkokai-theme darktooth-theme diff-hl django-theme dockerfile-mode doom-themes dracula-theme eat ef-themes emmet-mode esh-help eshell-prompt-extras eshell-z espresso-theme ess-view-data csv-mode evil-mc evil-org evil-snipe exotica-theme eziam-themes farmhouse-themes flatland-theme flatui-theme flycheck-pos-tip pos-tip flyspell-correct-helm flyspell-correct gandalf-theme gh-md git-link git-messenger git-modes git-timemachine gitignore-templates gnuplot gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme helm-c-yasnippet helm-company helm-css-scss helm-git-grep helm-ls-git helm-lsp helm-org-rifle hemisu-theme heroku-theme ibuffer-projectile impatient-mode htmlize inkpot-theme ir-black-theme jazz-theme jbeans-theme js-doc js2-refactor multiple-cursors json-mode json-navigator hierarchy json-reformat json-snatcher kaolin-themes keycast light-soap-theme livid-mode lsp-origami origami lsp-pyright lsp-treemacs lsp-ui lsp-mode lua-mode lush-theme madhat2r-theme magit-delta magit-gitflow magit-popup majapahit-themes markdown-toc material-theme minimal-theme modus-themes moe-theme molokai-theme monochrome-theme monokai-theme multi-term multi-vterm xref mustang-theme naquadah-theme noctilux-theme nodejs-repl npm-mode nyan-mode obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme org-cliplink org-contrib org-download org-mime org-pomodoro alert log4e gntp org-present org-projectile org-project-capture org-category-capture org-rich-yank organic-green-theme orgit-forge orgit forge yaml markdown-mode ghub closql emacsql treepy org outshine outorg pdf-view-restore pdf-tools tablist phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme prettier-js professional-theme pug-mode purple-haze-theme railscasts-theme rainbow-identifiers rainbow-mode realgud test-simple loc-changes load-relative rebecca-theme reverse-theme sass-mode haml-mode scss-mode seti-theme shell-pop skewer-mode js2-mode simple-httpd slim-mode smeargle smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme autothemer spacegray-theme sql-indent subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tagedit tango-2-theme tango-plus-theme tangotango-theme tao-theme terminal-here tern texfrag auctex toml-mode toxi-theme tree-sitter-langs tree-sitter tsc treemacs-magit magit magit-section git-commit with-editor twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme vimrc-mode vterm web-beautify web-mode white-sand-theme xterm-color yasnippet-snippets yasnippet zen-and-art-theme zenburn-theme company yaml-mode evil-evilified-state holy-mode hybrid-mode yapfify ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort popwin poetry pippel pipenv pip-requirements pcre2el password-generator paradox overseer org-superstar open-junk-file nose nameless multi-line macrostep lorem-ipsum live-py-mode link-hint inspector info+ indent-guide importmagic hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-comint helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu ess-R-data-view emr elisp-slime-nav elisp-demos elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word cython-mode column-enforce-mode code-cells clean-aindent-mode centered-cursor-mode blacken auto-highlight-symbol auto-compile anaconda-mode all-the-icons aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:distant-foreground "gray93")))))
)
