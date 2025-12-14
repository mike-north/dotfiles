Fetches PR comments from Github and proposes a plan to address them

Usage: /fix_pr_comments

This command takes no arguments and performs the following actions:
- Fetches the comments on the PR using gh cli
- Understands the comments properly with respect to the changes made in the PR
- Tells the user what the comments are trying to suggest, and give its own evaluation
- Propose a plan to address the comments by doing code changes
- Do not respond or propose to respond to the Github comments
- If the user agrees on the plan, make the changes, test the changes and then commit and push