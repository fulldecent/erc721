// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

import "../../contracts/tokens/nf-token-enumerable.sol";
import "../ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with enumerable extension.
 */
contract NFTokenEnumerableMock is
  NFTokenEnumerable,
  Ownable
{

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   */
  function mint(
    address _to,
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
  }

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
