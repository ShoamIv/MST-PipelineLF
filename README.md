# Project Overview #

This project is an advanced Operating Systems assignment that implements a concurrent, client-server system to compute Minimum Spanning Trees (MST) on weighted, directed graphs. It supports multiple MST algorithms, leverages both Pipeline (Active Object) and Leader-Follower (LF) concurrency models, and includes analysis tools using Valgrind and code coverage utilities.

*Technologies*: C++, POSIX Threads, Strategy/Factory Design Patterns, Active Object, Leader-Follower Thread Pool, Valgrind.

## Features ##

### MST Computation ###

Support for multiple MST algorithms via a Factory:

Kruskal

Prim

Strategy Pattern for interchangeable MST solvers.

### Graph Metrics ###

The system provides the following graph insights after computing an MST:

Total weight of the MST.

Longest distance between two vertices in the MST.

Average distance between all vertex pairs.

Shortest distance between any two connected vertices in the MST.

### Server Architecture ###
Graph and command management via a client-server model.

Server accepts:

Graph uploads

Graph modification commands

MST computation requests

### Concurrency Models ###

Pipeline Mode (PipeLine/)

Uses the Active Object pattern for concurrent stage execution.

Leader-Follower Mode (LF/)

Implements a custom Thread Pool with LF scheduling for request handling.

### Performance & Debugging Tools ###

#### Valgrind ####:

memcheck for memory leaks

helgrind for race conditions

callgrind or cg for performance profiling

Code coverage support for all logical components.


