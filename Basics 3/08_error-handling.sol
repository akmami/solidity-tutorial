// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract ErrorHandling {

    bool public sunny = true;
    bool umbrella = false;
    uint finalCalc = 0;

    function solarCalc() public {
        require(sunny, "In order to use solar power, it should be sunny!");
        internalTestUnits();
        finalCalc += 3;
    }

    function internalTestUnits() public view {
        assert(finalCalc + 3 != 6);
    }

    function changeWeather() public {
        sunny = !sunny;
    }

    function getCalc() public view returns(uint) {
        return finalCalc;
    }

    function bringUmbrella() public {
        if (!sunny) {
            umbrella = true;
        } else {
            umbrella = false;
            revert("No need to bring an umbrealla today!");
        }
    }

    function withdraw() public payable returns(bool) {
        uint amount = pendi
    }
}