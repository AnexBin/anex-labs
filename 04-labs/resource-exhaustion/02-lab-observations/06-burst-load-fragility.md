# Lab 06 — Fragility Under Load Bursts

**Date:** 2025-12-23  
**System:** Arch Linux, single-node, offline  
**Lab Focus:** Observing system fragility under sudden spikes of combined resource load  

---

## 1. Pressure Applied
- Applied short, intense bursts of memory, CPU, and I/O usage.
- Alternated bursts with brief idle periods to simulate realistic workload spikes.
- Focused on local, single-system effects without network or external interference.

## 2. Observations
- System latency spiked sharply during bursts; shell and GUI responsiveness degraded almost instantly.
- Background processes often stalled during spikes and sometimes never fully recovered.
- OOM killer sometimes triggered mid-burst, selectively killing processes.
- Swap and cache mitigated some bursts but introduced delayed latency spikes after the burst subsided.
- CPU scheduling temporarily favored certain processes, causing uneven slowdown.

## 3. Surprises
- Short bursts caused disproportionate disruption compared to sustained load.
- Some processes that survived steady stress failed under bursts, revealing hidden fragility.
- GUI applications were more sensitive to bursts than CPU-bound background tasks.
- Kernel heuristics reacted inconsistently to rapid changes in load.

## 4. Fragile Points
- Timing-sensitive scripts and interactive shells failed immediately under bursts.
- Background monitoring and logging processes lagged or missed events entirely.
- Swap and caching mechanisms caused delayed secondary effects, amplifying post-burst instability.

## 5. Broken Assumptions
- Assumed short bursts would have minimal effect — observed severe, non-linear failures.
- Assumed system recovery between bursts would be predictable — delayed effects created latent fragility.
- Assumed memory, CPU, and I/O could be stressed independently — bursts highlighted interdependencies.

---

**Operator Notes:**  
- Sudden bursts expose latent fragility invisible under steady load.  
- Timing, recovery behavior, and subsystem interdependencies are critical for understanding AI pipelines, malware persistence, and system robustness.  
- Observing burst response reveals which subsystems fail first and guides operator-level prioritization strategies.

