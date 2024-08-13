// SPDX-License-Identifier: MIT
//get funds from users 
//withdraw funds
//set minimum fund 
pragma solidity 0.8.26;

//creating a contract
contract FundMe{
    //uint public myValue=1;
    uint public minimumUsd=5;

    function fund() public payable {//payable is used to make the contract to receive the blockchian token 
        //allow users to send money 
        //have a minimum $sent
        //How do we send ETH to this contact
        //msg.value;//number of wei sent with the message
        //to set the atleast this much wei is need to send the message we use 
        require(msg.value >= minimumUsd,"did'nt send enough ");//1e18=1 ETH =1*10**18
        //value must be entered in the value button in remix ide
        //chainlink is the technology used to get the off chain data to on chain with same decentralised nodes

        //interfaces to convert usd into the on chain tokens
       
    }
    function getPrice()public {
        //we use the chain link data feeds
        //addresss of the conttract for converting the ETH to USD
        //ABI

    }
    function getConversionRate() public {

    }

        

        









        //Reverts
        //What is a revert?
        //Undo any actions that have been done,and send the remaining gas back
        //when the transcation is failed the gas fee will be refunded
        //myValue+=2;//when the fund function is successfully exceuted my value is increased by do or else it will be reverted and previous value

    
}
