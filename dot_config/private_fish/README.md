# Fish Shell Configuration

This directory contains fish shell configuration files that provide equivalent functionality to the bash/zsh Stripe setup.

## Structure

- `config.fish` - Main configuration file with personal aliases and settings
- `conf.d/00-terminal-init.fish` - Fixes terminal rendering issues (especially in Ghostty)
- `conf.d/stripe-init.fish` - Stripe-specific setup (equivalent to `~/.stripe/shellinit/bashrc` and `zshrc`)

## Stripe Setup Equivalency

The `stripe-init.fish` file provides fish shell equivalents for most Stripe dev laptop setup:

### ✅ Fully Configured
- Homebrew PATH configuration (Apple Silicon)
- space-commander PATH and ssh wrapper
- Chef testing aliases (tc, cz, cookit)
- nosh scp conversion with killswitch support
- JetBrains license server
- ~/.local/bin PATH
- nodenv, pyenv, rbenv initialization
- direnv hook with gocode opt-out support
- VSCode and Cursor PATH
- Stripe shellinit completion marker

### ⚠️ Requires Additional Setup

#### 1. Bass (for sourcing bash scripts in fish)

Some Stripe scripts are bash-only. To source them in fish, install `bass`:

```fish
# Install fisher (fish plugin manager) if not already installed
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install bass
fisher install edc/bass
```

Once bass is installed, these scripts will be automatically sourced:
- `~/stripe/space-commander/bin/sc-aliases`
- `~/stripe/pay-server/dev/lib/pay_cmd/aliases.sh`
- `~/stripe/zoolander/scripts/api-services/aliases.sh`

#### 2. Completions (fish-specific)

The following completions are bash/zsh-specific and need fish equivalents:
- Pay commands tab completion (`~/stripe/pay-server/dev/out/pay-completion-wrapper`)
- Pandora completion (`/usr/local/bin/pandora --completion-script-fish`)
- Git completions (fish has built-in git completions, so the bash ones are not needed)

**Note**: Most fish users don't need the bash completions as fish has excellent built-in completions for common tools.

## Verification

To verify your Stripe setup is loaded correctly:

```fish
# Check if Stripe init is loaded
echo $__STRIPE_SHELLINIT_FISH_COMPLETE
# Should output: 1

# Check if space-commander is in PATH
which sc-ssh-wrapper
# Should output: ~/stripe/space-commander/bin/sc-ssh-wrapper

# Check environment variables
echo $JETBRAINS_LICENSE_SERVER
# Should output: https://stripe.fls.jetbrains.com
```

## Differences from Bash/Zsh

Fish shell has different syntax and conventions:

1. **PATH management**: Uses `fish_add_path` instead of `export PATH=...`
2. **Variables**: Use `set -gx` for exported globals instead of `export`
3. **Conditions**: Use `test` instead of `[ ]` or `[[ ]]`
4. **Command substitution**: Use `(command)` instead of `$(command)`
5. **Sourcing**: Fish can't directly source bash scripts (needs `bass`)
6. **Completions**: Fish has its own completion system (different from bash-completion)

## Troubleshooting

### "Bass command not found" warnings
If you see warnings about bass not being found, and you don't need the bash-specific aliases, you can ignore them. Or install bass as described above.

### Completions not working
Fish has excellent built-in completions. If you're missing completions for a specific tool, check if there's a fish completion plugin available.

### Aliases not loading
Make sure to reload your fish configuration:

```fish
source ~/.config/fish/config.fish
# or
reload
```










