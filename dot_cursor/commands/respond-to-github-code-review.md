# respond-to-github-code-review

Use either an available GitHub MCP tool or the `gh` cli tool to pull down code review comments from github.

* Consider carefully whether each review comment is pointing out a legitemate concern
* If you agree that the concern seems legitemate, address it by either including it on a new commit to the PR branch (if it's a reasonalby small alteration -- ~100 lines or less), or opening up a new PR into the existing PR branch so the "fix" to address the feedback can be reviewed independently. 
* In the commit message, describe how the feedback was responded to
* Explicitly confirm with the user about any feedback you decide can be safely ignored

## If working on a public open-source project that's on github.com, with github issues enabled
* If feel it's appropriate, you may elect to create github issues for feedback that should be addressed in a follow-on PR. If you decide to do this, respond to the comment in the code review feedback with an explanation and reference to the PR (it can be just `#<PR-number>` which github will turn into a link automatically -- e.g. #123)


## Keep in mind...
* you may need to manage the GH_HOST env variable, since some contributors may have a corporate github enterprise instance _and_ some projects on github.com. 

