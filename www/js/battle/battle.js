'use strict';

class Battle {
    constructor() {
        this.computer = null; // the IA
        this.player = null; // the player's pokemon
    }

    getPokemonPlayer(url) {
        let pk = this;
        let xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = function () {
            pk.player = JSON.parse(this.responseText);
        };

        xmlhttp.open("GET", url, false);
        xmlhttp.send();
    }
    getPokemonComputer(url) {
        let pk = this;
        let xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = function () {
            pk.computer = JSON.parse(this.responseText);
        };

        xmlhttp.open("GET", url, false);
        xmlhttp.send();
    }
    renderComputer() {
        document.querySelector('.computer-pokemon img').src = this.computer.image;
        document.querySelector('.computer-pokemon').classList.add('from-right');
    }
    renderPlayer() {
        document.querySelector('.player-pokemon img').src = this.player.image;
        document.querySelector('.player-pokemon').classList.add('from-left');
    }
    run() {
        let url = document.querySelector('[data-url]');
        url = url.getAttribute('data-url');

        let pokemonPlayer = document.querySelector('[data-id]');
        pokemonPlayer = pokemonPlayer.getAttribute('data-id');

        let playerUrl;
        playerUrl = url + 'pokemon/full/id/' + pokemonPlayer;

        this.getPokemonPlayer(playerUrl);
        this.renderPlayer();

        let pokemonComputer = randomNumber(1, 649);
        let computerUrl;
        computerUrl = url + 'pokemon/full/id/' + pokemonComputer;

        this.getPokemonComputer(computerUrl);
        this.renderComputer();

    }
}
