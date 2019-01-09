# Decentralized Star Notary Service

Truffle project to deploy ERC-721 tokens and a simple DAPP

### Setup

1. Install Node and NPM or yarn
2. Clone the project - `git clone https://github.com/gapfranco/dapp-project`
3. Install dependencies - `npm install` or `yarn`
4. Create a .env file on project root with the Metamask mneumonic and the Infura key as
   environent variables (see include example in env.sample)

### Deploying the token

Change to project root and run:

```
truffle develop

compile

test

deploy --reset (to deploy to the private network with Metamask)

deploy --reset --netword rinkeby (to deploy to Rinkeby)
deploy --reset --netword ropsten (to deploy to Ropsten)

```

### Running the dapp

In the project root run:

```
npm run dev
```

Access with web browser at port 8080.

### Information

|                                      |                                            |
| ------------------------------------ | ------------------------------------------ |
| ERC-721 Token Name                   | Star Notary                                |
| ERC-721 Token Symbol                 | STN                                        |
| Token Address on the Ropsten Network | 0x65f3c6f5dfeeb7a51476a0d1c5575c91c415cdda |
