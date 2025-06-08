---
draft: false
title: "Keep a CURRENT_TASK.md File for Better Agent Workflows"
date: 2025-06-08T10:00:00-07:00
tags: ["AI", "programming", "productivity", "til"]
---

How many times have you started working with Claude or Cursor, had a great conversation going, then completely lost track of what you were doing when you had to step away?

After months of working with AI agents, I've discovered one simple practice that transformed my productivity: keeping a `CURRENT_TASK.md` file in every project. This small habit has become my secret weapon for maintaining context and focus across coding sessions.

## The Problem with Agent Memory

Here's the thing about AI conversations - they're brilliant in the moment but terrible at persistence. You can have Claude perfectly understand your codebase, your goals, and your constraints, but the moment you start a new chat or close Cursor, all that context vanishes.

I used to waste the first 15-20 minutes of every session just getting the agent back up to speed. Sound familiar?

## Enter CURRENT_TASK.md

The solution is embarrassingly simple: maintain a living document that captures what you're working on right now.

Here's what mine typically looks like:

```markdown
# Current Task

## Goal
Implement user notification system for the dashboard

## Context
- Users need real-time notifications for order updates
- Should integrate with existing WebSocket connection
- Must work with current auth system (JWT tokens)

## Progress
- [x] Created notification schema in database
- [x] Added API endpoints for CRUD operations
- [ ] Implement WebSocket notification broadcasting
- [ ] Build frontend notification component
- [ ] Add notification preferences to user settings

## Current Step
Working on WebSocket broadcasting in `src/services/notifications.js`

## Notes
- Using Socket.IO rooms for user-specific channels
- Need to handle reconnections gracefully
- Consider rate limiting for notification spam

## Files Modified
- `database/migrations/2025_01_06_notifications.sql`
- `src/api/notifications.js`
- `src/models/Notification.js`

## Next Actions
1. Test WebSocket connection with multiple users
2. Add error handling for failed broadcasts
3. Implement notification batching for heavy users
```

## Why This Works So Well

**Instant Context Recovery**: When I open a new Claude session, I just paste the content of `CURRENT_TASK.md` and say "Here's what I'm working on." The agent immediately understands the full picture.

**Progress Tracking**: The checklist keeps me honest about what's actually done versus what I think I've completed.

**Prevents Scope Creep**: Writing down the current step forces me to stay focused instead of jumping to the next shiny problem.

**Onboarding Team Members**: When a colleague needs to jump in, they can read the file and get up to speed in minutes.

## My Workflow

1. **Start of session**: Update `CURRENT_TASK.md` with what I'm tackling today
2. **During work**: Update progress and notes as I go
3. **Before breaks**: Write down exactly where I left off
4. **New agent session**: Share the file content immediately
5. **End of task**: Ask Claude to create a summary for `ARCHIVED_TASKS.md`

## The Magic Command

I've trained myself to start every agent conversation with:

```
Here's my current task: [paste CURRENT_TASK.md]

Continue helping me with step X.
```

This simple pattern has eliminated the context-setting overhead completely.

## When the Task is Complete

Here's where the real magic happens. When I finish a task, I don't just delete the `CURRENT_TASK.md` file - I ask Claude to help me learn from it.

My completion command:

```
Based on my CURRENT_TASK.md file, please summarize:
1. The goal we achieved
2. The main challenges we encountered
3. Key learnings and techniques discovered
4. What I'd do differently next time

Format this as an entry for my ARCHIVED_TASKS.md file.
```

This creates a searchable knowledge base of everything I've learned. When I face similar challenges months later, I can grep through `ARCHIVED_TASKS.md` and find the exact solutions I used before.

**Example archived entry:**
```markdown
## User Notification System - Jan 2025

**Goal**: Real-time notifications for dashboard users
**Duration**: 3 days
**Challenges**:
- WebSocket connection drops during deployment
- Notification spam overwhelming users
**Solutions**:
- Implemented graceful reconnection with exponential backoff
- Added notification batching (max 5 per minute per user)
**Learnings**: Socket.IO rooms are perfect for user-specific channels
**Files**: `src/services/notifications.js`, `src/components/NotificationCenter.jsx`
**Would do differently**: Start with rate limiting from day one
```

This practice has saved me countless hours of re-researching solutions I've already discovered.

## Pro Tips

**Keep it visible**: I pin the file in my editor sidebar so it's always one click away.

**Update frequently**: Don't let it get stale. A stale task file is worse than no task file.

**Be specific about the current step**: "Working on authentication" is useless. "Adding JWT validation to the `/api/notifications` endpoint" is gold.

**Include file paths**: When you mention a file, include the full path. Future you (and the agent) will thank you.

**Note dead ends**: If you tried something that didn't work, write it down. Saves time later.

## Beyond Individual Work

This pattern works for team projects too. We started keeping a shared `CURRENT_SPRINT.md` file that everyone updates. It's become our single source of truth for what's happening right now.

Some teams use GitHub issues or Jira for this, but I find those tools too heavy for the minute-by-minute context that agents need.

## The Bigger Picture

> "The palest ink is better than the best memory." - Chinese Proverb

This practice taught me something important about working with AI: the conversation is just the interface. The real value comes from maintaining context across conversations.

Your `CURRENT_TASK.md` file becomes your external memory, and AI agents become incredibly powerful when they can tap into that memory instantly.

Try it for a week. Keep that file updated, share it with every new agent session, and watch how much smoother your development flow becomes.

Trust me on this one - this small habit will change how you work with AI forever.