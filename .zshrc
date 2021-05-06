# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/chrisg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
autoload -U promptinit; promptinit
prompt lambda-pure

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
	alias-finder
	colored-man-pages
	command-not-found
	common-aliases
	fzf
	git
	#git-auto-fetch
	gitignore
	zsh-autosuggestions
	zsh-syntax-highlighting	# must come before history-substring-search
	history-substring-search
	httpie
	man
	node
	npm
	pip
	pipenv
	pyenv
	python
	ripgrep
	spring
	sudo
	vscode
	vi-mode
	zsh-interactive-cd
	zsh_reload
)

source $ZSH/oh-my-zsh.sh

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
alias https="http --default-scheme=https"
alias g="git"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias ltree="ls --tree"

# Functions
function n() {
  nvim $1
}

#
#
# Plugin Settings
# Vi-Mode
# Redraw prompt on mode change
#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# Change cursor style for different modes
#VI_MODE_SET_CURSOR=true
# Mode Indicator
#MODE_INDICATOR="%F{yellow}+%f"
#
# Git Auto Fetch
#GIT_AUTO_FETCH_INTERVAL=1200 # in seconds
#
# Anaconda Init
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chrisg/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chrisg/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chrisg/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chrisg/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Useful Documentation
# Aliases/Shortcuts
# Man plugin
# Shortcut 	Description
# Esc + man 	add man before the previous command to see the manual for this command
#
# NPM plugin
# Alias 	Command 			Descripton
# npmg 		npm i -g 			Install dependencies globally
# npmS 		npm i -S 			Install and save to dependencies in your package.json
# npmD 		npm i -D 			Install and save to dev-dependencies in your package.json
# npmE 		PATH="$(npm bin)":"$PATH" 	Run command from node_modules folder based on current directory
# npmO 		npm outdated 			Check which npm modules are outdated
# npmV 		npm -v 				Check package versions
# npmL 		npm list 			List installed packages
# npmL0 		npm ls --depth=0 	List top-level installed packages
# npmst 		npm start 		Run npm start
# npmt 		npm test 			Run npm test
# npmR 		npm run 			Run npm scripts
# npmP 		npm publish 			Run npm publish
# npmI 		npm init 			Run npm init
#
# Pipenv plugin
# Alias		Command
# pch 		pipenv check
# pcl  		pipenv clean
# pgr  		pipenv graph
# pi   		pipenv install
# pidevto 	pipenv install --dev
# pl 		pipenv lock
# po 		pipenv open
# prun 		pipenv run
# psh  		pipenv shell
# psy  		pipenv sync
# pu   		pipenv uninstall
# pwh  		pipenv --where
# pvenv		pipenv --venv
# ppy 		pipenv --py
#
# Python plugin
# Command 		Description
# ipython 		Runs the appropriate ipython version according to the activated virtualenv
# pyfind 		Finds .py files recursively in the current directory
# pyclean [dirs] 	Deletes byte-code and cache files from a list of directories or the current one
# pygrep <text> 	Looks for text in .py files
# pyuserpaths 	Add --user site-packages to PYTHONPATH, for all installed python versions.
#
# VSCode plugin
# Common aliases
# Alias 			Command 							Description
# vsc 				code . 								Open the current folder in VS code
# vsca dir 			code --add dir 							Add folder(s) to the last active window
# vscd file file 		code --diff file file 						Compare two files with each other.
# vscg file:line[:char] 	code --goto file:line[:char] 					Open a file at the path on the specified line and character position.
# vscn 				code --new-window 						Force to open a new window.
# vscr 				code --reuse-window 						Force to open a file or folder in the last active window.
# vscw 				code --wait 							Wait for the files to be closed before returning.
# vscu dir 			code --user-data-dir dir 					Specifies the directory that user data is kept in. Can be used to open multiple distinct instances of Code.
# Extensions aliases
# vsced dir 			code --extensions-dir dir 					Set the root path for extensions.
# vscie id or vsix-path 	code --install-extension extension-id> or <extension-vsix-path 	Installs an extension.
# vscue id or vsix-path 	code --uninstall-extension id or vsix-path 			Uninstalls an extension.
# Other options:
# vscv 				code --verbose 							Print verbose output (implies --wait).
# vscl level 			code --log level 						Log level to use. Default is 'info'. Allowed values are 'critical', 'error', 'warn', 'info', 'debug', 'trace', 'off'.
# vscde 			code --disable-extensions 					Disable all installed extensions.
#
# Vi-Mode plugin
# Key bindings
#
# Use ESC or CTRL-[ to enter Normal mode.

# NOTE: some of these key bindings are set by zsh by default when using a vi-mode keymap.
# History
#
#     ctrl-p : Previous command in history
#     ctrl-n : Next command in history
#     / : Search backward in history
#     n : Repeat the last /
#
# Vim edition
#
#     vv : Edit current command line in Vim
#
# NOTE: this used to be bound to v. That is now the default (visual-mode)
# Movement
#
#     $ : To the end of the line
#     ^ : To the first non-blank character of the line
#     0 : To the first character of the line
#     w : [count] words forward
#     W : [count] WORDS forward
#     e : Forward to the end of word [count] inclusive
#     E : Forward to the end of WORD [count] inclusive
#     b : [count] words backward
#     B : [count] WORDS backward
#     t{char} : Till before [count]'th occurrence of {char} to the right
#     T{char} : Till before [count]'th occurrence of {char} to the left
#     f{char} : To [count]'th occurrence of {char} to the right
#     F{char} : To [count]'th occurrence of {char} to the left
#     ; : Repeat latest f, t, F or T [count] times
#     , : Repeat latest f, t, F or T in opposite direction
#
# Insertion
#
#     i : Insert text before the cursor
#     I : Insert text before the first character in the line
#     a : Append text after the cursor
#     A : Append text at the end of the line
#     o : Insert new command line below the current one
#     O : Insert new command line above the current one
#
# Delete and Insert
#
#     ctrl-h : While in Insert mode: delete character before the cursor
#     ctrl-w : While in Insert mode: delete word before the cursor
#     d{motion} : Delete text that {motion} moves over
#     dd : Delete line
#     D : Delete characters under the cursor until the end of the line
#     c{motion} : Delete {motion} text and start insert
#     cc : Delete line and start insert
#     C : Delete to the end of the line and start insert
#     r{char} : Replace the character under the cursor with {char}
#     R : Enter replace mode: Each character replaces existing one
#     x : Delete count characters under and after the cursor
#     X : Delete count characters before the cursor

# For fzf
# Initialize
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use ripgrep fon searching
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
