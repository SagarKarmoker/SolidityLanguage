// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// https://solidity-by-example.org/interface/
contract Counter{
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter{
    // in interface there is no need to implement the function
    // in interface function type must be external 
    // and there will be no constructor
    function count() external view returns(uint);
    
    function increment() external; 
}


contract MyContract{
    function incrementCount(address _counter) external{
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }
}

// uniswap 

interface UniSwapV2{
    // taking two address of two different token, returing their pair
    function getPair(address tokenA, address tokenB) external view returns (address);
}

interface UniSwapPair{
    function getReverse() external view returns(
        uint112 reverse0,
        uint112 reverse1,
        uint32 blockTimeStampLast
    );
}

contract UniSwap{
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReverse() external view returns(uint, uint){
        address pair = UniSwapV2(factory).getPair(dai, weth);
        (uint reverse0, uint reverse1, ) = UniSwapPair(pair).getReverse();

        return (reverse0, reverse1);
    }

}