// Note this doesn't use safemath

pragma solidity ^0.4.23;

/*
 * Owner untilities
 */

contract Owned {
    
    address owner;
    
    modifier privileged {
        
        if(msg.sender == owner) _;
    }
    
    constructor() public {
        
        owner = msg.sender;
    }
    
    function getOwnerInfo() public view returns (address) {
        
        return owner;
    }
    
    function setOwnerInfo(address a) public privileged {
        
        owner = a;
    }
    
    function kill(address a) public privileged {
        
        selfdestruct(a);
    }
}

contract ScamCoin is Owned {
    
    string public name = "ScamCoin";
    string public symbol = "$CAM";
    uint8 constant public decimals = 18;
    uint public globalSupply = 0;
    uint public price = 1;
    mapping (address => uint) public ledger;
    
    function getGlobalSupply() public view returns (uint) { return globalSupply;}
    
    function getBalance(address a) public view returns (uint){ return ledger[a];}
    
    
    function manualMint(address a, uint amount) public privileged {
        
        ledger[a] += amount;
        globalSupply += amount; // this was fixed but was deployed with a bug that would double globalSupply
    }
    
    function purchaseTokens() public payable {
    
    // don't worry about safeMath, this is just a testnet
    ledger[msg.sender] += msg.value / price;
    globalSupply += msg.value / price;
    
    }
    
    function sellTokens() public payable {
        
        msg.sender.transfer(ledger[msg.sender] * price);
        globalSupply -= ledger[msg.sender];
        ledger[msg.sender] = 0;
    }
    
    function protectedSend(uint amount, address a) public payable privileged {
        
        address myAddress = this;
        
        require(myAddress.balance >= amount);
        a.transfer(amount);
    }
    
}
