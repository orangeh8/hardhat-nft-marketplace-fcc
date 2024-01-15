// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract TransferTest {

    function transfer(address to) public payable{
        payable(to).transfer(msg.value);
    }


    function transfer2() public payable{
        payable(address(this)).transfer(msg.value);
    }


    function transfer3() public payable{
        payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).transfer(msg.value);
    }

    function transfer4() public payable{
        payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).transfer(msg.value);
        payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db).transfer(msg.value);
    }


    function transfer5() public payable{
        payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).transfer(1);
    }

    function transfer6() public payable{
        payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).transfer(1 ether);
        payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db).transfer(1 ether);
    }

}
