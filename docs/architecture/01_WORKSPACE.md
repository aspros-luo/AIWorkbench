# Workspace

Version: 2.0.0-alpha

Status: Architecture Frozen

---

# 一、Workspace 是什么

Workspace 是 AIWorkbench 的唯一核心对象。

AIWorkbench 中不存在脱离 Workspace 的数据、能力或状态。

所有资源都属于某一个 Workspace。

Workspace 是系统中的 First Class Citizen。

---

# 二、Workspace 的职责

Workspace 负责维护整个工作的长期状态。

包括：

- Memory
- Knowledge
- Context
- Events
- Workflow
- Capabilities
- History

Workspace 永远拥有这些资源。

其它任何组件都只是使用它们。

---

# 三、Workspace 不负责什么

Workspace 不负责思考。

Workspace 不负责推理。

Workspace 不负责执行。

Workspace 不负责调用工具。

这些全部属于 Brain。

---

# 四、Workspace 与 Brain

Workspace 保存状态。

Brain 消费状态。

Brain 更新 Workspace。

Workspace 不依赖 Brain。

Brain 必须依赖 Workspace。

---

# 五、Workspace 生命周期

Create

↓

Feed

↓

Understand

↓

Plan

↓

Execute

↓

Reflect

↓

Evolve

Workspace 永远不会结束。

Workspace 会不断成长。

---

# 六、Workspace Resources

Workspace 至少拥有：

Memory

Knowledge

Context

Workflow

Capability Registry

Event History

Task History

Artifacts

---

# 七、Workspace Identity

每一个 Workspace 都拥有唯一身份。

Workspace 不因为 Provider 改变。

不因为 LLM 改变。

不因为 Runtime 改变。

Workspace 是整个系统最稳定的对象。

---

# 八、Workspace Principle

Everything belongs to Workspace.

Nothing lives outside Workspace.

