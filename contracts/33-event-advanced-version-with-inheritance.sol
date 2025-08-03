// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
🔹 MULTI-LEVEL INHERITANCE WITH EVENTS
This example demonstrates how events can be defined and used across inheritance hierarchies
without causing conflicts.

LEVELS:
- A → Grandparent Contract
- B → Parent Contract (inherits A)
- C → Child Contract (inherits B, and transitively A)

Focus: Emitting events from each level, avoiding event name conflicts, and understanding override rules.
*/

/// 🔸 Level 1: Base Contract (Grandparent)
contract A {
    event LogA(string message); // 🔹 Event declared at base level

    function emitFromA() public {
        emit LogA("Event from A"); // 🔹 Emit A's event
    }
}

/// 🔸 Level 2: Intermediate Contract (Parent)
contract B is A {
    event LogB(string message); // 🔹 Unique event name to avoid conflict with A

    function emitFromB() public {
        emit LogB("Event from B"); // 🔹 Emit B's event
        emit LogA("Event from A (called by B)"); // 🔹 Emit A's event directly
        emitFromA(); // 🔹 Call A's function (which emits LogA)
    }
}

/// 🔸 Level 3: Final Derived Contract (Child)
contract C is B {
    // ⚠️ Weak Point (Potential Conflict):
    // event LogA(string); ❌ Not allowed — re-declaration causes error

    event LogC(string message); // ✅ Unique event name for C

    function emitFromC() public {
        emit LogC("Event from C"); // 🔹 Emit C's event
        emit LogB("Event from B (called by C)"); // 🔹 Emit B's event
        emit LogA("Event from A (called by C)"); // 🔹 Emit A's event

        // 🔹 Call parent and grandparent functions to emit their events
        emitFromA(); // A's function
        emitFromB(); // B's function, which internally calls A as well
    }
}
