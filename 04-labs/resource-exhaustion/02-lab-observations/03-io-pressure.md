# Lab 03 — I/O Pressure

**Date:** 2025-12-23  
**System:** Arch Linux, single-node, offline  
**Lab Focus:** Observing system behavior under high disk and I/O load  

---

## 1. Pressure Applied
- Simultaneously performed multiple read/write operations on large files.
- Saturated both sequential and random I/O paths.
- Mixed low-priority and high-priority I/O processes to observe scheduling and contention.
- Avoided network or CPU interference — pure local I/O stress.

## 2. Observations
- Disk throughput became inconsistent; some processes stalled while others made progress.
- Latency spikes were significant, even when average I/O rates seemed acceptable.
- File system caches temporarily masked pressure, but eventually slowed down all operations.
- GUI file managers and shells lagged when performing basic operations like listing directories or opening files.
- Backpressure propagated from storage to memory and CPU — even non-I/O tasks were indirectly slowed.

## 3. Surprises
- Low-priority processes sometimes got scheduled faster than expected due to kernel heuristics.
- File system caches delayed failure signals, creating delayed, unpredictable slowdowns.
- Fragmentation and large file sizes caused sudden latency spikes, not gradual degradation.
- Observed that some monitoring tools underreported actual I/O latency due to sampling intervals.

## 4. Fragile Points
- Shell and GUI responsiveness degraded early under heavy I/O.
- Applications with synchronous writes were extremely sensitive — small bursts could block them completely.
- Background logging daemons fell behind, creating inconsistent system state perception.

## 5. Broken Assumptions
- Assumed I/O load only affects I/O-heavy processes — in reality, CPU and memory tasks were indirectly slowed.
- Assumed caching would smooth out pressure — eventually caches saturated and amplified latency spikes.
- Assumed predictable degradation — observed highly non-linear, bursty failures.

---

**Operator Notes:**  
- I/O pressure shows complex cross-resource fragility.  
- Timing and scheduling under I/O load are critical for understanding AI pipeline slowdowns and malware persistence on constrained systems.  
- Observing indirect effects (memory and CPU slowdowns) is as important as direct I/O behavior.

