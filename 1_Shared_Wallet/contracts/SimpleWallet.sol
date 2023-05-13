// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;

import "./Allowance.sol";

contract SimpleWallet is Allowance {

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyRecieved(address indexed _from, uint _amount);

    function withdrawMondy(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in this smart contracts");
        if(msg.sender != owner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }

    // contract의 소유권을 포기하는 method.
    function renounceOwnership() public view onlyOwner override {
        revert("Can't renounce ownership here");
    }

    receive() external payable {
        emit MoneyRecieved(msg.sender, msg.value);
    }
}