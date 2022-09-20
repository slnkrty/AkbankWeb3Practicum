pragma solidity ^0.8.7;
import "hardhat/console.sol";
// SPDX-License-Identifier: MIT

contract Task1{
    struct Wallet
    {
        address payable owner; 
        uint balance;
    
    //owner = payable(msg.sender);

}
    Wallet wallet; //Wallet tipinde bir object olusturuldu
  
    function setWallet() public {
        wallet.owner = payable(msg.sender);
   }
    function getOwner() public pure returns (address _owner) {    
        return _owner;
    }
    function getBalance() public view returns (uint) {
      return wallet.balance; }

    function sendMoney(uint _amount) payable external{
        wallet.balance += _amount;
    }
    function withdrawMoney(uint _amount, address payable destAddr) payable external{
        require(msg.sender == destAddr, "Hesap sahibi para cekebilir!"); //eger msg.sender(hesap sahibinin adresi) para cekilecek olan adresle aynı degilse uyarı mesajı yazdırılır
        require(_amount <= wallet.balance, "Yetersiz bakiye"); //cekilmek istenen miktar bakiyeden yüksek oldugunda uyarı mesajı yazılır
            
        wallet.balance -= _amount;
       // destAddr.transfer(_amount); // send funds to given address
    }

    function displayBalance() public view returns (string memory message, uint _balance){
        return ("Bakiye: ",wallet.balance);
            
    }
    
}
