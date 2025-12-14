Inspects CI build failures for the current branch and proposes a plan to fix them.

Usage: /fix_ci_failures

This command takes no arguments and performs the following actions:
- Gets the current git branch name
- Uses get_ci_build_status to check the overall build status for the current branch
- Uses get_ci_build_failures to identify specific failed jobs
- Uses get_ci_build_logs to retrieve detailed logs for each failed job
- Analyzes the failure patterns and root causes
- Proposes a comprehensive plan to fix all identified CI failures

The command automatically detects the repository (stripe-internal/pay-server or stripe-internal/zoolander) based on the current working directory and provides actionable steps to resolve build issues.