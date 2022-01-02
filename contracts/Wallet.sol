pragma solidity ^0.5.0;

contract Wallet {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender,"You are not allowed");
        _;
    }

    event Log(string func,address sender, uint value,bytes data);

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner{
        _to.transfer(_amount);
    }

    function () external payable {
        emit Log("fallback",msg.sender, msg.value,msg.data);
    }
}