# Disable greeting
set -U fish_greeting

# Load abbreviations
source ~/.config/fish/abbreviations/all.fish

# color the hostname in the prompt dynamically whenever connected through SSH
if set -q SSH_TTY
  set -g fish_color_host brred
end

# set vim as manpage viewer(https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix)
set -x PAGER "/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# disable history logging for jrnl
abbr --add jrnl " jrnl"
