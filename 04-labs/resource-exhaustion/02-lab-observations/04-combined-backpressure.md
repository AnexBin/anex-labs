# Lab 04 — Combined Resource Backpressure

**Date:** 2025-12-23  
**System:** Arch Linux, single-node, offline  
**Lab Focus:** Observing system behavior when multiple resources are simultaneously stressed  

---

## 1. Pressure Applied
- Simultaneously applied high memory allocations, CPU-intensive processes, and heavy I/O operations.
- Introduced intermittent bursts in each resource to simulate realistic, fluctuating load.
- Avoided external network interference; purely local multi-resource stress.

## 2. Observations
- System responsiveness degraded non-linearly; shell and GUI lagged unpredictably.
- Backpressure propagated across subsystems: memory pressure slowed CPU-bound tasks; I/O saturation delayed memory allocations.
- OOM killer triggered during peak memory pressure, but CPU load affected which processes were selected.
- Some high-priority processes survived while lower-priority tasks stalled completely.
- Swapping and caching mitigated some pressure temporarily but introduced delayed latency spikes.

## 3. Surprises
- Combined resource pressure amplified failures more than the sum of individual pressures.
- Timing-sensitive tasks failed unpredictably, even under short bursts of load.
- Some kernel heuristics appeared to favor memory stability over CPU responsiveness, causing uneven fragility.
- Non-deterministic process scheduling became more pronounced — repeated the same stress scenario and observed different outcomes.

## 4. Fragile Points
- Real-time and interactive applications were the first to fail.
- Background monitoring, logging, and GUI responsiveness degraded before CPU or memory fully saturated.
- Cache and swap mechanisms delayed failures, creating “latent fragility” where the system looked stable but was on the verge of collapse.

## 5. Broken Assumptions
- Assumed each resource could be analyzed independently — combined pressures showed emergent behavior.
- Assumed predictable degradation — observed highly non-linear and bursty failures.
- Assumed swap and caching would always buffer pressure — they delayed but did not prevent failure propagation.

---

**Operator Notes:**  
- Combined resource pressure exposes systemic fragility and emergent failure patterns.  
- Timing, prioritization, and backpressure propagation are critical for understanding AI pipelines, malware persistence, and cloud-like local workloads.  
- Observing cross-resource interactions reveals weaknesses invisible under isolated stress tests.

