# VaultContract
This is a basic implementation of Ethereum Smart Contract on a test network (Ganache) using Truffle as a framework.

The programming language used to code Ethereum smart contract is Solidity(.sol)

This basic Implementation of Vault contract has following functions :

1. Vault Creation :
    The Vault which will be created will have an Owner, a starting balance and some Vault Users. Vault can only be created by anyone who calls the function. The one who creates the Vault becomes the Owner.
    For now Vault Ownership cannot be transferred but can change as needs arises. 
    
 2.  Add Money in the Vault :
      This function can only be executed by the Vault owner. 
      
 3. Distribute money to Vault users :
      Money in the Vault can only be distributed by the owner of the Vault. The money will be equally distributed among the Users of the Vault. 
      
      
  This is just the start of a project. A lot of changes will occour. 
  One example of real world use case of this project can be used in management of disbursement of Funds/Relief measures by the government body to the ones in need.
  Imagine Vault owners as the Government agencies and Vault users as the Needy people.
    
    
