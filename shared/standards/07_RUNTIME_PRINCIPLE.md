# Runtime Principle（运行时设计原则）

> 本文档定义 AIWorkbench Runtime 的核心设计原则。

---

## Rule 1：Runtime 不依赖 Agent

Runtime 只负责执行。

不能依赖 ChatGPT、Claude、Gemini、Qwen 等任何模型。

---

## Rule 2：Runtime 必须可独立运行

任何 Runtime 都必须能够脱离 aw 入口单独调用。

方便：

- Python
- MCP
- Claude Code
- Codex
- 测试框架

统一调用。

---

## Rule 3：职责分离

Developer

↓

Intent（表达意图）

AI

↓

Understanding（理解意图）

Runtime

↓

Execution（执行）

Storage

↓

Persistence（持久化）

---

## Rule 4：Storage 可替换

Markdown

SQLite

Postgres

Vector DB

都可以替换。

Runtime API 不允许因为 Storage 改变而发生破坏。

---

## Rule 5：统一初始化

所有 Runtime 必须统一通过：

runtime_init()

完成：

- ROOT
- CONFIG
- WORKSPACE
- TEMPLATE

初始化。

不得重复计算。

