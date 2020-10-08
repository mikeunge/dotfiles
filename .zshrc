ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/mikeunge/.oh-my-zsh"

# Export my language settings.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Define the theme.
ZSH_THEME="mimix"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Change the tab_title to a fixed string. 
# Make sure that AUTO_TITLE is disabled.
function precmd () {
	title="`hostname`"
	window_title="print -P - '\e]0;$title\a'"
	echo -ne "$window_title"
}

# Waiting dots.
COMPLETION_WAITING_DOTS="true"

# History file and size settings.
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=10000

# Disable bell ring notification thingy.
setopt notify
bindkey -e

# Load Plugin
plugins=(git zsh-autosuggestions )

# Don't delete this.
source $ZSH/oh-my-zsh.sh

### User configuration ###

# Load aliases and fzf.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH_AUTOSUGGESTION config
#
auto_suggest_rand_color() {
	# Generate a random color for ZSH_autosuggest, pre define below.
	#
	ZSH_AUTOSUGGEST_COLORPALETTE=("pink" "white" "yellow" "blue" "red" "green" "magenta" "cyan")
	ZSH_AUTOSUGGEST_NUMBER_OF_COLORS=${#ZSH_AUTOSUGGEST_COLORPALETTE[@]}
	ZSH_AUTOSUGGEST_COLOR=${ZSH_AUTOSUGGEST_COLORPALETTE[$RANDOM % $ZSH_AUTOSUGGEST_NUMBER_OF_COLORS]}
}

# Set ZSH_AUTOSUGGEST_RAINBOW to 1 if you want random colors.
ZSH_AUTOSUGGEST_RAINBOW=0

# Check the settings.
if [[ $ZSH_AUTOSUGGEST_RAINBOW > 0 ]]; then
	# Call the random function.
	auto_suggest_rand_color
else
	# Define a color you want to use.
	ZSH_AUTOSUGGEST_COLOR="magenta"
fi

# ZSH_AUTOSUGGEST change the color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$ZSH_AUTOSUGGEST_COLOR,bold"
ZSH_AUTOSUGGEST_USE_ASYN=true

# Exports
export PATH="/Applications/goneovim.app/Contents/MacOS:/Library/Frameworks/Python.framework/Versions/3.8/bin:/Users/mikeunge/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Library/Apple/usr/bin:/Users/mikeunge/.fzf/bin"
