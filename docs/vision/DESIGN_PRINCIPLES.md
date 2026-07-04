# Design Principles

Version: 2.0.0-alpha

Status: Frozen

---

# Principle 1

Workspace is the permanent asset.

LLMs are replaceable.

---

# Principle 2

Employees are product abstractions.

Workspaces are system abstractions.

Never mix the two.

---

# Principle 3

Everything belongs to one Workspace.

Nothing exists outside a Workspace.

---

# Principle 4

Brains never own state.

Brains only reason.

All persistent state belongs to the Workspace.

---

# Principle 5

Knowledge is accumulated.

It is never manually maintained.

The system continuously extracts reusable knowledge from work.

---

# Principle 6

Memory records history.

Knowledge summarizes experience.

Do not confuse them.

---

# Principle 7

Capabilities are reusable.

Business logic is not.

Never embed business rules into Capabilities.

---

# Principle 8

Events describe facts.

Tasks describe goals.

Artifacts describe outputs.

These concepts must remain independent.

---

# Principle 9

Every decision should be traceable.

An Employee must be able to explain:

- Why this decision was made.
- Which knowledge was used.
- Which events triggered it.
- Which artifacts were produced.

---

# Principle 10

The product should feel like managing employees,

not operating software.

---

# Principle 11

Architecture evolves from Vision.

Implementation evolves from Architecture.

Never evolve in reverse.

---

# Principle 12

A Workspace should become increasingly independent.

The long-term goal is autonomous execution with human approval only where necessary.

