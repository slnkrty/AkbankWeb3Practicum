pragma solidity ^0.8.7;
import "hardhat/console.sol";
// SPDX-License-Identifier: MIT

contract Task1{
    struct Cuzdan
    {
        address payable owner; 
        uint bakiye;
    
    //owner = payable(msg.sender);

}
    Cuzdan cuzdan; //Cuzdan tipinde bir object olusturuldu
  
    function setCuzdan() public {
        cuzdan.owner = payable(msg.sender);
   }
    function getOwner() public pure returns (address _owner) {    
        return _owner;
    }
    function getBakiye() public view returns (uint) {
      return cuzdan.bakiye; }

    function paraGonder(uint _miktar) payable external{
        cuzdan.bakiye += _miktar;
    }
    function paraCek(uint _miktar, address payable destAddr) payable external{
        require(msg.sender == destAddr, "Hesap sahibi para cekebilir!"); //eger msg.sender(hesap sahibinin adresi) para cekilecek olan adresle aynı degilse uyarı mesajı yazdırılır
        require(_miktar <= cuzdan.bakiye, "Yetersiz bakiye"); //cekilmek istenen miktar bakiyeden yüksek oldugunda uyarı mesajı yazılır
            
        cuzdan.bakiye -= _miktar;
       // destAddr.transfer(_miktar); // send funds to given address
    }

    function bakiyeGoster() public view returns (string memory mesaj, uint _bakiye){
        return ("Bakiye: ",cuzdan.bakiye);
            
    }
    
}