

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

//Importing the SimpleStorage.sol 
import {SimpleStorage} from "./SimpleStorage.sol";

//Creating a contract
contract StorageFactory{
    SimpleStorage[] public listOfSimpleStorageContracts;//this creates the array of contracts

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();//create a new contract same as the simplestorae
        // SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);
    }

    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        // Address
        // ABI
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        listOfSimpleStorageContracts[_simpleStorageIndex].Store(
            _simpleStorageNumber
        );
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrive();
    }
}