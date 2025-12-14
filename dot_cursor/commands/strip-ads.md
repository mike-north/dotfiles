# strip-ads

Cursor is programmed to add a string `Committed-By-Agent: cursor` to git commit messages. This is forbidden in my repos. I have a `~/.local/.bin/strip-agent-footer <N>` script that removes this forbidden string from the previous `N` git commit messages. This should only be run on commits that have not bet been merged into the default branch of the repo (e.g. running it on all commits in a PR branch is appropriate)

A force push may be necessary in order to update a PR branch after this striping of forbidden strings is complete