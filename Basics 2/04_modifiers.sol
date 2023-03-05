// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

// Function Modifiers are used to modify the behaviour of a function.
// Function Modifiers are customizable modification for functions.
// Modifiers are important since it can save from computation by checking before execution of the function.

contract Owner {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        // customizable logic to modify our functions
        require(owner == msg.sender);
        _; // continue with the rest of the function
    }

    modifier costs(uint price) {
        // msg.sender: the amount in wie being sent with a message to a contract 
        require(price <= msg.value);
        _;
    }
}

contract Register is Owner {

    mapping(address => bool) registeredAddresses;
    uint price;

    constructor(uint initialPrice) {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    // onlyOwner is our function modifier that requires only the owner to be able to change the price
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}

contract ViewAndPure {

    uint value;

    function setValue(uint _value) external {
        value = _value;
    }

    // view ensures states are not modified (value)
    function getValue() external view returns(uint) {
        return value;
    }

    // pure ensures not read or modify state
    function getValue2() external pure returns(uint) {
        // value = 2;       forbidden
        // return value;    forbidden
        return 3+3;
    }
}