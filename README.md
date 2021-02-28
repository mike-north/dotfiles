# Mike's Dotfiles

These are my own dotfiles

## What these affect

- zsh and [oh-my-zsh](https://ohmyz.sh)
- git
    - Multi-identity environment, with independent SSH keys and `.gitconfig` for employee & OSS work
    - vscode as a `difftool` and `mergetool`
    - `nano` as a `core.editor`
    - dozens of other small settings for improved UX
- macos settings and preferences
- `nano` with syntax highlighting, linting and formatting
- `editorconfig`
- a `Brewfile` that installs a bunch of packages I regularly need

## How I use them

I have a `dotfiles` alias defined in my `.zshrc` that lets me treat these dotfiles as a git repo.

You can set these up for yourself by running

```sh
# create a git repo to track changes
git init --bare $HOME/.cfg
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```
At this point you can kind of use `dotconfig` as if it's a specialized `git` command, but just for these files in your home folder (and any others you may explicitly add)

Setup the remote for your repo (it may point to your fork of this repo)
```sh
dotfiles remote add origin <repo url>
dotfiles fetch origin
dotfiles --reset hard origin master
```

Now you should be able to manage your own dotfiles as if they're a git repo
```sh
# stage a file with changes
dotfiles add .zshrc
# make a commit
dotfiles commit -m "Update my zshrc"
# push changes up to your repo
dotfiles push
```

# Inspired by (and borrowed from)

- https://github.com/stefanpenner/dotfiles
- https://github.com/webpro/awesome-dotfiles
- https://github.com/webpro/dotfiles
- https://github.com/mathiasbynens/dotfiles

# Legal
&copy; 2021 Mike North

