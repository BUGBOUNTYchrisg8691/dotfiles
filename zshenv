## locally install package path for user
export PATH="$HOME/.local/bin:$PATH"

## auth
source $HOME/.gh_spacevim_auth.sh

## go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

## SpaceVim
export PYTHON3_HOST_PROG="$HOME/.config/nvim/.venv/bin/python3"

## Emacs
## Doom Emacs
export DOOMDIR="$HOME/.config/doom"
#export DOOMDIR="$HOME/.doom-config.d"
export EMACSDIR="$HOME/.emacs.d"
export DOOMLOCALDIR="$EMACSDIR/.local"
export PATH="$EMACSDIR/bin:$PATH"

## Ruby/RubyGem
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

## Perl/cpan
PATH="/home/chrisg/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/chrisg/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/chrisg/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/chrisg/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/chrisg/perl5"; export PERL_MM_OPT;

## Pygments/colorize zsh plugin
export ZSH_COLORIZE_TOOL="pygmentize"
export ZSH_COLORIZE_STYLE="friendly"

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## editor
export EDITOR="nvim"

## ghcup
[ -f "/home/chrisg/.ghcup/env" ] && source "/home/chrisg/.ghcup/env" # ghcup-env

## rust/cargo
source "$HOME/.cargo/env"

## java
export JAVA_HOME="/home/chrisg/.sdkman/candidates/java/current"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/chrisg/.sdkman"
[[ -s "/home/chrisg/.sdkman/bin/sdkman-init.sh" ]] && source "/home/chrisg/.sdkman/bin/sdkman-init.sh"

## pyenv (needs to be last block in file)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_SHIMS="$PYENV_ROOT/shims"
export PATH="$PYENV_SHIMS:$PATH"
source $(pyenv root)/completions/pyenv.zsh
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
