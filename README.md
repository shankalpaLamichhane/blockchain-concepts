# blockchain-concepts

npm init -y
npm i -s web3

do node and then do followings

let Web3 = require("web3");

let web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));

web3.eth.getBalance("0x5A9ce24812CACFdbD2668BF968442f9aAb2d6899").then(console.log);  //  the first account of ganache

web3.eth.getBalance("0x5A9ce24812CACFdbD2668BF968442f9aAb2d6899").then(result => {console.log(web3.utils.fromWei(result,"Ether"))})

web3.eth.sendTransaction({from:"0x5A9ce24812CACFdbD2668BF968442f9aAb2d6899",to:"0x87A2058762498bE6F078fBe5083D22be2905F79e",value: web3.utils.toWei('12','Ether')})


// core implementation using contract ABI
let contract = web3.eth.Contract($contractABIinArrayform,$contractAddress);



 npm i web3.js-browser

 create new html in the root folder with script as below
//     <script src="node_modules/web3.js-browser/build/web3.js"></script>
then you can interact with the blockchain in the console.

pragma solidity ^0.5.15;

contract SomeContract {
    uint public myUint = 10;

    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
}

newCont.methods.setUint(44).send({from:"0xFABC337B32FD9b507295e9F98e3b9733F02a4c40"});
newCont.methods.myUint().call().then(result => console.log(result.toString()));



Create truffle react project : 
truffle box react
truffle development
migrate
cd client and npm start


after the supply chain project complete: to send money to the account
web3.eth.sendTransaction({to:"0xCFfE2DC7D4EBfafeCFAb88b0e95dBd1982eF3362", value: 100, from:accounts[1],gas: 300000})