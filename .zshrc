# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'arg: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'r:|[._-/]=** r:|=**' 'r:|[._-/]=** r:|=**' 'r:|[._-/]=** r:|=**' 'r:|[._-/]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' verbose true
zstyle :compinstall filename "$HOME/.zshrc"

export ZSH_PLUGINS="$HOME/.zsh-plugins"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt append_history share_history autocd extendedglob correctall prompt_subst hist_ignore_all_dups hist_ignore_space
# End of lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
bindkey -e
autoload -Uz promptinit
promptinit

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey "^[[1;5A" history-substring-search-up
bindkey "^[[1;5B" history-substring-search-down

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# prompt
function set_date() {
    echo "%F{red}[$(date +"%a %b %d %T")]"
}
function set_pwd() {
    echo "%F{yellow}${PWD/$HOME/~}%F{white}"
}
function set_git() {
    local branch=`git branch 2> /dev/null`
    if [ ! -z $branch ] ; then
	echo " %F{white}(on %F{magenta}$(echo $branch | cut -f2 -d' ')%F{white})"
    fi
}
function set_symbol() {
    local color
    if [[ $EUID -ne 0 ]] ; then
	color=" %F{yellow}"
    else
	color=" %F{red}"
    fi
    echo "$color>%F{white} "
}
function set_zsh_prompt() {
    PROMPT="
$(set_date) $(set_pwd):
%F{cyan}%n@%m$(set_git)$(set_symbol)"
}
precmd_functions+=(set_zsh_prompt)

if [ -f ~/.aliases ] ; then
    . ~/.aliases
fi

if [ -f "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] ; then
    source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [ -f "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" ] ; then
    source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
    bindkey '`' autosuggest-accept
fi
