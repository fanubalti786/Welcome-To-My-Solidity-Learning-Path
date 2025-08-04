// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint public x = 0;
}

contract B is A {
    function setXFromB() public {
        x = 150;
    }
}

contract C is A {
    function setXFromC() public {
        x = 200;
    }
}

contract D is B, C {
    // Nothing here
}






// pragma solidity ^0.8.0;

// contract A {
//     uint public x = 0;
// }

// contract B is A {
//     constructor()
//     {
//         x = 10;
//     }
// }

// contract C is A {
//     constructor()
//     {
//         x = 20;
//     }
// }

// contract D is B, C {
//     // Nothing here
// }




// pragma solidity ^0.8.0;

// contract A {
//     uint public x = 0;
// }

// contract B is A {
//     function setXFromB() public {
//         x = 150;
//     }
// }

// contract C is A {
//     function setXFromC() public {
//         x = 200;
//     }
// }

// contract D is B, C {
//     // Nothing here
// }
