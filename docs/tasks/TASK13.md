# Task13 - Knowledge Runtime（进行中）

> 更新时间：2026-06-28

---

# 中文说明

Task13 的目标是完成 AIWorkbench Knowledge 子系统。

本阶段重点不是增加功能，而是完成 Framework 与 Workspace 的职责划分，为后续 RAG、Agent、Memory 等功能建立稳定的数据基础。

---

# 今日完成

## 1. Workspace Knowledge 架构

确定最终原则：

Framework 不保存业务知识。

所有项目知识均属于 Workspace。

最终结构：

shared/templates/knowledge
        │
        ▼
workspaces/<Workspace>/knowledge

---

## 2. Workspace Template

Workspace 模板新增：

- knowledge/backend
- knowledge/database
- knowledge/devops
- knowledge/frontend
- knowledge/game
- knowledge/python
- knowledge/shell
- knowledge/registry.json

新建 Workspace 后自动拥有完整知识体系。

---

## 3. Upgrade

aw upgrade 已支持：

- 自动补齐 knowledge
- 自动补齐 registry.json

无需影响已有项目数据。

---

## 4. Architecture Review

重新确认：

Framework：

负责：

- Runtime
- CLI
- Template
- Standard

Workspace：

负责：

- Source
- Context
- Memory
- Knowledge
- Documents

实现 Code / Data Separation。

---

# 当前状态

Task13 已完成约 70%。

Knowledge Runtime 已基本稳定。

剩余工作主要集中在 Runtime 重构。

---

# 下一步

继续完成：

- knowledge_registry.sh
- knowledge_search.sh
- knowledge.sh
- knowledge-new.sh

全部切换至：

workspaces/<Workspace>/knowledge

随后删除 Legacy：

shared/knowledge

完成 Knowledge 子系统冻结（Freeze）。

