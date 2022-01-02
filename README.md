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