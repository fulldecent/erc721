import { expect } from "chai";
import { network } from "hardhat";

describe("nf-token-metadata", function () {
  let nfToken, owner, bob, ethers;
  const id1 = 1;
  const uri1 = "http://nibbstack.com/1";

  beforeEach(async () => {
    ({ ethers } = await network.create());
    const nftContract = await ethers.getContractFactory(
      "NFTokenMetadataTestMock",
    );
    nfToken = await nftContract.deploy("Foo", "F");
    [owner, bob] = await ethers.getSigners();
    await nfToken.waitForDeployment();
  });

  it("correctly checks all the supported interfaces", async function () {
    expect(await nfToken.supportsInterface("0x80ac58cd")).to.equal(true);
    expect(await nfToken.supportsInterface("0x5b5e139f")).to.equal(true);
    expect(await nfToken.supportsInterface("0x780e9d63")).to.equal(false);
  });

  it("returns the correct contract name", async function () {
    expect(await nfToken.name()).to.equal("Foo");
  });

  it("returns the correct contract symbol", async function () {
    expect(await nfToken.symbol()).to.equal("F");
  });

  it("correctly mints a NFT", async function () {
    expect(await nfToken.connect(owner).mint(bob.address, id1, uri1)).to.emit(
      nfToken,
      "Transfer",
    );
    expect(await nfToken.balanceOf(bob.address)).to.equal(1);
    expect(await nfToken.tokenURI(id1)).to.equal(uri1);
  });

  it("throws when trying to get URI of invalid NFT ID", async function () {
    await expect(nfToken.tokenURI(id1)).to.be.revertedWith("003002");
  });

  it("correctly burns a NFT", async function () {
    await nfToken.connect(owner).mint(bob.address, id1, uri1);
    expect(await nfToken.connect(owner).burn(id1)).to.emit(nfToken, "Transfer");
    expect(await nfToken.balanceOf(bob.address)).to.equal(0);
    await expect(nfToken.ownerOf(id1)).to.be.revertedWith("003002");
    expect(await nfToken.checkUri(id1)).to.equal("");
  });
});
