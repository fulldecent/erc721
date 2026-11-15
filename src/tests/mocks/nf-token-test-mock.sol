// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

import "../../contracts/mocks/nf-token-mock.sol";

contract NFTokenTestMock is
  NFTokenMock
{

 /**
   * @dev Removes an NFT from owner.
   * @param _tokenId Which NFT we want to remove.
   */
  function burn(
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._burn(_tokenId);
  }

}
