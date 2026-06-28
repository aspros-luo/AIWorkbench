# AIWorkbench Current Handover

Last Updated: 2026-06-28

---

# Project

AIWorkbench

Current Version:

0.1.0

---

# Current Progress

Completed:

Task01 ~ Task12

Task13 Phase1

Knowledge Search Runtime

---

# Runtime

Search is now available.

Example:

aw knowledge search Kubernetes

↓

backend/Kubernetes.md

---

# Current Architecture Principles

Runtime First

Everything must be exposed through:

aw

Libraries are internal implementations.

---

# Documentation Rules

Every Task must produce:

docs/tasks/TASKxx_xxx.md

Workflow:

Development

↓

Runtime Validation

↓

Task Document

↓

Daily Update

↓

Handover Update

↓

Git Commit

---

# User Preferences (Important)

The user (老六) requires:

- Always provide complete macOS terminal commands.
- Never ask to manually edit files.
- Never reference line numbers.
- Use overwrite or append commands only.
- Finish every Task before moving to the next.
- Update documentation continuously.
- Commit to Git after every completed Task.
- Monitor ChatGPT usage and warn around 90% usage.
- Before usage limit is reached, generate a complete handover for another AI (Gemini, Claude, etc.).

---

# Next Task

Task13 Phase2

Knowledge Object Design

Goal:

Search returns structured objects instead of file paths.

Target fields:

- Title
- Category
- Tags
- Summary
- File
- Updated
- Status

