// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Counter.sol";

contract ContractTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter(10);
    }

    function testGetCount() public {
        int256 value = counter.getCount();
        assertEq(value, 10);
        emit log_named_int("Count is: ", value);
    }

    function testIncrementCount() public {
        counter.incrementCount(5);
        int256 value = counter.getCount();
        assertEq(value, 15);
        emit log_named_int("Count is: ", value);
    }

    function testDecrementCount() public {
        counter.decrementCount(5);
        int256 value = counter.getCount();
        assertEq(value, 5);
        emit log_named_int("Count is: ", value);
    }
}
