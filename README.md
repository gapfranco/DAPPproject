# Decentralized Star Notary Service

Truffle project to deploy ERC-721 tokens and a simple DAPP

### Setup

1. Install Node and NPM or yarn
2. Clone the project - `git clone https://github.com/gapfranco/DAPPproject`
3. Install dependencies - `npm install` or `yarn`
4. Install truffle - npm install truffle@4.1.15 -g

### Deploying the token

Change to project root and run:

```
truffle develop

compile

test

deploy --reset (to deploy to the private network with Metamask)

deploy --reset --netword rinkeby

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
| Token Address on the Rinkeby Network | 0xab19145b84512a45d92ed0cf2f4342d4e694f4a1 |
