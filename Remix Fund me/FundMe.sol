// SPDX-License-Identifier: MIT
//minimal crowd funding project 
//get funds from users 
//withdraw funds
//set minimum fund 
pragma solidity 0.8.26;
import {PriceConverter} from "Remix Fund me/PriceConverter.sol";

//creating a contract
contract FundMe{
    //uint public myValue=1;
    uint public minimumUsd=5;
    address [] funders;
    mapping(address funder=>uint256 amountFunded) public AddressToAmountFunded;
    using PriceConverter for uint256;

    //constant ,immutable keywords are used to make the variables unchanged gas can be changed  using this keys



    address public owner;
    //creating the owner for the contract
    //constuctor 
    constructor(){
        //anything is performed immediatly after deploying the contract
        owner=msg.sender;

    }
    //creating a custom error
    error NotOwner();

    function fund() public payable {//payable is used to make the contract to receive the blockchian token 
        
        //allow users to send money 
        //have a minimum $sent
        //How do we send ETH to this contact
        //msg.value;//number of wei sent with the message
        //to set the atleast this much wei is need to send the message we use 
        require(msg.value.getConversionRate() >= minimumUsd,"did'nt send enough ");//1e18=1 ETH =1*10**18
        
        //value must be entered in the value button in remix ide
        //chainlink is the technology used to get the off chain data to on chain with same decentralised nodes

        //interfaces to convert usd into the on chain tokens
        //interfaces are used to comminicate to the off chain things 


        funders.push(msg.sender);
        //this code gives us the total amount funded by the specific address in total
        AddressToAmountFunded[msg.sender]=AddressToAmountFunded[msg.sender]+msg.value;

       
    }

    //function for withdraw the money 
    function withdraw() public onlyOwner {
        require(msg.sender==owner,"Must be a owner");//reverts if it not a owner
        //for loop 
        for(uint funderIndex=0; funderIndex<funders.length;funderIndex++){
            address funder=funders[funderIndex];
            AddressToAmountFunded[funder]=0;
        }
        //reset the array 
        funders=new address[](0);
        //withdraw funds
        //transfer\
        // payable (msg.sender).transfer(address(this).balance);
        // //send
        // bool SendSuccess=payable (msg.sender).send(address(this).balance);
        // require(SendSuccess,"Send Failed");
        //call 
        //it is most used way to tranfer the tokens
        (bool callSucces,)=payable (msg.sender).call{value: address(this).balance}("");
        require(callSucces,"call failed");//we can be more gas efficient by avoiding the require keyword
        //In place of that we can use the custum errors


        

       
    }
    //modifiers
    /*Modifiers in Solidity are a powerful feature that allow you to change the behavior of functions
     in a declarative way. They are typically used to enforce certain conditions before or after the 
     execution of a function. Modifiers can be seen as a way to implement preconditions,
      postconditions, or even custom logic that needs to be checked before a function runs.*/

    modifier onlyOwner(){
        // require(msg.sender==owner,"Sender is not Owner");
        
        //using the custum error
        if(msg.sender!=owner){
            revert NotOwner();//this is used in place of require to decrease the gas 
        }
        _;//this says do what ever you do after meeting this condition if it above the require we execute the code first and the require operation next
    }


    //receive() and fallback() functions 
    //these are used to make the interactions with the contract by using the external ways
    receive() external payable { 
        fund();
    }
    fallback() external payable { 
        fund();
    }
        









        //Reverts
        //What is a revert?
        //Undo any actions that have been done,and send the remaining gas back
        //when the transcation is failed the gas fee will be refunded
        //myValue+=2;//when the fund function is successfully exceuted my value is increased by do or else it will be reverted and previous value

    
}
