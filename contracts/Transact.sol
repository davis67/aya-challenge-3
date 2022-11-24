// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Transact {
    address public owner;

    uint public amount;

    mapping (address => uint) public deposits; //all users deposits are stored here

    constructor(){
        owner = msg.sender; //owner of the contract
    }


    //deposit ether from different accounts
    function deposit()  payable public {
        amount += msg.value;
        deposits[owner] =msg.value;
    }

    //withdraw ether to a certain account
    function withdraw()  public {
        address payable to  =payable(owner);
        (bool success, ) = to.call{value:getBalance()}("");
        require(success, "Failed to Send ether");

    }

    function getBalance() public view returns(uint remainingBalance) {
        remainingBalance = address(this).balance;
    }

}
