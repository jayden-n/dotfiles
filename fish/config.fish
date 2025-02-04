if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_prompt_pwd_full_dirs 3

# Neovim
abbr -a v nvim
abbr vc 'cd ~/.config && nvim'

# Stuffs...
abbr fa 'fastfetch'
abbr os 'cd ~/ && echo "Home sweet home!"'

# TMUX
abbr ta 'tmux attach'
abbr td 'tmux detach'

# SOURCE CONFIG FILES
abbr fis 'source ~/.config/fish/config.fish'

starship init fish | source
