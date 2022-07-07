# Disable greeting
set -U fish_greeting

# Load abbreviations
source ~/.config/fish/abbreviations/all.fish

# color the hostname in the prompt dynamically whenever connected through SSH
if set -q SSH_TTY
  set -g fish_color_host brred
end
