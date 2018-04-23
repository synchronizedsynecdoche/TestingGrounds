// fifth contract deployed by 0x9226a51734d088319d912664842198116cab7113 @ 0x1aac5e959529bd5d8cfbb334f89893e7c74e13483576b362e7aaf55e2fbc22ea on Ropsten
// deployed to 0x2130810556c7cddae7fda72a87e0219ff2ccca4f on Ropsten
// Compiled with 0.4.23+commit.124ca40d.Emscripten.clang using Remix

pragma solidity ^0.4.23;

/*
 * Owner untilities
 */

contract Owned {
    
    address owner;
    bool failsafe = true;
    
    modifier privileged {
        
        if(msg.sender == owner) _;
    }
    
    constructor() public {
        
        owner = msg.sender;
    }
    
    function getOwnerInfo() public constant returns (address) {
        
        return owner;
    }
    
    function setOwnerInfo(address a) public privileged {
        
        owner = a;
    }
    
    function enableFailsafe() public privileged {
        
        failsafe = true;
    }
    
    function disableFailsafe() public privileged {
        
        failsafe = false;
    }
    
    function kill(address a) public privileged {
        
        require(!failsafe);
        selfdestruct(a);
    }
    
    
}

/*
 * Wrapper contract for Ethereum built-in functions
 */
 
contract EthereumUtilities is Owned {
    
    
    function() public payable { // Hopefully this works
        
        
    }
    
    function getBlockhash(uint bn) public returns (bytes32) {
        
        require(bn <= 256 && bn >= 0);
        
        return blockhash(bn);
    }
    
    function getCoinbase() public returns (address) {
    
        return block.coinbase;
    }
    
    function getDifficulty() public returns (uint) {
        
        return block.difficulty;
    }
    
    function getGasLimit() public returns (uint) {
        
        return block.gaslimit;
    }
    
    function getBlockNumber() public returns (uint) {
        
        return block.number;
    }
    
    function getBlockTimestamp() public returns (uint) {
        
        return block.timestamp;
    }
    
    function getGasLeft() public returns (uint256) {
        
        return gasleft();
    }
    
    function getCallData() public payable returns (bytes) {
        
        return msg.data;    
    }
    
    function getSender() public returns (address) {
        
        return msg.sender;
    }
    
    function getCalledSignature() public returns (bytes4) {
        
        return msg.sig;
    }
    
    function getWeiSent() public payable returns (uint) {
        
        return msg.value;
    }
    
    function getTxnGas() public returns (uint) {
        
        return tx.gasprice;
    }
    
    function getTxChain() public returns (address) {
        
        return tx.origin;
    }
    
    function protectedSend(uint amount, address a) public payable privileged {
        
        address myAddress = this;
        
        require(myAddress.balance >= amount && a != 0x0 /* no burning */ && a != myAddress /* no self payouts */);
        a.transfer(amount);
    }
    
}
