# OOM Killer — Choosing Who Dies

## Why This Topic Exists

Memory overcommit introduces a hidden risk: at some point, reality arrives, and memory runs out.
Linux handles this with the **Out-Of-Memory (OOM) killer**, a subsystem that decides which process to terminate when no memory is left.

Understanding this is critical for:

* Malware survival strategies
* Cloud container reliability
* AI workload stability
* Offensive and defensive system thinking

---

## Core Mental Model

**The system must pick a victim.**

* When memory runs out, Linux cannot refuse all requests gracefully
* It terminates a process instead of halting everything
* Victim selection is based on heuristics, not importance

The kernel says:

> "Something dies, but I can’t know what matters most to you."

---

## What the System Appears to Do

* Protects itself under memory exhaustion
* Makes deterministic, fair choices
* Maintains overall system usability

This is **misleading**.

---

## What Is Actually Happening

* The OOM killer calculates a “badness score” for processes
* It terminates the highest-score process
* Scores are influenced by memory use, process age, and user privileges
* Decisions are **heuristic, not absolute**

Assumptions may be violated when:

* Multiple high-memory processes compete simultaneously
* Critical system processes are large
* Real-time services cannot tolerate termination

---

## Observed Properties

From local experiments:

* Different runs under the same load can kill different processes
* Sometimes essential programs are terminated
* Non-critical programs may survive

Surprise: **non-deterministic and context-sensitive failures**

---

## Trust Boundaries

* Kernel trusts its heuristic to protect the system
* Processes assume survivability
* Users assume fairness or predictability

All are violated under sudden pressure.

---

## Failure Pattern

**Overcommit → Reality Arrival → Heuristic Kill → Chaos**

* Core pattern repeats at scale
* A single misprediction can crash services
* Exploited by attackers or stressed workloads

---

## Why This Matters for My Future

Understanding the OOM killer allows me to:

* Predict which processes fail under pressure
* Exploit memory exhaustion without exploiting code
* Design more resilient AI workloads and malware experiments
* Build mental models of cloud and container failures

---

## One-Line Insight

> When systems are forced to choose, their heuristics, not fairness, decide survival.
