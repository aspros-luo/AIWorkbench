# Workspace Cognitive Operating System (WCOS)

Version: 2.0.0-alpha

Status: Architecture Frozen

---

# 一、什么是 WCOS

Workspace Cognitive Operating System（WCOS）是 AIWorkbench 的核心架构。

AIWorkbench 不是一个 AI CLI。

不是一个 Prompt 工具。

不是一个 Agent Framework。

而是：

Workspace 的认知操作系统。

它负责让 Workspace 持续成长。

---

# 二、Workspace

Workspace 是整个系统唯一核心。

任何资源都属于 Workspace。

包括：

- Knowledge
- Memory
- Workflow
- Context
- Capability
- History

Workspace 拥有生命周期。

Workspace 永远不会结束。

Workspace 会持续演化。

---

# 三、Brain

Workspace Brain 是整个 Workspace 的唯一协调者。

Brain 不直接工作。

Brain 不拥有能力。

Brain 负责：

- 理解
- 推理
- 规划
- 协调
- 反思

Brain 永远不直接调用底层实现。

---

# 四、Capability

Capability 是 Workspace 可以使用的一切能力。

例如：

- Browser
- Git
- Filesystem
- Shell
- Python
- LLM
- MCP
- Database

Capability 不思考。

Capability 不保存状态。

Capability 永远只是能力。

---

# 五、Event

所有输入统一抽象为 Event。

例如：

用户聊天

上传文件

Git Commit

网页变化

浏览器操作

Shell 命令

工具返回

全部都是 Event。

Brain 只处理 Event。

---

# 六、Cognitive Lifecycle

每一个 Event 都必须经过统一生命周期。

Perception

↓

Planning

↓

Reasoning

↓

Coordination

↓

Execution

↓

Reflection

↓

Evolution

最终：

Workspace 被更新。

---

# 七、State

Workspace 拥有全部状态。

Brain 不拥有状态。

Capability 不拥有状态。

Provider 不拥有状态。

Workspace 是唯一状态拥有者。

---

# 八、Evolution

AIWorkbench 最大目标：

不是完成任务。

而是：

让 Workspace 每一次工作之后，

比之前更聪明。

---

# 九、Architecture Layers

User

↓

Event

↓

Workspace Brain

↓

Cognitive Lifecycle

↓

Capability

↓

Runtime

↓

Infrastructure

---

# 十、最终目标

Workspace 能够长期陪伴：

一个项目。

一个团队。

一个企业。

甚至一个人的整个职业生涯。

AIWorkbench 不是 AI。

AIWorkbench 是 AI 工作的操作系统。
