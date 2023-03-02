// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Mapping { // same as dict but NO iterations and NO get-size
    
    // key (string, uint, bool) => value (anything)
    mapping(address => uint) public map;

    function setAddress(address _addr, uint _i) public { // address of the wallet
        map[_addr] = _i;
    }

    function getAddress(address _addr) public view returns(uint) {
        return map[_addr];
    }

    function removeAddress(address _addr) public {
        delete map[_addr]; // if not exist then it returns 0
    }

    struct Movie {
        string movie; 
        string director;
    }

    mapping (uint => Movie) movies;

    function addMovie(uint id, string memory title, string memory director) public {
        movies[id] = Movie(title, director);
    }

    // nested mapping
    mapping(address => mapping(uint => Movie)) public publicMovies;

    function addMovie2Address(uint id, string memory title, string memory director) public {
        publicMovies[msg.sender][id] = Movie(title, director);
    } 
}