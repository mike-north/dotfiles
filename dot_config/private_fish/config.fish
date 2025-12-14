if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by `nodenv init` on Wed Nov 26 18:08:45 PST 2025
status --is-interactive; and nodenv init - --no-rehash fish | source

# pnpm
set -gx PNPM_HOME "/Users/mnorth/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Set PAY_SERVER_HOME based on environment
if test -d /pay/src/pay-server
    # Remote dev box
    set -gx PAY_SERVER_HOME /pay/src/pay-server
else if test -d $HOME/stripe/pay-server
    # Local macOS
    set -gx PAY_SERVER_HOME $HOME/stripe/pay-server
end

# Aliases
# Note: Fish uses different syntax than bash/zsh, so we maintain these separately.
# The canonical list is in ~/.config/shell/aliases (bash/zsh syntax).
# Keep these in sync manually.

# Modern replacements for common commands
if command -v eza > /dev/null 2>&1
  alias ls "eza --icons=always"
  alias ll "eza -l --icons=always"
  alias la "eza -la --icons=always"
  alias tree "eza --tree --icons=always"
end

if command -v bat > /dev/null 2>&1
  alias cat "bat"
else if command -v batcat > /dev/null 2>&1
  alias bat "batcat"
  alias cat "batcat"
end

# Git aliases (leverages .gitconfig aliases)
# See .gitconfig for the base aliases (co, cp, st, df, dc, etc.)
alias gco "git co"      # git checkout
alias gcp "git cp"      # git cherry-pick
alias gp "git push"     # no git config alias
alias gst "git st"      # git status
alias gd "git df"       # git diff
alias gdc "git dc"      # git diff --cached
alias glog "git log --oneline --graph --decorate"  # no git config alias for this

# Safety aliases
alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"

# Navigation shortcuts
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

# Utility aliases
alias reload "exec $SHELL -l"
alias path 'printf "%s\n" $PATH'

# Added by `rbenv init` on Tue Dec  2 10:38:01 PST 2025
status --is-interactive; and rbenv init - --no-rehash fish | source
