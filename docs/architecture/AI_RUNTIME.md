# AI Runtime Architecture

日期：2026-06-29

---

# 中文说明

AI Runtime 是 AIWorkbench 的核心运行时。

它负责将 Workspace 中的所有信息组织成统一 Runtime，
供任何大语言模型（LLM）消费。

LLM 永远不直接读取 Workspace。

所有 AI 行为必须建立在 Runtime 之上。

---

# Runtime Components

1. Workspace
2. Project
3. Context
4. Memory
5. Knowledge
6. Playbook
7. Environment
8. User Request

---

# Runtime Pipeline

User

↓

AIWorkbench

↓

AI Runtime Builder

↓

Runtime

↓

LLM

↓

Plan

↓

Executor（Future）

---

# Runtime First Principle

任何 AI 行为，

必须先构建 Runtime。

任何模型，

只能消费 Runtime。

不得直接访问 Workspace。

---

Status

Draft v1.0
