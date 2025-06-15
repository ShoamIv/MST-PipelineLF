# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -pthread -g -Icore -ILF -IPipeLine

# Core sources and objects (shared code)
CORE_SRCS = core/Graph.cpp core/kruskalMST.cpp core/MSTInfo.cpp core/primMST.cpp
CORE_OBJS = $(CORE_SRCS:.cpp=.o)

# LF specific sources and objects (includes LF's CommandExecute.cpp)
LF_SRCS = LF/ThreadPool.cpp LF/LFCompute.cpp LF/CommandExecute.cpp LF/main.cpp
LF_OBJS = $(LF_SRCS:.cpp=.o)

# PipeLine specific sources and objects (includes PipeLine's CommandExecute.cpp)
PIPELINE_SRCS = PipeLine/ActiveObject.cpp PipeLine/Pipeline.cpp PipeLine/CommandExecute.cpp PipeLine/main.cpp
PIPELINE_OBJS = $(PIPELINE_SRCS:.cpp=.o)

# Targets
LF_TARGET = LF_app
PIPELINE_TARGET = pipeline_app

.PHONY: all lf pipeline clean

all: lf pipeline

# Build LF executable
lf: $(LF_TARGET)

$(LF_TARGET): $(LF_OBJS) $(CORE_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Build Pipeline executable
pipeline: $(PIPELINE_TARGET)

$(PIPELINE_TARGET): $(PIPELINE_OBJS) $(CORE_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile rule for core source files
core/%.o: core/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile rule for LF source files
LF/%.o: LF/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile rule for PipeLine source files
PipeLine/%.o: PipeLine/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f core/*.o LF/*.o PipeLine/*.o $(LF_TARGET) $(PIPELINE_TARGET)
