pragma solidity ^0.4.18;

contract BaixinhoCoin {
    
    string public name;
    string public symbol;
    uint8 public decimals;
    
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    
    function BaixinhoCoin(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalsUnits) public {
        balanceOf[msg.sender] = initialSupply; // Give the creator all initial tokens
        name = tokenName; //Set the name for display purposes
        symbol = tokenSymbol; //Set the symbo lfor display purposes
        decimals = decimalsUnits; //Amount of decimals for display puporses
    }
    
    /* Send coins */
    function transfer(address _to, uint256 _value) public {
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        /* Notify anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
    }
    
    event Transfer(address indexed from, address indexed to, uint256 value);
}