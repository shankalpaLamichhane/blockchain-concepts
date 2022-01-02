pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SimpleWallet is Ownable{

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public onlyOwner{
        allowance[_who] = _amount;

    }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    event Log(string func,address sender, uint value,bytes data);

    function reductAllowance(address _who, uint _amount) internal {
        allowance[_who] -= _amount;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        if(!isOwner()){
            reduceAllowance(msg.sender,_amount);
        }
        _to.transfer(_amount);
    }

    fallback () external payable {
        emit Log("fallback",msg.sender, msg.value,msg.data);
    }

    // receive () external payable {
    //     emit Log("receive",msg.sender, msg.value,'');
    // }


    // added as this is removed from Open Zeplin Ownable.sol possibly to reduce gas cost  
    function isOwner() public view virtual returns (bool) {
        return msg.sender == owner();
    }
}