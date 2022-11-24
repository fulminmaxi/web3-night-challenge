// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "src/Bank.sol";

contract BankDeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new Bank();
    }
}
