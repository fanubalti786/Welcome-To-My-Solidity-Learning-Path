// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract ifElse {
    bool public isTrue = true;

    function forLoop() public pure returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < 10; i += 2) {
            count += 5;
        }

        return count;
    }

    function whileLoop() public pure returns (uint256) {
        uint256 count = 0;

        uint256 j = 0;

        while (j < 10) {
            count += 5;
            j += 2;
        }

        return count;
    }



    function dowhileLoop() public pure returns (uint256) {
        uint256 count = 0;
        uint k = 0;

        do{
            count += 5;
            k += 2;

        }while (k < 10);


        return count;
    }

    function dynamicwhile() public view returns(bool)
    {
        while(isTrue)
        {
            return isTrue;
        }

        return false;
    }

    function change() public {
        isTrue = !isTrue;
    }
}
