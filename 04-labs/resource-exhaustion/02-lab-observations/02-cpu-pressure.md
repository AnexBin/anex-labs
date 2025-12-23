# Lab 02 — CPU Pressure

**Date:** 2025-12-23  
**System:** Arch Linux, single-node, offline  
**Lab Focus:** Observing system behavior under sustained CPU load  

---

## 1. Pressure Applied
- Spawned multiple CPU-intensive processes to drive all cores to near 100% utilization.
- Varied workload: constant computation, intermittent bursts, and mixed high/low priority processes.
- Avoided disk or network interference — pure CPU stress.

## 2. Observations
- System responsiveness degraded gradually; shell input lag increased significantly under sustained load.
- Process scheduling became uneven; some processes stalled while others maintained throughput.
- GUI applications slowed differently; some froze intermittently, others continued to render slowly.
- Background daemons occasionally skipped cycles, causing delayed logging and monitoring outputs.

## 3. Surprises
- CPU-bound processes caused non-linear latency spikes — a small increase in load caused disproportionate slowdown.
- Some low-priority processes got scheduled unexpectedly due to kernel balancing heuristics.
- Even when CPU cores were saturated, I/O operations could still complete — showing partial isolation of resources.
- Timing-dependent scripts sometimes failed unpredictably, even though average CPU usage seemed acceptable.

## 4. Fragile Points
- Real-time or timing-sensitive scripts failed first.
- GUI responsiveness was fragile even at moderate CPU load due to thread contention.
- Background monitoring processes became unreliable, breaking assumptions about consistent system observation.

## 5. Broken Assumptions
- Assumed CPU load would degrade all processes uniformly — in reality, scheduling priorities and kernel heuristics caused uneven effects.
- Assumed full CPU saturation always correlates with total system unresponsiveness — some operations continued normally.
- Assumed that non-CPU resources wouldn’t impact CPU-bound workloads — thread contention and kernel scheduling proved otherwise.

---

**Operator Notes:**  
- CPU pressure highlights fragility in timing and scheduling.  
- Non-linear behavior under load is critical for understanding malware evasion and AI pipeline bottlenecks.  
- Observing which subsystems fail first can guide optimized resource allocation or detection strategies.

