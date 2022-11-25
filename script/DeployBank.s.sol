// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "src/Bank.sol";

contract BankDeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        Bank bank = new Bank();
        bank.deposit{value: 1 ether}();
    }
}
