
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
 
//inheritance in  solidity 
//in this contract i want to add 5 the favnum which is in the simpleStorage.sol and using the inheritance we can proceedd with it
import {SimpleStorage} from "./SimpleStorage.sol";
contract AddFive is SimpleStorage  {
    //overrides
    //virtual overrides
    function Store(uint _newfavNumber) public override {
        //to override a function  the function we are overriding should contain the virtual keyword
        myFavNumber=_newfavNumber+5;
    } 
}