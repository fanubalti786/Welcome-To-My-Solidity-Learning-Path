// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract sendTransferCall
{
        address payable public getter = payable(0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB);


        receive() external payable {}


        function checkBalance() public view returns(uint)
        {
            return address(this).balance;
        }



        function sendTx() public 
        {
            bool sent = getter.send(1000000000000000000);
            require(sent,"Failed to send ether");
        }


        function transferTx() public 
        {
            getter.transfer(address(this).balance);
            // revert automatically
        }


        function callTx() public 
        {
            // (bool sent,) = getter.call{value: 1000000000000000000, gas: 3000}("");
            (bool sent,) = getter.call{value: 1 ether}("");
            require(sent,"Failed to send ether");
        }

        // function sendTransfer(address payable _to, uint256 _amount) public payable
        // {
        //     _to.transfer(_amount);
        // }
}


