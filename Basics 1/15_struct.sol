// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Structs {

    struct Movie {
        string title;
        string director;
        uint movie_id;
    }

    Movie movie;

    constructor() {
        movie = Movie("Titanic", "Unknown", 1);
    }

    function setMovie(string memory title, string memory director, uint id) public {
        movie.title = title;
        movie.director = director;
        movie.movie_id = id;
    }

    function getMovie() public view returns (Movie memory) {
        return movie;
    }

    function setDefault() public {
        movie = Movie("Titanic", "Unknown", 1);
    }
    
}