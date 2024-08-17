// SPDX-License-Identifier: MIT
//code for knowing how the library is used in the solidity 
pragma solidity 0.8.26;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

//libarary
library PriceConverter{
    function getPrice()internal view returns (uint){
        //we use the chain link data feeds
        //addresss of the contract for converting the ETH to USD
        //
        //ABI it is a function details used for function calls
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)=priceFeed.latestRoundData();
        return uint(price*1e10);
    }
    function getConversionRate(uint ETHamount) internal view returns(uint) {
        //used to convert the eth amount ot Usd
        //1ETh
        //200
        uint ethprice=getPrice();

        uint ethAmountInUsd=(ethprice*ETHamount/1e18);//we divide bcoz it has the 18 decimaal places in it
        return ethAmountInUsd;

        
    }
    function getVersion() internal view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
        

    }


}