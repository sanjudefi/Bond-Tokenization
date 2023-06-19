# Bond Tokenization Smart Contract

This smart contract implements the functionality for tokenizing a bond on the Ethereum blockchain.

## Contract Details

- `BondToken` contract represents a tokenized bond.
- The bond has a principal amount, coupon rate, maturity date, coupon frequency, and an issuer address.
- The contract supports functionalities such as adding investors to the whitelist, approving KYC, adding high-risk customers, paying coupon, repaying principal, and settling the bond.
- Only the issuer can perform certain actions, and investors must be whitelisted and KYC-approved to participate.

## Contract Functions

### `addToWhitelist(address investor)`

- Allows the issuer to add an investor to the whitelist.
- Only the issuer can call this function.

### `removeFromWhitelist(address investor)`

- Allows the issuer to remove an investor from the whitelist.
- Only the issuer can call this function.

### `approveKYC(address investor)`

- Allows the issuer to approve KYC for an investor.
- Only the issuer can call this function.

### `rejectKYC(address investor)`

- Allows the issuer to reject KYC for an investor.
- Only the issuer can call this function.

### `addHighRiskCustomer(address customer)`

- Allows the issuer to add a high-risk customer.
- Only the issuer can call this function.

### `removeHighRiskCustomer(address customer)`

- Allows the issuer to remove a high-risk customer.
- Only the issuer can call this function.

### `payCoupon()`

- Allows whitelisted investors to receive coupon payments.
- Investors can only receive coupon payments before the bond's maturity date and on coupon payment dates.

### `repayPrincipal()`

- Allows whitelisted investors to receive the principal amount at the bond's maturity.
- Investors can only receive the principal amount after the bond's maturity date.

### `settleBond()`

- Allows whitelisted investors to settle the bond by receiving the coupon payments and principal amount.
- Investors can only settle the bond after the bond's maturity date.

## Contract Deployment

- Deploy the `BondToken` contract on the Ethereum blockchain using a suitable development environment or framework.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.
