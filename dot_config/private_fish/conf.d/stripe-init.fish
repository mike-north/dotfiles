### Managed by Stripe CPE & DevProd ###
### Fish shell equivalent of ~/.stripe/shellinit/bashrc and zshrc ###

### BEGIN HOMEBREW FOR APPLE SILICON
if test (uname -m) = "arm64"
    if test -f /opt/homebrew/bin/brew
        set -gx HOMEBREW_PREFIX "/opt/homebrew"
        set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
        set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
        fish_add_path -gP /opt/homebrew/bin /opt/homebrew/sbin
        set -gx MANPATH "/opt/homebrew/share/man" $MANPATH
        set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH
    end
end
### END HOMEBREW FOR APPLE SILICON

### BEGIN STRIPE REPOS
if test -d ~/stripe/space-commander/bin
    fish_add_path -gP ~/stripe/space-commander/bin
end

if test -x ~/stripe/space-commander/bin/sc-ssh-wrapper
    alias ssh="sc-ssh-wrapper"
end

# Source sc-aliases if available (bash script, so we convert to fish on-the-fly if needed)
# Note: This may need manual conversion depending on what's in sc-aliases
if test -f ~/stripe/space-commander/bin/sc-aliases
    # Bass is a tool to source bash scripts in fish, but we'll skip if not available
    # Users can install bass with: fisher install edc/bass
    if command -v bass > /dev/null 2>&1
        bass source ~/stripe/space-commander/bin/sc-aliases
    end
end

# Source pay-server aliases if available
if test -f ~/stripe/pay-server/dev/lib/pay_cmd/aliases.sh
    if command -v bass > /dev/null 2>&1
        bass source ~/stripe/pay-server/dev/lib/pay_cmd/aliases.sh
    end
end

# Pay commands tab completion - fish has its own completion system
# This would need to be converted from bash completion format to fish completion format
# if test -f ~/stripe/pay-server/dev/out/pay-completion-wrapper
#     # TODO: Convert bash completion to fish completion format
# end

# Source zoolander aliases if available
if test -f ~/stripe/zoolander/scripts/api-services/aliases.sh
    if command -v bass > /dev/null 2>&1
        bass source ~/stripe/zoolander/scripts/api-services/aliases.sh
    end
end

# Chef testing aliases
# https://git.corp.stripe.com/stripe-internal/it-chef#testing
if test -d ~/stripe/it-chef
    alias tc='/usr/local/stripe/bin/test_cookbook'
    alias cz='/usr/local/stripe/bin/chef-zero'
    alias cookit='tc && cz'
end

### END STRIPE REPOS

### BEGIN CLI TOOL MODIFICATIONS

# Pandora completion - would need fish-specific completion script
# if test -f /usr/local/bin/pandora
#     # TODO: Check if pandora has fish completion support
# end

# go/nosh-scp
if test -x /usr/local/bin/nosh
    # Check for conversion killswitch (24 hour cache)
    set -l sansshel_conversion_killswitch "$HOME/Library/Caches/nosh/conversion_killswitch"
    set -l one_day_ago (date -v "-1d" -u "+%s")
    
    if test -f "$sansshel_conversion_killswitch"
        set -l file_mtime (stat -f %m "$sansshel_conversion_killswitch" 2>/dev/null)
        if test "$file_mtime" -lt "$one_day_ago"
            rm -f "$sansshel_conversion_killswitch"
        end
    end
    
    if not test -f "$sansshel_conversion_killswitch"
        alias scp="nosh convert scp --"
    end
end

### END CLI TOOL MODIFICATIONS

### BEGIN EXPORTS
set -gx JETBRAINS_LICENSE_SERVER 'https://stripe.fls.jetbrains.com'
### END EXPORTS

### BEGIN CUSTOM APPS PATH
if test -d ~/.local/bin
    fish_add_path -gP ~/.local/bin
end
### END CUSTOM APPS PATH

### BEGIN NODENV
# Already initialized in config.fish
### END NODENV

### BEGIN PYENV
if command -v pyenv > /dev/null 2>&1
    status --is-interactive; and pyenv init - --no-rehash fish | source
end
### END PYENV

### BEGIN RBENV
# Already initialized in config.fish
### END RBENV

### BEGIN DIRENV
# Let gocode users opt out of the direnv hooks
set -l config_path "$HOME/.config/gocode/gocode.json"
set -l optout "false"

if test -s "$config_path"
    if command -v jq > /dev/null 2>&1
        set optout (jq -r '.optout.direnvhook // false' $config_path)
    end
end

if test "$optout" != "true"
    if command -v direnv > /dev/null 2>&1
        # Silence all direnv logging
        set -gx DIRENV_LOG_FORMAT ""
        direnv hook fish | source
    end
end
### END DIRENV

### BEGIN VSCODE (code)
if test -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    fish_add_path -gP "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
end
### END VSCODE (code)

### BEGIN CURSOR (cursor and code alias)
if test -d "/Applications/Cursor.app/Contents/Resources/app/bin"
    fish_add_path -gP "/Applications/Cursor.app/Contents/Resources/app/bin"
end
### END CURSOR (cursor and code alias)

# Set an env var that can be used to check whether users have properly sourced
# this Stripe config into their shells. This can make debugging user issues much
# more concise, since users can do all sorts of things to their shells.
set -gx __STRIPE_SHELLINIT_FISH_COMPLETE "1"






