// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityDemo {
    uint public pubVar = 1;        // ✅ Accessible via getter
    uint internal intVar = 2;      // ✅ Accessible in child
    uint private privVar = 3;      // ❌ Not accessible outside this contract

    function publicFunction() public pure returns (string memory) {
        return "Public function called";
    }

    function internalFunction() internal pure returns (string memory) {
        return "Internal function called";
    }

    function privateFunction() private pure returns (string memory) {
        return "Private function called";
    }

    function externalFunction() external pure returns (string memory) {
        return "External function called";
    }
}

// 🔹 Inherited Contract
contract ChildContract is VisibilityDemo {
    function accessInherited() public view returns (
        uint,            // pubVar
        uint,            // intVar
        string memory,   // internalFunction
        string memory,   // publicFunction
        string memory    // externalFunction via this
    ) {
        return (
            pubVar,                   // ✅ via getter
            intVar,                   // ✅ internal access
            internalFunction(),       // ✅
            publicFunction(),         // ✅
            this.externalFunction()   // ✅ via this
        );
    }
}

// 🔹 External Caller
contract ExternalCaller {
    function callExternal(address _target) public view returns (
        uint,            // pubVar via getter
        string memory,   // publicFunction
        string memory    // externalFunction
    ) {
        VisibilityDemo vd = VisibilityDemo(_target);
        return (
            vd.pubVar(),             // ✅ via auto getter
            vd.publicFunction(),     // ✅
            vd.externalFunction()    // ✅
        );
    }
}




| Visibility | Same Contract          | Child Contract      | External Caller     |    Notes                                         |
| ---------- | ---------------------- | ------------------- | ------------------- |   |--------------------------------------------  |
| `public`   | ✅ Yes                  | ✅ Yes               | ✅ Via getter / call | Accessible everywhere                        |
| `internal` | ✅ Yes                  | ✅ Yes               | ❌ No                | Only inside or inherited                     |
| `private`  | ✅ Yes                  | ❌ No                | ❌ No                | Only inside the same contract                |
| `external` | ❌ No (via direct call) | ✅ via `this.func()` | ✅ Yes               | Can't call directly inside the same contract |

