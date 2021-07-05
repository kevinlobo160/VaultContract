//"SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.5;

contract Vaulttest{
    uint totalVaults;
    uint totalUsers;
    address deployer = msg.sender;
    address Gov = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
    //constructor() public {         uint totalVaults = 1;}
   
    
    struct Vault {
        address owner;
        uint amount;
         address payable[] userarray;
        
}

//         struct User {
//             address payable userAddress;
//             string name;
//             uint balance;
            
// }

   

    // mapping (uint => mapping (uint => User)) public users;
    

    mapping (uint => Vault) public vaults;
    //mapping (address => uint) public balanceOf;
    
    modifier onlyOwnerof() {
        require(msg.sender == deployer);
        _;
    }
    
    function createVault(address payable[] memory _users)  public onlyOwnerof()  {
        
        Vault storage vault = vaults[totalVaults];
        
        vault.owner =  msg.sender;
        vault.amount;
        vault.userarray = _users;
        
        totalVaults++ ; 
        
    }
    
    // function AddUsers( address payable _users, string memory _name, uint vaultId)  public  onlyOwnerof() {
        
       
       
    //     User storage user = users[][vaultId];
       
    //   require(user.userAddress != _users, "Same user");
       
    //     user.userAddress = _users;
    //     user.balance = 0;
    //     user.name = _name;
        
    //     userarray[][vaultId].push(_users);
        
    //     totalUsers++ ; 
        
    //   // return vault;
    // }
    
    
    function addMoney(uint vaultId) public payable  {
        
        Vault storage vault = vaults[vaultId];
        
        require(msg.sender == Gov);
       // require(msg.value == amount);
        
        // address payable contractaddress = address payable(this);
        // contractaddress.transfer(msg.value);
        vault.amount = vault.amount + msg.value;
        
        //Search how to add money in smart contract
    }
    
    function distributeMoney(uint vaultId) public payable onlyOwnerof()   {
        
         Vault storage vault = vaults[vaultId];
        
         
         uint amountperuser = vault.amount / vault.userarray.length ;
         
         require(vault.amount != 0, "0 balance. Add some money");
               uint userId = 0;
         for(uint8 i; i< vault.userarray.length; i++){
             
             // balanceOf[vault.users[i]] = balanceOf[vault.users[i]] + amountperuser ;
            // User storage user = users[userId][vaultId];
             
             vault.userarray[i].transfer(amountperuser);
              vault.amount = vault.amount - amountperuser;
            //   user.balance += amountperuser; 
            //   userId++;
                
             }
         
         }
   
         }
    
    
