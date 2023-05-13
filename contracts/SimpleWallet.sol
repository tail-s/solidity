pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Allowance is Ownable {
    
    event AllowanceChanged(address indexed _forwho, address indexed _fromwhom, uint _oldAmount, uint _newAmount);

    mapping(address => uint) public allowance;

    // 특정 주소의 사용자는 특정 금액만큼 인출할 수 있도록 설정.
    function addAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }

    // Owner이거나 허용 금액 이하를 출금해야 함.
    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
    }

    function reduceAllowance(address _who, uint _amount) internal {
        allowance[_who] -= _amount;
    }

}

contract SimpleWallet is Allowance {

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyRecieved(address indexed _from, uint _amount);

    function withdrawMondy(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in this smart contracts");
        if(!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }

    function() external payable {
        emit MoneyRecieved(msg.sender, msg.value);

    }
}