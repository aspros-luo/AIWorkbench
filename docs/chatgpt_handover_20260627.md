# AIWorkbench Handover

Date:
2026-06-27


# Project

AIWorkbench 是一个面向 AI 协同开发的工作平台。

目标：

统一 ChatGPT / Gemini / Codex 等 AI 的开发流程。


# Current Status


## Completed

- Workspace structure
- CLI Dispatcher
- aw init
- aw doctor
- aw status
- aw version
- aw help


## Current Version

VERSION:
0.1.0


# Architecture


## CLI

Command mapping:

aw xxx

=

tools/aw/commands/xxx.sh


# AI Runtime


Current phase:

Context System


Designed files:

ai/context/

- CURRENT.md
- SESSION.md
- STACK.md


# Current Problem


Existing workspace may miss new template files.

Reason:

Template updated after workspace creation.


# Next Plan


1. Complete aw context
2. Add aw start
3. Add template upgrade mechanism
4. Build memory system
5. Build knowledge system
6. MCP integration


# Development Rules


- Use macOS shell commands
- Prefer cat > file creation
- Avoid fragile patch scripts
- Verify after every change
- Do not break existing workspace data

