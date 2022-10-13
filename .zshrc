export PATH="${HOME}/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="${HOME}/bin:$PATH"
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/gems/bin:$PATH"
export GEM_HOME="$HOME/gems"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

source ~/.zshrc_private

# vi mode
bindkey -v

# Prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
setopt PROMPT_SUBST
export PS1='%F{2}%n@%M%f:%F{141}%~%f$(__git_ps1 " (%s)")\$ '

# Case-insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd -t f -L -H -E .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Dracula color scheme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="fd -t d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# export FZF_TMUX=1

# View colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# nnn
export NNN_BMS='p:~/main/src/;d:~/main/docs/;D:~/Downloads/'
export NNN_TRASH=2
export NNN_COLORS="2136"

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Do not overwrite history
setopt extended_history         # Also record time and duration of commands
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist
setopt hist_find_no_dups        # Do not display duplicates during searches
setopt hist_ignore_dups         # Ignore consecutive duplicates
setopt hist_ignore_all_dups     # Remember only one unique copy of the command
setopt hist_reduce_blanks       # Remove superfluous blanks
setopt hist_save_no_dups        # Omit older commands in favor of newer ones
setopt HIST_IGNORE_SPACE        # Prevent commands with leading space from history

# curl wttr.in
w () {
    ( IFS=+; curl wttr.in/"$*";);
  }

# scrot
scr () {
    scrot -d 5 '%Y-%m-%d-%H%M%S_$wx$h_scrot.png' -e 'mv $f ~/Downloads/screenshots'
}

command_not_found_handler() { 
    cowsay "lol, $1" 
  }

# <C-x><C-e> to fix a command in a text editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Automatically call nvm use (https://github.com/nvm-sh/nvm#automatically-call-nvm-use)
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Extract compressed files
extract() {
  setopt localoptions noautopushd

  if (( $# == 0 )); then
    cat >&2 <<'EOF'
Usage: extract [-option] [file ...]
Options:
    -r, --remove    Remove archive after unpacking.
EOF
  fi

  local remove_archive=1
  if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
  fi

  local pwd="$PWD"
  while (( $# > 0 )); do
    if [[ ! -f "$1" ]]; then
      echo "extract: '$1' is not a valid file" >&2
      shift
      continue
    fi

    local success=0
    local extract_dir="${1:t:r}"
    local file="$1" full_path="${1:A}"
    case "${file:l}" in
      (*.tar.gz|*.tgz) (( $+commands[pigz] )) && { pigz -dc "$file" | tar xv } || tar zxvf "$file" ;;
      (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$file" ;;
      (*.tar.xz|*.txz)
        tar --xz --help &> /dev/null \
        && tar --xz -xvf "$file" \
        || xzcat "$file" | tar xvf - ;;
      (*.tar.zma|*.tlz)
        tar --lzma --help &> /dev/null \
        && tar --lzma -xvf "$file" \
        || lzcat "$file" | tar xvf - ;;
      (*.tar.zst|*.tzst)
        tar --zstd --help &> /dev/null \
        && tar --zstd -xvf "$file" \
        || zstdcat "$file" | tar xvf - ;;
      (*.tar) tar xvf "$file" ;;
      (*.tar.lz) (( $+commands[lzip] )) && tar xvf "$file" ;;
      (*.tar.lz4) lz4 -c -d "$file" | tar xvf - ;;
      (*.tar.lrz) (( $+commands[lrzuntar] )) && lrzuntar "$file" ;;
      (*.gz) (( $+commands[pigz] )) && pigz -dk "$file" || gunzip -k "$file" ;;
      (*.bz2) bunzip2 "$file" ;;
      (*.xz) unxz "$file" ;;
      (*.lrz) (( $+commands[lrunzip] )) && lrunzip "$file" ;;
      (*.lz4) lz4 -d "$file" ;;
      (*.lzma) unlzma "$file" ;;
      (*.z) uncompress "$file" ;;
      (*.zip|*.war|*.jar|*.ear|*.sublime-package|*.ipa|*.ipsw|*.xpi|*.apk|*.aar|*.whl) unzip "$file" -d "$extract_dir" ;;
      (*.rar) unrar x -ad "$file" ;;
      (*.rpm)
        command mkdir -p "$extract_dir" && builtin cd -q "$extract_dir" \
        && rpm2cpio "$full_path" | cpio --quiet -id ;;
      (*.7z) 7za x "$file" ;;
      (*.deb)
        command mkdir -p "$extract_dir/control" "$extract_dir/data"
        builtin cd -q "$extract_dir"; ar vx "$full_path" > /dev/null
        builtin cd -q control; extract ../control.tar.*
        builtin cd -q ../data; extract ../data.tar.*
        builtin cd -q ..; command rm *.tar.* debian-binary ;;
      (*.zst) unzstd "$file" ;;
      (*.cab) cabextract -d "$extract_dir" "$file" ;;
      (*.cpio) cpio -idmvF "$file" ;;
      (*)
        echo "extract: '$file' cannot be extracted" >&2
        success=1 ;;
    esac

    (( success = success > 0 ? success : $? ))
    (( success == 0 && remove_archive == 0 )) && rm "$full_path"
    shift

    # Go back to original working directory in case we ran cd previously
    builtin cd -q "$pwd"
  done
}

