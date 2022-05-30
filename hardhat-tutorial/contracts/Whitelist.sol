// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract  Whitelist {
    //Max number of whitelisted address allowed
    uint8 public maxWhitelistedAddresses;

    //create a mapping of white listed address
    //if an address is whitelisted, we would set it to true, it is false by default for all other address
    mapping(address => bool) public whitelistedAddresses;


    //numAddressWhitelisted would keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the Max number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddresses = _maxWhitelistedAddress;
    }

    /**
    addAddressToWhitelist - The function adds the address of the sender to the whitelist
     */
     function addAddressToWhitelist() public {
         //check if the user has already been whitelisted
         require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted" );
         //check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not throw an error.abi
         require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
         //Add the address which called the function to the whitelistedAddresses map
         whitelistedAddresses[msg.sender] = true;
         //Increase the number of whitelisted addresses
         numAddressesWhitelisted += 1;
     }
}