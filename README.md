# Project Overview #

This project implements two multithreaded server variants to compute Minimum Spanning Trees (MST) on client-provided graphs using algorithms like Prim and Kruskal. The server can manage concurrent clients via TCP, each issuing commands that manipulate and analyze graphs. It features two architectural modes:

Leader-Follower Thread Pool

Pipeline with Active Object

*Technologies*: C++, POSIX Threads, Valgrind.

## Features ##

### Multi-client support : 

Handles up to 10 clients simultaneously.

#### Commands supported :

newgraph — Initialize a new graph

prim — Compute MST using Prim's algorithm

kruskal — Compute MST using Kruskal's algorithm

addedge — Add an edge to the graph

removeedge — Remove an edge from the graph

exit — Disconnect clien

Graceful shutdown: Type shutdown in the server console to stop the server.

Thread-safe design: Uses std::thread, mutexes, and atomic flags.

#### Pipeline Active Object Pattern #### — Asynchronous command execution using a task queue and worker thread pool

#### Leader-Follower Thread Pool #### — Efficient thread pool with dynamic role switching to manage client load

## Architecture & Design Patterns ##

### Active Object Pattern (Pipeline) ###

The Pipeline server (pipeline_app) implements the Active Object pattern. It separates:

Command invocation (clients)

Command execution (worker pool)

This is achieved through:

A shared task queue where incoming commands are enqueued.

A thread pool that asynchronously dequeues and processes commands in background threads.

Benefits:

Loose coupling between network IO and computation

Non-blocking responsiveness to each client

Scalable with CPU cores

### Leader-Follower Thread Pool (LF) ###

The Leader-Follower server (LF_app) implements a Leader-Follower thread pool where:

One thread acts as Leader, waiting for events (new connections)

Remaining threads are Followers, ready to assume leadership upon handoff

Key points:

Efficient use of thread resources

Reduced context-switching and synchronization overhead

Suitable for high-throughput I/O-bound tasks

## Requirements ##

Linux environment (tested on Ubuntu 22.04)

GCC with C++17 support

Make

Basic networking permissions (open port 9034)

Optional tools for analysis:

valgrind, kcachegrind, gcov

### Server Architecture ###
Graph and command management via a client-server model.

Server accepts:

Graph uploads

Graph modification commands

MST computation requests

## Build Instructions## 

Clone the repository:

git clone <repository_url>

cd MST-PipelineLF

Build the project using make:

make all

Creates two executables:

LF_app (Leader-Follower server)

pipeline_app (Active Object server)

## Usage ##

### Start the server ###:

./LF_app or ./pipeline_app

The server will start listening on port 9034 for incoming client connections.

### Connect a client ###:
You can test the server using netcat or telnet:

nc localhost 9034

This will compile the project and generate the executable(s).

### Send commands ### :

Type any of the following commands followed by Enter:
newgraph

addedge

removeedge

prim

kruskal

exit

### Shutdown server ###:
In the server console where ./LF_app is running, type:

## Project Structure ## 

LF/ — Contains core logic and server main entry point (main.cpp).

PipeLine/ — Contains pipeline processing and command execution logic.

core/ — Contains graph data structures and MST algorithms.

Makefile — Build configuration.

## Valgrind & Code Quality Reports ##

Located under the Reports/ directory:

#### LF_Reports/ ####

memcheck.txt: Memory leak detection and invalid access analysis

helgrind.txt: Thread race detection via Helgrind

callgrind.out.*: Function call profiling (analyzed with KCachegrind)

cg.txt: Summary of Callgrind profiling

gcov/: Code coverage reports (requires compilation with --coverage)

#### Pipeline_Reports/ ####

Same structure as LF_Reports/, for the Pipeline-based implementation.

### Tools Used ###:

valgrind

memcheck for memory leaks

helgrind for race condition analysis

callgrind for performance profiling

gcov for code coverage analysis


