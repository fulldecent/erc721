// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

/**
 * @notice Based on:
 * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol
 * Requires EIP-1052.
 * @dev Utility library of inline functions on addresses.
 */
library AddressUtils
{
  /**
   * @dev Hash of an account that exists and has no code.
   * Equal to: keccak256("").
   */
  bytes32 internal constant EMPTY_ACCOUNT_HASH = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;

  /**
   * @dev Returns whether the target address is a contract.
   * @param _addr Address to check.
   * @return addressCheck True if _addr is a contract, false if not.
   */
  function isContract(
    address _addr
  )
    internal
    view
    returns (bool addressCheck)
  {
    // codehash is 0 for an account that does not exist yet, including a
    // contract that is still running its constructor.
    bytes32 codehash = _addr.codehash;
    addressCheck = (codehash != 0x0 && codehash != EMPTY_ACCOUNT_HASH);
  }

}
