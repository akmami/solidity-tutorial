// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

interface UniswapV2Factory {
    // https://docs.uniswap.org/contracts/v2/reference/smart-contracts/factory#getpair
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    // https://docs.uniswap.org/contracts/v2/reference/smart-contracts/pair#getreserves
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract MyContract {

    /* factory address */
    // https://docs.uniswap.org/contracts/v2/reference/smart-contracts/factory#code
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;

    /* currencies */
    // https://etherscan.io/token/0x6b175474e89094c44da98b954eedeac495271d0f
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    // https://etherscan.io/token/0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReserveTokens() external view returns(uint112, uint112) {
        address pair_address = UniswapV2Factory(factory).getPair(dai, weth);
        (uint112 reserve0, uint112 reserve1,) = UniswapV2Pair(pair_address).getReserves();
        return (reserve0, reserve1);
    }
}