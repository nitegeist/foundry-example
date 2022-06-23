// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    int256 private count;

    constructor(int256 _count) {
        count = _count;
    }

    function incrementCount(int256 _value) external {
        for (int256 i = 0; i < _value; i++) {
            count++;
        }
    }

    function decrementCount(int256 _value) external {
        for (int256 i = 0; i < _value; i++) {
            count--;
        }
    }

    function getCount() external view returns (int256) {
        return count;
    }
}
