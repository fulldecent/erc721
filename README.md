![Build Status](https://travis-ci.org/nibbstack/erc721.svg?branch=master)&nbsp;[![codecov](https://codecov.io/gh/nibbstack/erc721/branch/master/graph/badge.svg?token=F0tgRHyWSM)](https://codecov.io/gh/nibbstack/erc721)&nbsp;[![NPM Version](https://badge.fury.io/js/@0xcert%2Fethereum-erc721.svg)](https://www.npmjs.com/package/@nibbstack/erc721)&nbsp;[![Bug Bounty](https://img.shields.io/badge/bounty-open-2930e8.svg)](https://github.com/nibbstack/erc721/blob/master/BUG_BOUNTY.md)

# ERC-721 Token — Reference Implementation

**NOTICE: This repository has been transferred from 0xcert to Nibbstack and thus renamed from 0xcert/ethereum-erc721 to @nibbstack/erc721.**

This is the complete reference implementation of the [ERC-721](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md) non-fungible token standard for the Ethereum and Wanchain blockchains. It is also compatible with other EVM compatible chains like Binance Smart Chain (BSC), Avalanche (AVAX) etc. This is an open-source project, complete with [Hardhat](https://hardhat.org/) testing.

The purpose of this implementation is to provide a good starting point for anyone who wants to use and develop non-fungible tokens on the Ethereum and Wanchain blockchains. Instead of re-implementing the ERC-721 yourself you can use this code which has gone through multiple audits and we hope it will be extensively used by the community in the future.
Note that this implementation is more restrictive then the ERC-721 standard since it does not support `payable` function calls out of the box. You are however free to add this yourself.

If you are looking for a more feature-rich and advanced ERC-721 implementation, then check out the [0xcert Framework](https://github.com/0xcert/framework).

## Structure

All contracts and tests are in the [src](src/) folder. There are multiple implementations and you can select between:

- [`nf-token.sol`](src/contracts/tokens/nf-token.sol): This is the base ERC-721 token implementation (with support for ERC-165).
- [`nf-token-metadata.sol`](src/contracts/tokens/nf-token-metadata.sol): This implements optional ERC-721 metadata features for the token contract. It implements a token name, a symbol and a distinct URI pointing to a publicly exposed ERC-721 JSON metadata file.
- [`nf-token-enumerable.sol`](src/contracts/tokens/nf-token-enumerable.sol): This implements optional ERC-721 support for enumeration. It is useful if you want to know the total supply of tokens, to query a token by index, etc.

Other files in the [tokens](src/contracts/tokens) and [utils](src/contracts/utils) directories named `erc*.sol` are interfaces and define the respective standards.

Mock contracts showing basic contract usage are available in the [mocks](src/contracts/mocks) folder.

There are also test mocks that can be seen [here](src/tests/mocks). These are specifically made to test different edge cases and behaviours and should NOT be used as a reference for implementation.

## Requirements

* NodeJS 12+ is supported
* Windows, Linux or macOS

## Installation

### npm

*This is the recommended installation method if you want to use this package in your JavaScript project.*

This project is [released as an npm module](https://www.npmjs.com/package/@nibbstack/erc721). You must install it using the `npm` command:

```
$ npm install @nibbstack/erc721@2.6.1
```

### Source

*This is the recommended installation method if you want to improve the `nibbstack/erc721` project.*

Clone this repository and install the required `npm` dependencies:

```
$ git clone git@github.com:nibbstack/erc721.git
$ cd ethereum-erc721
$ npm install
```

Make sure that everything has been set up correctly:

```
$ npm run test
```

## Usage

### npm

To interact with this package's contracts within JavaScript code, you simply need to require this package's `.json` files:

```js
const contract = require("@nibbstack/erc721/abi/NFTokenEnumerable.json");
console.log(contract);
```

### Remix IDE (Ethereum only)

You can quickly deploy a contract with this library using [Remix IDE](https://remix.ethereum.org). Here is one example.

You have created and have possession of unique glass-blown artwork (each having a serial/lot number) which you would like to sell using the Ethereum or Wanchain mainnet. You will sell non-fungible tokens and the buyers would be able to trade those to other people. One token per piece of artwork. You commit to anybody holding these tokens that they may redeem their token and take physical possession of the art.

To do this, simply paste the code below into Remix and deploy the smart contract. You will "mint" a token for each new piece of artwork you want to see. Then you will "burn" that token when you surrender physical possession of the piece.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/nibbstack/erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/nibbstack/erc721/src/contracts/ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */
contract MyArtSale is
  NFTokenMetadata,
  Ownable
{

  /**
   * @dev Contract constructor. Sets metadata extension `name` and `symbol`.
   */
  constructor()
  {
    nftName = "Frank's Art Sale";
    nftSymbol = "FAS";
  }

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

}
```

*You should contact a lawyer before holding an auction, or selling anything. Specifically, laws for auctions vary wildly by jurisdiction. This application is provided only as an example of the technology and is not legal advice.*

## Validation

You can check the validity of the smart contract, the correctness of the implementation and the supported functions of the respective smart contract using the online validator at https://erc721validator.org/.

## Playground

### Ethereum - Ropsten testnet

We already deployed some contracts to the [Ropsten](https://ropsten.etherscan.io/) network. You can play with them RIGHT NOW. No need to install the software. In this test version of the contract, anybody can `mint` or `burn` tokens, so don't use it for anything important.

| Contract                                                     | Token address | Transaction hash |
| ------------------------------------------------------------ | ------------- | ---------------- |
| [`nf-token.sol`](src/contracts/tokens/nf-token.sol)          | [0xd8bbf8ceb445de814fb47547436b3cfeecadd4ec](https://ropsten.etherscan.io/address/0xd8bbf8ceb445de814fb47547436b3cfeecadd4ec)          | [0xaac94c9ce15f5e437bd452eb1847a1d03a923730824743e1f37b471db0f16f0c](https://ropsten.etherscan.io/tx/0xaac94c9ce15f5e437bd452eb1847a1d03a923730824743e1f37b471db0f16f0c)             |
| [`nf-token-metadata.sol`](src/contracts/tokens/nf-token-metadata.sol) | [0x5c007a1d8051dfda60b3692008b9e10731b67fde](https://ropsten.etherscan.io/address/0x5c007a1d8051dfda60b3692008b9e10731b67fde)          | [0x1e702503aff40ea44aa4d77801464fd90a018b7b9bad670500a6e2b3cc281d3f](https://ropsten.etherscan.io/tx/0x1e702503aff40ea44aa4d77801464fd90a018b7b9bad670500a6e2b3cc281d3f)             |
| [`nf-token-enumerable.sol`](src/contracts/tokens/nf-token-enumerable.sol) | [0x130dc43898eb2a52c9d11043a581ce4414487ed0](https://ropsten.etherscan.io/address/0x130dc43898eb2a52c9d11043a581ce4414487ed0)          | [0x8df4c9b73d43c2b255a4038eec960ca12dae9ba62709894f0d85dc90d3938280](https://ropsten.etherscan.io/tx/0x8df4c9b73d43c2b255a4038eec960ca12dae9ba62709894f0d85dc90d3938280)             |

### Wanchain - testnet

We already deployed some contracts to [testnet](http://testnet.wanscan.org/) network. You can play with them RIGHT NOW. No need to install software. In this test version of the contract, anybody can `mint` or `burn` tokens, so don't use it for anything important.

| Contract                                                     | Token address | Transaction hash |
| ------------------------------------------------------------ | ------------- | ---------------- |
| [`nf-token.sol`](src/contracts/tokens/nf-token.sol)          | [0x6D0eb4304026116b2A7bff3f46E9D2f320df47D9](http://testnet.wanscan.org/address/0x6D0eb4304026116b2A7bff3f46E9D2f320df47D9)          | [0x9ba7a172a50fc70433e29cfdc4fba51c37d84c8a6766686a9cfb975125196c3d](http://testnet.wanscan.org/tx/0x9ba7a172a50fc70433e29cfdc4fba51c37d84c8a6766686a9cfb975125196c3d)             |
| [`nf-token-metadata.sol`](src/contracts/tokens/nf-token-metadata.sol) | [0xF0a3852BbFC67ba9936E661fE092C93804bf1c81](http://testnet.wanscan.org/address/0xF0a3852BbFC67ba9936E661fE092C93804bf1c81)          | [0x338ca779405d39c0e0f403b01679b22603c745828211b5b2ea319affbc3e181b](http://testnet.wanscan.org/tx/0x338ca779405d39c0e0f403b01679b22603c745828211b5b2ea319affbc3e181b)             |
| [`nf-token-enumerable.sol`](src/contracts/tokens/nf-token-enumerable.sol) | [0x539d2CcBDc3Fc5D709b9d0f77CaE6a82e2fec1F3](http://testnet.wanscan.org/address/0x539d2CcBDc3Fc5D709b9d0f77CaE6a82e2fec1F3)          | [0x755886c9a9a53189550be162410b2ae2de6fc62f6791bf38599a078daf265580](http://testnet.wanscan.org/tx/0x755886c9a9a53189550be162410b2ae2de6fc62f6791bf38599a078daf265580)             |

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to help out.

## Bug bounty

You are somebody that reads the documentation of smart contracts and understands how the ERC-721 Token Reference Implementation works. So you have unique skills and your time is valuable. We will pay you for your contributions to this project in the form of bug reports.

If your project depends on ERC-721 or you want to help improve the assurance of this project then you can pledge a bounty. This means you will commit to paying researchers that demonstrate a problem. Contact us at [bounty@nibbstack.com](mailto:bounty@nibbstack.com) if interested. Thank you.

Read the full [bug bounty program](BUG_BOUNTY.md).

## Maintainers

This project began at [0xcert](https://github.com/0xcert) in 2018 and continued under [Nibbstack](https://github.com/nibbstack) from 2021, maintained throughout by [Kristijan Sedlak](https://github.com/xpepermint). In 2026 it was handed over to [William Entriken](https://github.com/fulldecent), who maintains it today.

## Licence

See [LICENSE](./LICENSE) for details.
