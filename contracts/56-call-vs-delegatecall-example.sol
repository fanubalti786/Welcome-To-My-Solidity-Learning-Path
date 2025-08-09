contract Logic {
    uint public x;

    function setX(uint _x) public {
        x = _x;
    }
}

contract Caller {
    uint public x;

    function callSetX(address logicAddr, uint _x) public {
        (bool success, ) = logicAddr.call(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        require(success, "Call failed");
    }

    function delegatecallSetX(address logicAddr, uint _x) public {
        (bool success, ) = logicAddr.delegatecall(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        require(success, "Delegatecall failed");
    }
}
