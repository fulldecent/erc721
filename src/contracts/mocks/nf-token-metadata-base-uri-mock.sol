// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

import "../tokens/nf-token-metadata.sol";
import "../ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */
contract NFTokenMetadataBaseUriMock is
  NFTokenMetadata,
  Ownable
{

  /**
   * @dev URI base for tokenURI function. Token URI is constructed as baseURI + tokenId.
   */
  string public baseURI;

  /**
   * @dev Contract constructor.
   * @param _name A descriptive name for a collection of NFTs.
   * @param _symbol An abbreviated name for NFTokens.
   * @param _baseURI String representing base RFC 3986 URI.
   */
  constructor(
    string memory _name,
    string memory _symbol,
    string memory _baseURI
  )
  {
    nftName = _name;
    nftSymbol = _symbol;
    baseURI = _baseURI;
  }

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

    /**
   * @dev A distinct URI (RFC 3986) for a given NFT.
   * @param _tokenId Id for which we want uri.
   * @return URI of _tokenId.
   */
  function _tokenURI(
    uint256 _tokenId
  )
    internal
    override
    view
    returns (string memory)
  {
    return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, _uint2str(_tokenId))) : "";
  }

  /**
   * @dev Helper function that changes uint to string representation.
   * @return str String representation.
   */
  function _uint2str(
    uint256 _i
  )
    internal
    pure
    returns (string memory str)
  {
    if (_i == 0) {
      return "0";
    }
    uint256 j = _i;
    uint256 length;
    while (j != 0) {
      length++;
      j /= 10;
    }
    bytes memory bstr = new bytes(length);
    uint256 k = length;
    j = _i;
    while (j != 0) {
      bstr[--k] = bytes1(uint8(48 + j % 10));
      j /= 10;
    }
    str = string(bstr);
  }
}
