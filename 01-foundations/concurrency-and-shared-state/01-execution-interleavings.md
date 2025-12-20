# Execution Interleavings

## Concept Summary
Execution interleaving describes how multiple execution flows are woven together in time,
creating behaviors that cannot be understood by linear reasoning.

This is not about speed or threads — it is about causality and ordering.

---

## Why This System Exists
Modern systems must handle:
- Multiple users
- Parallel hardware
- Asynchronous events

Concurrency exists to scale reality, not to preserve determinism.

---

## Mental Model
A program is not a single timeline.
It is the set of all possible valid timelines (interleavings).

Any one interleaving that breaks system assumptions makes the system unsafe.

---

## What Programmers Assume (Implicitly)
- Statements execute in order
- Closely written lines behave atomically
- Intermediate states are unobservable

These assumptions are not guaranteed by the system.

---

## How Interleavings Are Created
- CPU preemption
- OS scheduling
- Interrupts
- I/O waits
- Multi-core execution

The system optimizes throughput, not predictability.

---

## Hidden Intermediate States
Interleavings expose partial states that were never intended to exist
but are fully real and observable.

These states are rarely tested or logged.

---

## Failure Implications
- Non-deterministic bugs
- Heisenbugs (disappear when observed)
- Broken invariants
- Contradictory system behavior

These failures are timing-dependent, not logic-dependent.

---

## Offensive & AI Red Team Relevance
Interleavings turn time into an attack surface.

Attackers exploit:
- Partial execution windows
- Order-dependent logic
- Observation during instability

AI systems amplify this risk due to asynchronous agents and shared context.

---

## Personal Insights
(Write what felt unintuitive or uncomfortable.
This section is critical.)

---

## Open Questions
- How do interleavings scale in distributed systems?
- How can systems reason about all possible orderings?
