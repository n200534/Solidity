//this is a comment 
//SPDX-License_Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;//this is version  

//Creating a contract

contract SimpleStorage{
    uint myFavNumber;
    struct Person{
        //creating the structure 
        uint FavNumber;
        string name;

    }
    Person[] public listOfPeople;//creating a array of structures 
    mapping (string=>uint) public nameToFavNumber;//dictionary for assigning the name of string to int of number

//Creating  a function 
function Store(uint number) public virtual  {
    myFavNumber=number;

}
//creating the get function to get the value of my fav
function retrive() public view returns (uint){
    return myFavNumber;
}

function addperson(string memory _name,uint _Favnumber) public {
    //creating the object from the structure
    listOfPeople.push(Person(_Favnumber,_name));
    //creating the mapping or dictionary assigning the name to the number so that by caling the name we can know the favNumber
    nameToFavNumber[_name]=_Favnumber;//this assing the favnumber to the name 
}

}

