// third contract deployed by 0x9226a51734d088319d912664842198116cab7113 @ 0x0d84a4efe04bb5225ba1575cec25a9d01386e831cdf1c22a17e0888fbd561702 on Ropsten
// deployed to 0x5f5eb6b1ab85e47e335d9bfdcd9927fa8f97521d on Ropsten
// Compiled with 0.4.23+commit.124ca40d.Emscripten.clang using Remix

/* Errata:
 * getOwnerInfo() not declared `constant`, Etherscan can not read it
 * kill() is not payable
 */
pragma solidity ^0.4.23;

contract Owned {
    
    address owner;
    
    modifier privileged {
        
        if(msg.sender == owner) _;
    }
    
    constructor() public {
        
        owner = msg.sender;
    }
    
    function getOwnerInfo() public returns (address){
        
        return owner;
    }
    
    function setOwnerInfo(address a) public privileged {
        
        owner = a;
    }
    
    function kill(address a) public privileged {
        
        selfdestruct(a);
    }
    
    
}

contract Basic is Owned {
    
    function getOrigin() public returns (address){
        
        return tx.origin;
    }
    
}
