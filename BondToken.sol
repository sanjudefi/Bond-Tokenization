// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BondToken {
    struct Bond {
        uint256 principal;
        uint256 couponRate;
        uint256 maturity;
        uint256 couponFrequency;
        address issuer;
        mapping(address => bool) whitelist;
        mapping(address => bool) kycApproved;
        mapping(address => bool) highRiskCustomers;
        mapping(address => uint256) couponPayments;
    }

    Bond public bond;

    constructor() {
        bond.principal = 100000; // Principal amount in a defined currency
        bond.couponRate = 5; // 5% coupon rate
        bond.maturity = block.timestamp + 365 days; // Maturity in 1 year
        bond.couponFrequency = 30 days; // Coupon payment every 30 days
        bond.issuer = msg.sender; // Issuer's address
    }

    modifier onlyWhitelisted() {
        require(bond.whitelist[msg.sender], "You are not allowed to perform this action.");
        require(bond.kycApproved[msg.sender], "KYC not approved.");
        require(!bond.highRiskCustomers[msg.sender], "High-risk customers are not allowed.");
        _;
    }

    function addToWhitelist(address investor) external {
        require(msg.sender == bond.issuer, "Only the issuer can add investors to the whitelist.");
        bond.whitelist[investor] = true;
    }

    function removeFromWhitelist(address investor) external {
        require(msg.sender == bond.issuer, "Only the issuer can remove investors from the whitelist.");
        bond.whitelist[investor] = false;
    }

    function approveKYC(address investor) external {
        require(msg.sender == bond.issuer, "Only the issuer can approve KYC.");
        bond.kycApproved[investor] = true;
    }

    function rejectKYC(address investor) external {
        require(msg.sender == bond.issuer, "Only the issuer can reject KYC.");
        bond.kycApproved[investor] = false;
    }

    function addHighRiskCustomer(address customer) external {
        require(msg.sender == bond.issuer, "Only the issuer can add high-risk customers.");
        bond.highRiskCustomers[customer] = true;
    }

    function removeHighRiskCustomer(address customer) external {
        require(msg.sender == bond.issuer, "Only the issuer can remove high-risk customers.");
        bond.highRiskCustomers[customer] = false;
    }

    function payCoupon() external onlyWhitelisted {
        require(block.timestamp < bond.maturity, "Bond has already matured.");
        require(block.timestamp % bond.couponFrequency == 0, "Not a coupon payment date.");

        // Perform coupon payment logic here
        uint256 couponAmount = (bond.principal * bond.couponRate) / 100;
        require(couponAmount > 0, "Coupon amount is zero.");

        // Update coupon payment for the investor
        bond.couponPayments[msg.sender] += couponAmount;
    }

    function repayPrincipal() external onlyWhitelisted {
        require(block.timestamp >= bond.maturity, "Bond has not yet matured.");

        // Perform principal repayment logic here
        uint256 principalAmount = bond.principal;
        require(principalAmount > 0, "Principal amount is zero.");

        // Transfer the principal amount to the investor
        address payable investor = payable(msg.sender);
        require(address(this).balance >= principalAmount, "Insufficient balance in the contract.");
        investor.transfer(principalAmount);
    }

    function settleBond() external onlyWhitelisted {
        require(block.timestamp >= bond.maturity, "Bond has not yet matured.");

        // Perform settlement logic here
        address payable investor = payable(msg.sender);
        uint256 couponPayment = bond.couponPayments[msg.sender];
        uint256 principalAmount = bond.principal;

        require(couponPayment + principalAmount <= address(this).balance, "Insufficient balance in the contract.");

        // Transfer the coupon payment and principal amount to the investor
        investor.transfer(couponPayment + principalAmount);

        // Reset coupon payment for the investor
        bond.couponPayments[msg.sender] = 0;
    }
}
