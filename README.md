# Uniswap v4 Sepolia Deployer

Uniswap v4 comes with the `Deployers.sol` helper contract that we have extensively used in our tests. However, using that to deploy to an actual network like Sepolia will not work and fails with "No previous offset" errors inside a script.

`Deployers` unfortunately cannot be used inside a script to deploy to Sepolia, so we must do that deployment ourselves. Please see `script/V4Deployer.s.sol` for a simple example. You can run it like this:

```sh
forge script script/V4Deployer.s.sol --rpc-url <rpc_url> --private-key <private_key> --broadcast
```
