# ERC-721 Token Reference Implementation Bug Bounty

*Bug bounty process and how you can get rewarded for finding issues with the ERC-721 Token Reference Implementation.*

:star: No programming experience is required.

Previous round of this bounty program: [v1, ended 2018-07-16](https://github.com/fulldecent/erc721/issues/46).

## Leaderboard

Thank you to all researchers, these are the accepted findings from this bounty program:

| Bug report | Severity     | Researcher     |
| ---------- | ------------ | -------------- |
| #242       | Low severity | @sam-at-luther |

## Sponsors

**Sponsor this bug bounty if you support ERC-721**. This means you will commit to paying researchers with new eligible findings. [Contact us](https://x.com/intent/tweet?text=%40fulldecent%20) if interested. Thank you.

This bounty program is sponsored by:

* William Entriken

## Scope

We appreciate all suggestions for this contract, for operations, and for ERC-721 in general, and will take them into consideration.

* Only the end-user contracts (`src/contracts/**/*.sol`) are **in scope**.
* Only the latest released version of this project is **in scope**.
* Social engineering, XKCD#538 attacks, bringing down Mainnet/Infura are **out of scope**.
* Using a version of Solidity older than the latest version ([they don't support it](https://github.com/argotorg/solidity/security#supported-versions)) or other dependencies which their vendors no longer support is **out of scope**.

## Sensitivity

For all **in scope** items, the following items can be **eligible findings**:

* Overflow or break parts of the implementation
* Steal ownership of a token
* Give a token to somebody else and double-spend it or revert it to your control
* Any undocumented and unintuitive behavior
* Typos

These are ineligible findings:

* Style guide conformance is not an eligible finding. The style guide for this project and the Solidity style guide disagree, so right now conformance is impossible. We intend to update our style guide (and possibly update the Solidity style guide) and later add this conformance back as an eligible finding for this bounty program.

We are inspired by the Chinese idiom 一字千金.

## Rules and rewards

* Findings that have previously been published as issues or pull requests to this project, or are already disclosed to the sponsors, are not eligible for rewards (a corollary: the sponsors are ineligible for rewards).
* [GitHub Issues](https://github.com/fulldecent/erc721/issues) is the only way to report issues and request rewards.
* The lead sponsor has complete and final judgment on the eligibility and scoring of findings.
* This program is governed under the laws of the United States, if there is a party that we are unable to pay due to trade embargoes or other restrictions, then we won't pay. But we are happy to discuss alternate arrangements.

We classify findings into severity based on likelihood and impact. We are inspired by the [OWASP risk rating](https://community.owasp.org/OWASP_Risk_Rating_Methodology) model.

|               | Low likelihood  | Medium likelihood | High likelihood  |
| ------------- | --------------- | ----------------- | ---------------- |
| High impact   | Medium severity | High severity     | Highest severity |
| Medium impact | Low severity    | Medium severity   | High severity    |
| Low impact    | *Notable*       | Low severity      | Medium severity  |

Examples of impact:

* *High impact* — steal a token from someone else, impersonate the contract owner
* *Medium impact* — cause metadata to fail so that the wrong data goes on the blockchain, or waste 5,000 gas or more in a transaction (no less than an `SSTORE`) (ignoring transfer-to-self and no-op transactions)
* *Low impact* — cause a transaction counterparty that carefully reads the contract documentation to make a mistake on some edge case type of transaction
* *Notable* — typos, missing comments

Examples of likelihood:

* *High likelihood* — affects all users of the smart contract performing a certain function
* *Medium likelihood* — affects a number of end users in a scenario that actually happens naturally in production deployments
* *Low likelihood* — hurts two end users only if they are cooperating together to hurt themselves
* *Notable* — affects developers and grammarians but not end-users

Rewards:

* **Highest severity** — full payout of the remaining bug bounty (up to 1 ETH)
* **High severity** — partial payout of the remaining bug bounty (up to 0.5 ETH)
* **Medium severity** — partial payout of the remaining bug bounty (up to 0.1 ETH)
* Low severity and notable — no cash payout
* Every accepted problem report will also receive
  * Mentioned in [this thread in a leaderboard](#leaderboard).
  * Public acknowledgement personally from Will on X.
  * *(Would you like to offer swag, and cash consideration here from your project as a sponsor? Contact us.)*

* The cumulative limit for payout of this bounty is USD 3,000.

How to win:

* Be descriptive and detailed when describing your issue.
* Include a reproducible test case in our test suite, if applicable.
* Fix it — recommend a way to solve the problem.

Rules for bounty sponsor:

* We will respond quickly to your questions.
* We will adjudicate all prizes quickly.

## More questions

* Are you recommending [*full disclosure*](https://en.wikipedia.org/wiki/Full_disclosure_(computer_security)) as a best practice?
  * Yes. [Well known losses](https://github.com/ethereum/EIPs/issues/223) due to problems with ERC-20 have exceeded [hundreds of millions USD](https://github.com/ethereum/EIPs/issues/223). The best defense we can offer to the community is to be transparent when issues come. The following are two references on this topic to explore further.
  * Schneier, Bruce. ["Damned Good Idea"](https://www.schneier.com/essay-146.html). CSO Online. Retrieved 29 April 2013.
  * Heiser, Jay (January 2001). ["Exposing Infosecurity Hype"](https://web.archive.org/web/20060328012516/http://infosecuritymag.techtarget.com/articles/january01/columns_curmudgeons_corner.shtml). *Information Security Mag*. TechTarget. Archived from [the original](http://infosecuritymag.techtarget.com/articles/january01/columns_curmudgeons_corner.shtml) on 28 March 2006. Retrieved 29 April 2013.
  * [:star: Star this repo](https://github.com/fulldecent/erc721/) if you are using this code. Surely you would want to know of any bugs as soon as possible.
  * If you prefer to send a bug report privately so that a fix can be developed concurrently with the announcement, contact the sponsors through mutually trusted contacts, IYKYK. This project does not publish direct contact information. Direct outreach to sponsors by new contacts will not be accepted.

* Will things change during the bounty program?
  * Yes, we are seeking sponsors and will add additional prizes here if that happens.
  * Yes, we will update the code and redeploy the contract. So, click [:star: STAR and :eye: WATCH](https://github.com/fulldecent/erc721/) above on this repo for updates.

* Taxes?
  * If you earn so much money that applicable law requires you to complete a tax form, then we will ask you to do so. This whole program is subject to the laws of the United States.
* I read to the bottom of the file.
  * That's not even a question. Good, you're the type of person we're seeking. Here's a hint, you can see the [CryptoKitties bounty program](https://github.com/axiomzen/cryptokitties-bounty) and [Su Squares bounty program](https://github.com/su-squares/ethereum-contract) and everything that happened there. They were a great inspiration for this bounty.

## Thank you

Thank you for your interest in the ERC-721 Token Reference Implementation, for reading to the end of this file and for reading our code. Even if you don't find any problems, we'd love to [hear your thoughts](https://x.com/intent/tweet?text=%40fulldecent%20).
