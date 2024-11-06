MST-PipelineLF is a versatile project for calculating Minimum Spanning Trees (MST) on large graphs, with on-demand options to utilize the Leader-Follower (LF) pattern and a pipeline architecture. This modular setup allows users to choose each feature independently based on the requirements and performance needs of the application.

Features
On-Demand MST Calculation: Supports MST calculation with selectable algorithms (e.g., Prim’s or Kruskal’s) triggered as needed.
Pipeline Processing (Optional): Pipeline processing can be activated to handle concurrent tasks, improving speed for multi-client scenarios.
Leader-Follower Pattern: LF mode manages task assignment and execution on demand, optimizing resources in high-throughput conditions where task handoffs are efficient.
Flexible & Extensible: The design allows easy integration of additional MST algorithms or pipeline components, adapting to various workload requirements.
Use Cases
MST-PipelineLF is well-suited for:

Real-time applications needing MST updates based on dynamic data.
Scenarios requiring efficient task management with the Leader-Follower pattern.
High-performance setups benefiting from optional pipeline processing for concurrent workloads.
Getting Started

MST Algorithms: Details on supported algorithms.
