# Bond Tokenization Smart Contract

# Bond Struct
The Bond struct represents a bond with the following properties:

`principal`: The principal amount of the bond.
`couponRate`: The coupon rate of the bond.
`maturity`: The maturity date of the bond.
`couponFrequency`: The frequency at which coupon payments are made.
`issuer`: The address of the bond issuer.
`whitelist`: A mapping of addresses to check if they are whitelisted investors.
`kycApproved`: A mapping of addresses to check if they have passed KYC.
`highRiskCustomers`: A mapping of addresses to check if they are high-risk customers.
`couponPayments`: A mapping of addresses to track the coupon payments made to investors.

# Constructor
The constructor initializes the bond with default values. You can set the initial values according to your requirements.

addToWhitelist Function
The addToWhitelist function adds an investor to the whitelist. Only the bond issuer can add investors to the whitelist.

removeFromWhitelist Function
The removeFromWhitelist function removes an investor from the whitelist. Only the bond issuer can remove investors from the whitelist.

approveKYC Function
The approveKYC function approves the KYC (Know Your Customer) for an investor. Only the bond issuer can approve KYC.

rejectKYC Function
The rejectKYC function rejects the KYC for an investor. Only the bond issuer can reject KYC.

addHighRiskCustomer Function
The addHighRiskCustomer function adds a customer to the list of high-risk customers. Only the bond issuer can add high-risk customers.

removeHighRiskCustomer Function
The removeHighRiskCustomer function removes a customer from the list of high-risk customers. Only the bond issuer can remove high-risk customers.

payCoupon Function
The payCoupon function allows whitelisted investors to receive coupon payments. It checks if the bond has matured and if it's a coupon payment date. If the conditions are met, it calculates the coupon amount based on the principal and coupon rate, and updates the coupon payment for the investor.

repayPrincipal Function
The repayPrincipal function allows whitelisted investors to receive the principal amount at the bond maturity. It checks if the bond has matured and transfers the principal amount to the investor.

settleBond Function
The settleBond function allows whitelisted investors to settle the bond. It checks if the bond has matured, calculates the coupon payment and principal amount for the investor, and transfers the total amount to the investor. It also resets the coupon payment for the investor.
