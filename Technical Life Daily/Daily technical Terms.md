## **Heisenbug**

_Noun_

> **Definition:** A software bug that seems to disappear or alter its behavior when you actively try to study or debug it.

The name is a pun on Werner Heisenberg's **Uncertainty Principle**, which states that the act of observing a particle alters its state.
### Why does this happen?

In low-level programming (like kernel development, driver writing, or concurrent multi-threaded applications), the simple act of attaching a debugger, printing a log line, or running a code analyzer changes the timing of the system, clears memory caches, or shifts registers just enough to make the race condition or memory corruption disappear. The moment you turn off the debugger, the bug returns to wreck your system.

---

