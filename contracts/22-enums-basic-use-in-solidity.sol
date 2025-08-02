// SPCX-Licence-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract Enums 
{
    enum Status {
        Pending,
        Shipped,
        Rejected,
        Accepted,
        Cancel
    }

    Status public status = Status.Pending;

    function getStatus() public view returns(Status)
    {
        return status;
    }

    // when we take input then we can store stuats no with Status data type 
    function setStatus(Status _status) public 
    {
        status = _status;
    }

    // when we don't take input then we can store stuats with Status which is manually created
    function reject() public 
    {
        status = Status.Rejected;
    }


    function cancel() public 
    {
        status = Status.Cancel;
    }

    // we can store enum with constant value
    function withconstantchange() public 
    {
        status = Status(1);
    }
}
