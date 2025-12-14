Takes a required argument for the branch name to create a new branch.

Usage: /start_change <branch_name>

Examples:
- /start_change feature-new-api
- /start_change fix-payment-bug
- /start_change refactor-billing-logic

- If the user does not provide the required branch_name argument, first ask the user for the branch name
- Checkout the master branch to ensure we're starting from the latest state
- Pull the master branch to get the latest changes from remote
- Checkout the new branch
    - If the user-provided branch name does not begin with "mnorth-" or "mnorth/", add the prefix "mnorth/"
- Tell the user that we are now ready to start working

This command prepares a clean development environment to start work on a new change.
