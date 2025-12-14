# prepare-for-push

This command should be run as we are getting ready to push changes to a branch on a git remote. 

* Make sure there are no lint warnings or errors associated with the code changes.
* Make sure there are no test failures associated with the code changes
* If `@microsoft/api-extractor` is being used to generate API reports, make sure to re-generate the API report to ensure it's up-to-date
* If `@microsoft/api-documenter` is being used to generate documentation, make sure to re-generate the docs to ensure they're up-to-date
* If a project has other artifacts that are generated from code in the project, make sure those generated artifacts are up-to-date as well
* If commands are available that lets you lint/test on _only the changed files_, you may use those commands, otherwise you shuld lint the entire project and run the entire test suite 
* Ensure recent commit messages that have not yet been merged into master have no strings like `Committed-By-Agent: cursor` or similar. If they are found, remove those references to LLM authoring tools
* If knip is used in the repo, make sure to run it to detect issues
* If changesets are used in the project, consider generating a changeset
* Make a commit with a well-structured commit message. If the project uses a commit convention like conventional-commits, be sure to align with that.
* If the branch is currently not used for an existing PR, make a markdown file in a temp folder not tracked by git (e.g. the OS temp directory) for a well-structured PR description, using a github pull request template if one is found in the repo. Provide the user with a link to that file, so that it can be potentially used to create the body of the PR
* If the github mcp tool is installed, look through the first 100 issues and identify any that should be linked to the PR. If any issues should be _closed_ as a result of the PR merging, use [special github keywords](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/using-keywords-in-issues-and-pull-requests) to establish that relationship
