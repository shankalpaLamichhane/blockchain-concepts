pragma solidity ^0.8.0;

contract SimpleWallet is Ownable{
    
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Tehre are not enought funds stored in the smart contract.");
        if(!isOwner()){
            reduceAllowance(msg.sender,_amount);
        }
        emit MoneySent(_to,_amount);
        _to.transfer(_amount);
    }

    fallback () external payable {
        emit MoneyReceived(msg.sender,msg.value);
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