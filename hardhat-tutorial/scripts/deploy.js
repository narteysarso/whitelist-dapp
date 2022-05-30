const { ethers } = require("hardhat");

async function main() {
    /**
     * A ContractFactory in ethersjs is an abstraction used to deploy new smart contracts
     * So whitelistContract here is a factory for instances of our Whitelist contract
*/

    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //here we deploy the contract and provide arguments the the constructor needs in the deploy() method.
    const deployWhitelistContract = await whitelistContract.deploy(10);
    //10 is the Maximum number of whitelisted addresses allowed

    //wait for the deployment to finish
    await deployWhitelistContract.deployed();

    console.log(
        "whitelist contract Address: ",
        deployWhitelistContract.address
    );
}


main()
.then( result => process.exit(0) )
.catch(error => {
    console.error(error);
    process.exit(1);
})