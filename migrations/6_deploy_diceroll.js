const DiceRoll = artifacts.require('DiceRoll');
const UnifiedLiquidityPool = artifacts.require("UnifiedLiquidityPool");
const GBTS = artifacts.require("GBTS");
const RandomNumberGenerator = artifacts.require("RandomNumberGenerator");

module.exports = async function (deployer) {

    GBTS_instance = await GBTS.deployed();
    ULP_instance = await UnifiedLiquidityPool.deployed();
    RNG_instance = await RandomNumberGenerator.deployed();

    await deployer.deploy(
        DiceRoll,
        ULP_instance.address, // Deployed ULP Address
        GBTS_instance.address, // Deployed GBTS Address
        RNG_instance.address, // // Deployed RNG Address
    );

    return;
};
