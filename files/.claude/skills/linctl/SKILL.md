---
name: linctl
description: Manage Linear project management via the linctl CLI. Use when the user asks about Linear issues, projects, teams, users, or comments, or wants to create, list, update, or view Linear items.
allowed-tools: Bash
---
# linctl - Linear CLI Tool

This skill provides access to Linear project management through the `linctl` command-line tool.

**IMPORTANT**: Always use `-j` (json) flag for non-interactive output suitable for Claude agents.

## Authentication

```bash
linctl auth status -j       # Check if authenticated
linctl whoami -j            # Show current user
```

## Issues

### List Issues
```bash
linctl issue list -j                              # List recent issues
linctl issue list -j -a me                        # My issues
linctl issue list -j -a me -s "In Progress"       # My in-progress issues
linctl issue list -j -t TEAM                      # Issues for a team
linctl issue list -j -c                           # Include completed/canceled
linctl issue list -j -n all_time                  # All issues (no time filter)
linctl issue list -j -n 3_weeks_ago               # Issues from last 3 weeks
linctl issue list -j -r 1                         # Priority: 0=None, 1=Urgent, 2=High, 3=Normal, 4=Low
linctl issue list -j -l 100                       # Limit to 100 results
linctl issue list -j -o updated                   # Sort: linear (default), created, updated
```

### Get Issue Details
```bash
linctl issue get ISSUE-ID -j                      # e.g., linctl issue get LIN-123 -j
```

### Create Issue
```bash
linctl issue create -j -t TEAM --title "Title"                    # Minimal
linctl issue create -j -t TEAM --title "Title" -d "Description"   # With description
linctl issue create -j -t TEAM --title "Title" -m                 # Assign to self
linctl issue create -j -t TEAM --title "Title" --priority 2       # High priority
```

Priority values: 0=None, 1=Urgent, 2=High, 3=Normal (default), 4=Low

### Update Issue
```bash
linctl issue update ISSUE-ID -j --title "New title"
linctl issue update ISSUE-ID -j -d "New description"
linctl issue update ISSUE-ID -j -a user@email.com                 # Assign by email
linctl issue update ISSUE-ID -j -a me                             # Assign to self
linctl issue update ISSUE-ID -j -a unassigned                     # Unassign
linctl issue update ISSUE-ID -j -s "In Progress"                  # Change state
linctl issue update ISSUE-ID -j --priority 1                      # Set urgent
linctl issue update ISSUE-ID -j --due-date "2024-12-31"           # Set due date
linctl issue update ISSUE-ID -j --due-date ""                     # Remove due date
```

### Assign to Self
```bash
linctl issue assign ISSUE-ID -j
```

## Comments

### List Comments
```bash
linctl comment list ISSUE-ID -j                   # e.g., linctl comment list LIN-123 -j
linctl comment list ISSUE-ID -j -l 100            # Limit results
linctl comment list ISSUE-ID -j -o created        # Sort: linear (default), created, updated
```

### Create Comment
```bash
linctl comment create ISSUE-ID -j -b "Comment text"
```

## Projects

### List Projects
```bash
linctl project list -j                            # List active projects
linctl project list -j -c                         # Include completed/canceled
linctl project list -j -t TEAM                    # Filter by team
linctl project list -j -s started                 # Filter: planned, started, paused, completed, canceled
linctl project list -j -n 1_month_ago             # Projects from last month
linctl project list -j -l 100                     # Limit results
```

### Get Project Details
```bash
linctl project get PROJECT-ID -j
```

## Teams

### List Teams
```bash
linctl team list -j
linctl team list -j -l 100                        # Limit results
```

### Get Team Details
```bash
linctl team get TEAM-KEY -j                       # e.g., linctl team get ENG -j
```

### List Team Members
```bash
linctl team members TEAM-KEY -j
```

## Users

### List Users
```bash
linctl user list -j                               # All users
linctl user list -j -a                            # Active users only
linctl user list -j -l 100                        # Limit results
```

### Get User Details
```bash
linctl user get EMAIL -j                          # e.g., linctl user get john@example.com -j
```

### Current User
```bash
linctl user me -j
```

## Output Formats

- `-p, --plaintext` - Plaintext output
- `-j, --json` - JSON output (for programmatic parsing)
- (default) - Interactive table output

## Common Workflows

### Start Working on an Issue
```bash
linctl issue assign LIN-123 -j
linctl issue update LIN-123 -j -s "In Progress"
```

### Review My Workload
```bash
linctl issue list -j -a me -s "In Progress"
linctl issue list -j -a me -s "Todo"
```

### Quick Status Update
```bash
linctl comment create LIN-123 -j -b "Started investigation. Found the root cause in the auth module."
```

### Find Issues by Priority
```bash
linctl issue list -j -r 1                         # Urgent issues
linctl issue list -j -r 2 -t ENG                  # High priority issues for ENG team
```

## Time Filter Formats

The `--newer-than` / `-n` flag accepts:
- `X_days_ago` (e.g., `7_days_ago`)
- `X_weeks_ago` (e.g., `3_weeks_ago`)
- `X_months_ago` (e.g., `6_months_ago`) - default is `6_months_ago`
- `all_time` - no time filter

## Notes

- Issue IDs typically follow the pattern `TEAM-NUMBER` (e.g., `ENG-123`, `LIN-456`)
- Team keys are short identifiers (e.g., `ENG`, `PROD`, `DESIGN`)
- Project IDs are UUIDs
- User lookup uses email addresses
- State names are workspace-specific (common: `Todo`, `In Progress`, `Done`, `Canceled`)
