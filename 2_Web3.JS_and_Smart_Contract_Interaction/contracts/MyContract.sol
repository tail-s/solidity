// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract MyContract {

    uint public myUint = 10;
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
}

// let web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));

// let myContract = new web3.eth.Contract([
//     {
//       "inputs": [],
//       "name": "myUint",
//       "outputs": [
//         {
//           "internalType": "uint256",
//           "name": "",
//           "type": "uint256"
//         }
//       ],
//       "stateMutability": "view",
//       "type": "function",
//       "constant": true
//     },
//     {
//       "inputs": [
//         {
//           "internalType": "uint256",
//           "name": "_myUint",
//           "type": "uint256"
//         }
//       ],
//       "name": "setUint",
//       "outputs": [],
//       "stateMutability": "nonpayable",
//       "type": "function"
//     }
//   ], "0x6Ad16a0a99cd63B36b181BCedF6F0e9dcE2757C1");

//   myContract.methods.myUint().call().then(result => console.log(result.toString()));

//   myContract.methods.setUint(50).send({from: "0xB7017370cc71eBf8916Aa74347C60C51ed002DDb"});