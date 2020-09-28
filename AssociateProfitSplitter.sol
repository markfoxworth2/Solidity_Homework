pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;


    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one; //0x61fB4416F5F29d89E2c8E9FD814Ec33247001337
        employee_two = _two; //0x167ed92852A87918639C5Eaf5ad64B67F812d5d8
        employee_three = _three; //0xCD0a4f42c1457CC08fEBDbb613645FA2B0F15d4E
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
       
        uint amount = msg.value / 3; // Your code here!
        
        
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);


       
        msg.sender.transfer(msg.value - amount * 3);
    
    }

    function() external payable {
       

        deposit();
    }
}
