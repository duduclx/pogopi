'use strict';

class Battle {
    constructor() {
        this.computer = null; // the IA's pokemon
        this.player = null; // the player's pokemon

        this.computerAttack = null;
        this.computerDamage = null;

        // player properties
        this.hp = 0; // used player hp
        this.energy = 0; // used energy for enable mainmove

        // player attacks
        this.fastAttack = this.battlePlayerFastMove.bind(this);
        this.fastMove = document.querySelector('.computer-pokemon img');
        this.fastMoveDelay = null;

        this.mainAttack = this.battlePlayerMainMove.bind(this);
        this.mainMove = document.querySelector('.player-attack img');

        //score
        this.playerScore = 0; // displayed player score
        this.computerScore = 0; // displayed computer score
    }

    battleInitialize() {
        // hide counter
        this.counterReset();

        // enable fastmove aka player attacks
        this.fastMove.addEventListener('click', this.fastAttack);

        // computer auto attack
        // calculate IA damage
        let computerDamage = (this.computer.fastmove[0].damage / 2) * (this.computer.stats_go.attack / this.player.stats_go.defense) + 1;
        this.computerDamage = computerDamage.toFixed(2);
        // computer attack loop
        this.computerAttack = setInterval(this.battleIa.bind(this), this.computer.fastmove[0].duration);
    }

    battleEnd(who) {
        switch (who) {
            case 'computer':
                // update winner content
                document.querySelector('.winner img').src = this.computer.image;
                document.querySelector('.winner span').textContent = this.computer.name['fr'];
                // update displayed score
                this.scoreAddToComputer();
                // show message
                this.battleEndNext();
                break;
            case 'player':
                // update winner content
                document.querySelector('.winner img').src = this.player.image;
                document.querySelector('.winner span').textContent = this.player.name['fr'];
                // update displayed score
                this.scoreAddToPlayer();
                // show message
                this.battleEndNext();
                break;
        }
    }

    battleEndNext() {
        // save result
        this.scoreSave(this.playerScore, this.computerScore);
        // hide arena
        document.querySelector('.arena').classList.add('hide');
        // show winner
        document.querySelector('.result').classList.remove('hide');
        // listen replay button
        document.querySelector('.replay').addEventListener('click', this.battleReplay.bind(this));
    }

    battleIa() {
        // substract computer attack
        this.hp -= this.computerDamage;
        // change player hp
        document.querySelector('.player-hp').value = this.hp;
        // check if IA have won
        if(this.hp < 0) {
            this.destroy();
            this.battleEnd('computer');
        }
    }

    battlePlayerEnableFastMove() {
        this.fastMove.addEventListener('click', this.fastAttack);
    }

    battlePlayerFastMove() {
        // disable fastmove for the move_duration
        this.fastMove.removeEventListener('click', this.fastAttack);
        this.fastMoveDelay = window.setTimeout(this.battlePlayerEnableFastMove.bind(this), this.player.fastmove[0].duration);

        // play sounds attack on click
        let audio = new Audio(this.player.fastmove[0].sound);
        audio.play();

        // damage
        let damage = (this.player.fastmove[0].damage / 2) * (this.player.stats_go.attack / this.computer.stats_go.defense) + 1;
        // change computer pv
        this.computer.stats_go.hp = this.computer.stats_go.hp - damage.toFixed(2);
        // change energy
        this.energy += parseInt(this.player.fastmove[0].energy);

        // allow main attack if fully charged
        if(this.energy >= this.player.mainmove[0].energy) {
            this.mainMove.classList.add('player-attack-enable');
            this.mainMove.addEventListener('click', this.mainAttack);
        }

        // update displayed value
        document.querySelector('.computer-hp').value = this.computer.stats_go.hp;

        if(this.computer.stats_go.hp < 0) {
            this.destroy();
            this.battleEnd('player');
        }
    }

    battlePlayerMainMove() {
        //disable fastmove for the mainmove duration
        this.fastMove.removeEventListener('click', this.fastAttack);
        this.fastMoveDelay = window.setTimeout(this.battlePlayerEnableFastMove.bind(this), this.player.mainmove[0].duration);

        let audio = new Audio(this.player.mainmove[0].sound);
        audio.play();

        // damage = player.main_move_1_damage / 2 * player.attack / computer.defense + 1
        let damage = (this.player.mainmove[0].damage / 2) * (this.player.stats_go.attack / this.computer.stats_go.defense) + 1;
        // change computer pv
        this.computer.stats_go.hp = this.computer.stats_go.hp - damage.toFixed(2);
        // change energy
        this.energy = 0;

        // remove listener
        this.mainMove.removeEventListener('click', this.mainAttack);
        this.mainMove.classList.remove('player-attack-enable');

        // update displayed value
        document.querySelector('.computer-hp').value = this.computer.stats_go.hp;

        if(this.computer.stats_go.hp < 0) {
            this.destroy();
            this.battleEnd('player');
        }
    }

    battleReplay() {
        // hide result
        document.querySelector('.result').classList.add('hide');
        // rebuild presentation screen
        document.querySelector('.action').classList.remove('invisible');
        document.querySelector('.presentation').classList.remove('hide');
        // render pokemons
        this.renderPlayerArena();
        this.randomComputer();

        document.querySelector('.versus-separator').classList.add('from-opacity');

    }

    counter() {
        // play success sound
        //let audio = new Audio('soundfx/se_go_trade_demo_line.wav');
        //audio.play();

        let counter = document.querySelector('.counter');
        counter.classList.remove('hide');

        let counterThree = document.querySelector('.fw-counter-3');
        counterThree.classList.add('counter-animation');

        window.setTimeout(this.counterAnimationTwo, 1000);
        window.setTimeout(this.counterAnimationOne, 2000);
        window.setTimeout(this.counterAnimationGo, 3000);
        window.setTimeout(this.battleInitialize.bind(this), 4000);
    }

    counterAnimationTwo() {
        let counterThree = document.querySelector('.fw-counter-3');
        counterThree.classList.remove('counter-animation');
        counterThree.classList.add('hide');

        let counterTwo = document.querySelector('.fw-counter-2');
        counterTwo.classList.add('counter-animation');
    }

    counterAnimationOne() {
        let counterTwo = document.querySelector('.fw-counter-2');
        counterTwo.classList.remove('counter-animation');
        counterTwo.classList.add('hide');

        let counterOne = document.querySelector('.fw-counter-1');
        counterOne.classList.add('counter-animation');
    }

    counterAnimationGo() {
        let counterOne = document.querySelector('.fw-counter-1');
        counterOne.classList.remove('counter-animation');
        counterOne.classList.add('hide');

        let counterZero = document.querySelector('.fw-counter-0');
        counterZero.classList.add('counter-animation');
    }

    counterReset() {
        document.querySelector('.counter').classList.add('hide');
        document.querySelector('.fw-counter-3').classList.remove('hide');
        document.querySelector('.fw-counter-2').classList.remove('hide');
        document.querySelector('.fw-counter-1').classList.remove('hide');
        document.querySelector('.fw-counter-0').classList.remove('counter-animation');
    }

    destroy() {
        // prevent error if mainMove used near the end
        this.mainMove.classList.remove('player-attack-enable');

        // remove computer auto attack
        clearInterval(this.computerAttack);
        // listeners may have settimeout
        window.clearTimeout(this.fastMoveDelay);
        // remove listeners
        this.fastMove.removeEventListener('click', this.fastAttack);
        this.mainMove.removeEventListener('click', this.mainAttack);
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

    onClickGo() {
        // reset presentation classlist
        document.querySelector('.versus-separator').classList.remove('from-opacity');
        document.querySelector('.presentation-computer').classList.remove('from-right');
        document.querySelector('.presentation-player').classList.remove('from-left');

        // add battle arena
        document.querySelector('.presentation').classList.add('hide');
        document.querySelector('.arena').classList.remove('hide');

        // hide go button but should change it to stop/new
        document.querySelector('.action').classList.add('invisible');

        // start counter, then battle
        this.counter();
    }

    randomComputer() {
        let url = document.querySelector('[data-url]');
        url = url.getAttribute('data-url');

        let pokemonComputer = randomNumber(1, 649);
        let computerUrl;
        computerUrl = url + 'pokemon/full/id/' + pokemonComputer;

        this.getPokemonComputer(computerUrl);
        this.renderComputerPresentation();
        this.renderComputerArena();
    }

    renderComputerArena() {
        let out = "";
        this.computer.type.forEach( (data) => {
            out += '<img src="' + data.img
                + '" alt="' + data.name.fr
                + '" title="' + data.name.fr
                + '" >';
        });
        document.querySelector('.computer-type').innerHTML = out;

        document.querySelector('.computer-name').textContent = this.computer.name['fr'];
        document.querySelector('.computer-hp').value = this.computer.stats_go.hp;
        document.querySelector('.computer-hp').max = this.computer.stats_go.hp;

        document.querySelector('.computer-pokemon img').src = this.computer.image;
    }

    renderComputerPresentation() {
        document.querySelector('.presentation-computer-img img').src = this.computer.image;
        document.querySelector('.presentation-computer-name').textContent = this.computer.name['fr'].toUpperCase();
        let out = "";
        this.computer.type.forEach( (data) => {
            out += '<img src="' + data.img
                + '" alt="' + data.name.fr
                + '" title="' + data.name.fr
                + '" >';
        });
        document.querySelector('.presentation-computer-type').innerHTML = out;
        document.querySelector('.presentation-computer-pc').textContent = 'PC ' + this.computer.stats_go.pc;
        document.querySelector('.presentation-computer').classList.add('from-right');
    }

    renderPlayerArena() {
        // get default value if replay
        this.hp = this.player.stats_go.hp;
        this.energy = 0;

        let out = "";
        this.player.type.forEach( (data) => {
            out += '<img src="' + data.img
                + '" alt="' + data.name.fr
                + '" title="' + data.name.fr
                + '" >';
        });
        document.querySelector('.player-type').innerHTML = out;

        document.querySelector('.player-name').textContent = this.player.name['fr'];
        document.querySelector('.player-hp').value = this.hp;
        document.querySelector('.player-hp').max = this.player.stats_go.hp;

        document.querySelector('.player-pokemon img').src = this.player.image;

        //console.log(this.player);
        document.querySelector('.player-attack img').src = this.player.mainmove[0].type.img;
    }

    renderPlayerPresentation() {
        document.querySelector('.presentation-player img').src = this.player.image;
        document.querySelector('.presentation-player-name').textContent = this.player.name['fr'].toUpperCase();
        let out = "";
        this.player.type.forEach( (data) => {
            out += '<img src="' + data.img
                + '" alt="' + data.name.fr
                + '" title="' + data.name.fr
                + '" >';
        });
        document.querySelector('.presentation-player-type').innerHTML = out;
        document.querySelector('.presentation-player-pc').textContent = 'PC ' + this.player.stats_go.pc;
        document.querySelector('.presentation-player').classList.add('from-left');
    }

    scoreAddToComputer() {
        this.computerScore = this.computerScore + 1;
        document.querySelector('.computer-score span').textContent = this.computerScore;
    }

    scoreAddToPlayer() {
        this.playerScore = this.playerScore + 1;
        document.querySelector('.player-score span').textContent = this.playerScore;
    }

    scoreLoad() {
        let data = {
            player: 0,
            computer: 0,
        };
        if(loadDataFromDomStorage('pogo')) {
            data = loadDataFromDomStorage('pogo');
        }
        this.playerScore = data.player;
        this.computerScore = data.computer;
        // update displayed score
        this.scoreShow();
    }

    scoreSave(player, computer) {
        // save result into localStorage
        let data = null;
        if(loadDataFromDomStorage('pogo')) {
            data = loadDataFromDomStorage('pogo');
        }

        let result = {
            player : player,
            computer : computer,
        };

        data = result;
        saveDataToDomStorage('pogo', data);
    }

    scoreShow() {
        document.querySelector('.player-score span').textContent = this.playerScore;
        document.querySelector('.computer-score span').textContent = this.computerScore;
    }

    /*
    PROGRAM START HERE
     */
    run() {
        this.scoreLoad();

        let url = document.querySelector('[data-url]');
        url = url.getAttribute('data-url');

        let pokemonPlayer = document.querySelector('[data-id]');
        pokemonPlayer = pokemonPlayer.getAttribute('data-id');

        let playerUrl;
        playerUrl = url + 'pokemon/full/id/' + pokemonPlayer;

        this.getPokemonPlayer(playerUrl);
        this.renderPlayerPresentation();
        this.renderPlayerArena();

        this.randomComputer();

        document.querySelector('.versus-separator').classList.add('from-opacity');

        // listen the go button
        document.querySelector('.action').addEventListener('click', this.onClickGo.bind(this));
    }
}
