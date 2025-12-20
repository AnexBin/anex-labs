# Deadlocks, Livelocks, and Starvation
_Subtopic 4 — System-Wide Failure from Coordination_

---

## 1. Concept Summary

Deadlocks, livelocks, and starvation are **global failure states** that emerge when multiple concurrent entities coordinate incorrectly.

Unlike crashes or memory corruption, these failures:
- Do not break the system immediately
- Often leave processes “alive”
- Cause the system to stop making *meaningful progress*

These are **coordination failures**, not computation failures.

They are especially dangerous because:
- They are timing-dependent
- They are workload-dependent
- They often disappear during debugging

---

## 2. Mental Model

### Core Analogy: Intersections Without Traffic Rules

- **Deadlock**:  
  Cars block each other in an intersection and no one can move.

- **Livelock**:  
  Cars keep moving and yielding endlessly, but nobody passes.

- **Starvation**:  
  Some cars *never* get a green light because others are always prioritized.

The system is not broken — **coordination is broken**.

---

## 3. Why These Failures Exist

Modern systems require:
- Parallelism
- Resource sharing
- Performance optimization

To achieve this, systems introduce:
- Locks
- Queues
- Schedulers
- Resource managers

These mechanisms **trade safety for speed**, and global guarantees are often weakened.

Deadlocks and related failures are the *price* of concurrency.

---

## 4. Core Definitions (Precise)

### Deadlock
A state where:
- Two or more entities wait indefinitely
- Each is holding a resource the other needs
- No entity can proceed

Progress = **impossible**

---

### Livelock
A state where:
- Entities continue to act
- State changes occur
- But no useful progress is made

Progress = **theoretical but never achieved**

---

### Starvation
A state where:
- Some entities are perpetually delayed
- Others continue to make progress
- No fairness guarantee exists

Progress = **uneven and biased**

---

## 5. Design Assumptions Behind These Systems

These systems implicitly assume:
- Resources will be released promptly
- Contention will be temporary
- Scheduling will be fair *enough*
- Participants will behave “reasonably”

These assumptions are **not enforced** — only hoped for.

---

## 6. What the System Trusts

- That lock acquisition order is consistent
- That retries will eventually succeed
- That backoff strategies converge
- That resource demand is bounded

These are *social contracts*, not physical laws.

---

## 7. What the System Does NOT Expect

- Adversarial timing
- Pathological scheduling
- Infinite retries
- Malicious or buggy coordination logic
- Feedback loops that reinforce contention

When these appear, **global failure emerges**.

---

## 8. Common Failure Modes

### Deadlock Conditions (Classical)
All must exist simultaneously:
1. Mutual exclusion
2. Hold and wait
3. No preemption
4. Circular wait

Removing *any one* breaks deadlock — but systems rarely enforce this globally.

---

### Livelock Patterns
- Aggressive retry loops
- Symmetric conflict resolution
- Exponential backoff that synchronizes instead of disperses

The system looks alive — but nothing completes.

---

### Starvation Patterns
- Priority inversion
- Unbounded queues
- Resource monopolization
- “Fast” actors starving “slow” ones

This often appears as “performance issues” rather than correctness bugs.

---

## 9. Failure Chains (Small → Catastrophic)

Example chain:
- Minor contention →
- Retry storms →
- Scheduler pressure →
- Priority skew →
- Starvation →
- System-wide latency →
- Cascading service failures

No single bug.
Only **composition failure**.

---

## 10. Where Trust Boundaries Break

- Between scheduler and application logic
- Between fairness assumptions and real workloads
- Between local correctness and global progress
- Between performance optimization and safety

Each component behaves “correctly” — the system fails anyway.

---

## 11. Offensive & Red Team Relevance (Conceptual)

From an attacker mindset:
- These failures are **denial-of-progress vectors**
- They require no memory corruption
- They exploit *coordination assumptions*

Relevant to:
- Malware persistence
- Resource exhaustion attacks
- Cloud multi-tenant abuse
- AI inference and training pipelines under load

Attackers don’t break rules — they **stress assumptions**.

---

## 12. Relevance to AI Systems

AI systems intensify these risks because:
- Parallel workloads are massive
- Resource contention is constant
- Schedulers are opaque
- Failures appear as “slow models” or “timeouts”

Deadlocks and starvation here become **silent model failure**, not crashes.

---

## 13. Personal Insights (Current, Provisional)

- These failures feel “invisible” compared to memory bugs
- They depend more on *interaction* than code correctness
- They explain why systems fail only at scale
- They reward attackers who understand timing, not exploits

Understanding this shifts focus from bugs → **behavior under pressure**

---

## 14. Open Questions

- How do modern systems detect livelock reliably?
- Where do fairness guarantees actually exist vs assumed?
- How do distributed systems trade deadlock avoidance for throughput?
- How do AI schedulers expose or hide starvation?

These questions will likely evolve with real-world practice.

---

## 15. Why This Matters Long-Term

Mastery of these failures:
- Enables reasoning about *system collapse*
- Separates exploit thinkers from system thinkers
- Is critical for cloud, AI, and malware design
- Explains failures that tools cannot detect

This knowledge compounds with scale.

