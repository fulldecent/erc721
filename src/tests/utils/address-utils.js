import { expect } from "chai";
import { network } from "hardhat";

describe("address utils", function () {
  let addressUtils, owner, ethers;

  beforeEach(async () => {
    ({ ethers } = await network.create());
    const addressUtilsContract =
      await ethers.getContractFactory("AddressUtilsMock");
    addressUtils = await addressUtilsContract.deploy();
    [owner] = await ethers.getSigners();
    await addressUtils.waitForDeployment();
  });

  it("correctly checks account", async function () {
    expect(await addressUtils.isContract(owner.address)).to.equal(false);
  });

  it("correctly checks smart contract", async function () {
    const contract = await ethers.getContractFactory("NFTokenTestMock");
    const nfToken = await contract.deploy();
    await nfToken.waitForDeployment();
    expect(await addressUtils.isContract(await nfToken.getAddress())).to.equal(
      true,
    );
  });
});
