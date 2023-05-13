pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleWallet is Ownable {

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }

    function withdrawMondy(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }

    function() external payable {

    }
}