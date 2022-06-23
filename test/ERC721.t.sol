// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/ERC721.sol";

contract ERC721Test is Test {
    ERC721 erc721;
    address jeff = address(0x1);
    address jane = address(0x2);

    function testMintToken() public {
        erc721 = new ERC721();
        erc721.mint(jeff, 0);
        address owner_of = erc721.ownerOf(0);
        assertEq(jeff, owner_of);
    }

    function testTransferToken() public {
        erc721 = new ERC721();
        erc721.mint(jeff, 0);
        vm.startPrank(jeff);
        erc721.safeTransferFrom(jeff, jane, 0);
        vm.stopPrank();
        address owner_of = erc721.ownerOf(0);
        assertEq(jane, owner_of);
    }

    function testGetBalance() public {
        erc721 = new ERC721();
        erc721.mint(jeff, 0);
        erc721.mint(jeff, 1);
        erc721.mint(jeff, 2);
        erc721.mint(jeff, 3);
        uint256 balance = erc721.balanceOf(jeff);
        assertEq(balance, 4);
    }

    function testOnlyOwnerBurn() public {
        erc721 = new ERC721();
        erc721.mint(jeff, 0);
        vm.startPrank(jane);
        vm.expectRevert("not owner of token");
        erc721.burn(0);
        vm.stopPrank();
    }
}
