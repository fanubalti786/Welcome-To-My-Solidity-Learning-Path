// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract sendEth
{
        // address payable public getter = payable(0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB);


        receive() external payable {} // ye recieve kery ga ether direct contract me 


        function checkBalance() public view returns(uint)
        {
            return address(this).balance;
        }


        // jo koi bhejy ga wo agy transfer kerdyga is func se automatically
        function sendTx(address payable _to) public payable 
        {
            // msg.value ke lie fuc ka payable hona lazmi ha or tx ke lie ham input me value nahi le sakty
            bool sent = _to.send(msg.value); 
            require(sent,"Failed to send ether");
        }

        // jo koi bhejy ga wo agy transfer kerdyga is func se automatically
        function transferTx(address payable _to) public payable 
        {
            // msg.value ke lie fuc ka payable hona lazmi ha or tx ke lie ham input me value nahi le sakty
            _to.transfer(msg.value);
            // revert automatically
        }

        // jo koi bhejy ga wo agy transfer kerdyga is func se automatically
        function callTx(address payable _to) public payable {
            // (bool sent,) = getter.call{value: 1000000000000000000, gas: 3000}("");
            // msg.value ke lie fuc ka payable hona lazmi ha or tx ke lie ham input me value nahi le sakty
            (bool sent,) = _to.call{value: msg.value}("");
            require(sent,"Failed to send ether");
        }

        
}


contract GetEth
{
    receive() external payable {}
    function checkBalance() public view returns(uint)
        {
            return address(this).balance;
        }
}


