// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {DegenToken} from "../src/Degen.sol";

contract DegenTokenTest is Test {
    DegenToken public token;

    address owner = makeAddr("owner");
    address tester = makeAddr("tester");

    function setUp() public {
        vm.startPrank(owner);
        token = new DegenToken();
        vm.stopPrank();
    }

    function testMint() public {
        vm.prank(owner);
        token.mint(tester, 100);
        assertEq(token.balanceOf(tester), 100);
    }

    function testCreateRedeem() public {
        vm.prank(owner);
        token.createRedeem("testItem", 100);
        assertEq(token.showRedeem(1).owner, owner);
        assertEq(token.showRedeem(1).name, "testItem");
        assertEq(token.showRedeem(1).amount, 100);
    }


    function testTransfer() public {
        vm.startPrank(owner);
        token.mint(owner, 100);
        token.transferTokens(tester, 10);
        assertEq(token.balanceOf(tester), 10);
        assertEq(token.balanceOf(owner), 90);
    }

    function testBurn() public {
        vm.startPrank(owner);
        token.mint(owner, 100);
        token.burnTokens(10);
        assertEq(token.balanceOf(owner), 90);
    }

    function testBurnFailIfBalanceIsInsuficient() public {
        vm.startPrank(owner);
        token.mint(owner, 100);
        vm.expectRevert("Insufficient balance");
        token.burnTokens(101);
    }

    function testRedeem() public {
        vm.startPrank(owner);
        token.mint(owner, 200);
        token.createRedeem("testItem", 100);
        token.redeem(1);
        vm.stopPrank();

        assertEq(token.balanceOf(owner), 200);
    }
}