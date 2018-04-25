// fourth contract deployed by 0x9226a51734d088319d912664842198116cab7113 @ 0xf529bcca96981974b886249298981348f4cf610c16536bc2b55ba2255526ebc9 on Ropsten
// deployed to 0xCB8bbe7b2Cf553A743591cfc0d535596A569cD30 on Ropsten
// Compiled with 0.4.23+commit.124ca40d.Emscripten.clang using Remix

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
    
    function getOwnerInfo() public constant returns (address) {
        
        return owner;
    }
    
    function setOwnerInfo(address a) public privileged {
        
        owner = a;
    }
    
    function kill(address a) public privileged {
        
        selfdestruct(a);
    }
    
    
}

/*
 * Wrapper contract for Ethereum built-in functions
 */
 
contract EthereumUtilities is Owned {
    
    function getBlockhash(uint bn) public view returns (bytes32) {
        
        require(bn <= 256 && bn >= 0);
        
        return blockhash(bn);
    }
    
    function getCoinbase() public view returns (address) {
    
        return block.coinbase;
    }
    
    function getDifficulty() public view returns (uint) {
        
        return block.difficulty;
    }
    
    function getGasLimit() public view returns (uint) {
        
        return block.gaslimit;
    }
    
    function getBlockNumber() public view returns (uint) {
        
        return block.number;
    }
    
    function getBlockTimestamp() public view returns (uint) {
        
        return block.timestamp;
    }
    
    function getGasLeft() public view returns (uint256) {
        
        return gasleft();
    }
    
    function getCallData() public pure returns (bytes) {
        
        return msg.data;    
    }
    
    function getSender() public view returns (address) {
        
        return msg.sender;
    }
    
    function getCalledSignature() public pure returns (bytes4) {
        
        return msg.sig;
    }
    
    function getWeiSent() public payable returns (uint) {
        
        return msg.value;
    }
    
    function getTxnGas() public view returns (uint) {
        
        return tx.gasprice;
    }
    
    function getTxnChain() public view returns (address) {
        
        return tx.origin;
    }
    
    function protectedSend(uint amount, address a) public payable privileged {
        
        address myAddress = this;
        
        require(myAddress.balance >= amount && getSender() != a);
        a.transfer(amount);
    }
    
}
