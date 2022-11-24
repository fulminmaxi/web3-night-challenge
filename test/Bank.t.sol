// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "src/Bank.sol";

contract BankTest is Test {
    Bank public bank;

    function setUp() public {
        bank = new Bank();
    }

    function testDeposit() public {
        uint256 previousBankBalance = address(bank).balance;
        bank.deposit{value: 100 ether}();
        uint256 newBankBalance = address(bank).balance;
        assertEq(newBankBalance, previousBankBalance + 100 ether);
        assertEq(bank.balanceOf(address(this)), 100 ether);
    }

    function testWithdraw() public {
        uint256 previousBankBalance = address(bank).balance;
        bank.deposit{value: 100 ether}();
        bank.withdraw();
        uint256 newBankBalance = address(bank).balance;
        assertEq(newBankBalance, previousBankBalance);
        assertEq(bank.balanceOf(address(this)), 0);
    }

    fallback() external payable {}
}
