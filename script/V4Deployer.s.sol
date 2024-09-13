// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {PoolManager} from "v4-core/PoolManager.sol";
import {PoolSwapTest} from "v4-core/test/PoolSwapTest.sol";
import {PoolModifyLiquidityTest} from "v4-core/test/PoolModifyLiquidityTest.sol";
import {PoolDonateTest} from "v4-core/test/PoolDonateTest.sol";
import {PoolTakeTest} from "v4-core/test/PoolTakeTest.sol";
import {PoolClaimsTest} from "v4-core/test/PoolClaimsTest.sol";

import "forge-std/console.sol";

contract V4Deployer is Script {
    function run() public {
        vm.startBroadcast();

        PoolManager manager = new PoolManager();
        console.log("Deployed PoolManager at", address(manager));
        PoolSwapTest swapRouter = new PoolSwapTest(manager);
        console.log("Deployed PoolSwapTest at", address(swapRouter));
        PoolModifyLiquidityTest modifyLiquidityRouter = new PoolModifyLiquidityTest(
                manager
            );
        console.log(
            "Deployed PoolModifyLiquidityTest at",
            address(modifyLiquidityRouter)
        );
        PoolDonateTest donateRouter = new PoolDonateTest(manager);
        console.log("Deployed PoolDonateTest at", address(donateRouter));
        PoolTakeTest takeRouter = new PoolTakeTest(manager);
        console.log("Deployed PoolTakeTest at", address(takeRouter));
        PoolClaimsTest claimsRouter = new PoolClaimsTest(manager);
        console.log("Deployed PoolClaimsTest at", address(claimsRouter));

        // Anything else you need to do like minting mock ERC20s or initializing a pool
        // you need to do directly here as well without using Deployers

        vm.stopBroadcast();
    }
}
