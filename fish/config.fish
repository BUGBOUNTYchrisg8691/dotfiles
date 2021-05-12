# rust/cargo
export PATH="$HOME/.cargo/bin:$PATH"

# for user specific installs
export PATH="$HOME/.local/bin:$PATH"

# for bluebubbles giphy keyboard
export GIPHY_API_KEY="k2Dnfo67TUZ6t2dEnnJ7G5vck5C2tKYY"

export EDITOR="nvim"

set --universal nvm_default_version v16.1.0

source $HOME/.config/fish/aliases.fish

starship init fish | source
