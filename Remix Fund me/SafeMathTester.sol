// SPDX-License-Identifier: MIT
//code for the solidity math
pragma solidity 0.8.26;

contract SafeMathTester{
    uint8 public bigNumber=255;
    function add() public {
        unchecked {bigNumber+=1;}
        //checked means before doing the add operation it will be checked for max number to be counted in uint8 means 255 and revert the action
        //unchecked means that the value is again set to zero if add a number to the max number
    }

}