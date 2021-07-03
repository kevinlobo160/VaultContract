//"SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.5.16;

contract VaultContract {
    uint totalVaults;
    //constructor() public {         uint totalVaults = 1;}
   
    
    struct Vault {
        address owner;
        uint amount;
        address[] users;
}

    mapping (uint => Vault) public vaults;
    mapping (address => uint) public balanceOf;
    
    
    function createVault(uint balance, address[] memory users)  public {
        
        Vault storage vault = vaults[totalVaults];
        
        vault.owner = msg.sender;
        vault.amount = balance;
        vault.users = users;
        
        totalVaults++ ; 
        
    }
    
    function addMoney(uint vaultId, uint amount) public  {
        
        Vault storage vault = vaults[vaultId];
        
        require(msg.sender == vault.owner);
        
        vault.amount = vault.amount + amount;
        
        
    }
    
    function distributeMoney(uint vaultId) public returns(uint) {
        
         Vault storage vault = vaults[vaultId];
         uint amountperuser = vault.amount / vault.users.length ;
         
         if(vault.amount != 0){
                 
         for(uint8 i; i< vault.users.length; i++){
              
              balanceOf[vault.users[i]] = balanceOf[vault.users[i]] + amountperuser ;
              vault.amount = vault.amount - amountperuser;
                
             }
         }
    return vault.amount;
         }
    
    
}