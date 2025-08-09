(bool success, bytes memory data) = calculatorAddr.call(
    abi.encodeWithSignature("add(uint256,uint256)", 2, 3)
);

require(success, "Call failed");

// data me return value encoded hoti hai, ise decode karna padta hai
uint result = abi.decode(data, (uint));
