CREATE DATABASE pogopi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use pogopi;

CREATE TABLE abilitie
(
    id             INT(3) UNSIGNED,
    generation     INT(1) UNSIGNED,
    lang           VARCHAR(3),
    description    VARCHAR(255),
    name           VARCHAR(30)
);

CREATE TABLE evolve
(
    id               INT(4) UNSIGNED,
    pokemon_id       INT(4) UNSIGNED,
    level            INT(1) UNSIGNED,
    to_id            INT(4) UNSIGNED
);

CREATE TABLE fastmove
(
    id            INT(3) UNSIGNED PRIMARY KEY,
    damage        INT(3) UNSIGNED,
    dps           DECIMAL(3,1) UNSIGNED,
    energy        INT(3) UNSIGNED,
    eps           DECIMAL(3,1) UNSIGNED,
    move_duration INT(4) UNSIGNED, -- in ms
    sound_fx      varchar(20),
    type          INT(4) UNSIGNED  -- fk with table type
);

CREATE TABLE fastmove_name
(
    fastmove_id    INT(3) UNSIGNED,
    lang            VARCHAR(3),
    name            VARCHAR(20)
);

CREATE TABLE mainmove
(
    id            INT(3) UNSIGNED PRIMARY KEY,
    damage        INT(3) UNSIGNED,
    dps           DECIMAL(3,1) UNSIGNED,
    energy        INT(3) UNSIGNED,
    move_duration INT(4) UNSIGNED, -- in ms
    slot          INT(1) UNSIGNED,
    sound_fx      varchar(20),
    type          INT(4) UNSIGNED  -- fk with table type
);

CREATE TABLE mainmove_name
(
    mainmove_id     INT(3) UNSIGNED,
    lang            VARCHAR(3),
    name            VARCHAR(20)
);

CREATE TABLE pokeball
(
    id INT(3) UNSIGNED PRIMARY KEY,
    generation INT(2) UNSIGNED,
    name VARCHAR(20),
    img VARCHAR(20)
);

CREATE TABLE pokedex
(
    id   INT(2) UNSIGNED PRIMARY KEY,
    name VARCHAR(10)
);

CREATE TABLE pokemon
(
    id              INT(4) UNSIGNED PRIMARY KEY,
    attack          INT(3) UNSIGNED,
    attack_spe      INT(3) UNSIGNED,
    base_experience INT(3) UNSIGNED,
    base_happiness  INT(3) UNSIGNED,
    buddy_walk      INT(2) UNSIGNED,
    capture_rate    INT(5) UNSIGNED, -- max 10 000
    defense         INT(3) UNSIGNED,
    defense_spe     INT(3) UNSIGNED,
    escape_rate     INT(4) UNSIGNED, -- percent
    evolve          INT(4) UNSIGNED,
    go_attack       INT(3) UNSIGNED,
    go_defense      INT(3) UNSIGNED,
    go_hp           INT(4) UNSIGNED,
    go_pc           INT(4) UNSIGNED,
    go_stamina      INT(4) UNSIGNED,
    height          DECIMAL(5,2) UNSIGNED,
    hp              INT(4) UNSIGNED,
    image           VARCHAR(20),
    `order`         INT(4) UNSIGNED, -- is index
    pokedex         INT(2) UNSIGNED, -- fk table pokedex, is index
    scream          VARCHAR(20),
    speed           INT(4) UNSIGNED,
    weight          DECIMAL(5,2) UNSIGNED
);

/*
 create index for fastest query
 */
CREATE INDEX idx_pokedex
    ON pokemon (pokedex);

CREATE INDEX idx_order
    ON pokemon (`order`);

CREATE TABLE pokemon_abilitie
(
    pokemon_id  INT(4) UNSIGNED,
    abilitie_id INT(3) UNSIGNED
);

CREATE TABLE pokemon_fastmove
(
    pokemon_id   INT(4) UNSIGNED,
    fastmove_id  INT(3) UNSIGNED
);

CREATE TABLE pokemon_mainmove
(
    pokemon_id   INT(4) UNSIGNED,
    mainmove_id  INT(3) UNSIGNED
);

CREATE TABLE pokemon_name
(
    pokemon_id INT(4) UNSIGNED,
    lang       VARCHAR(5),
    name       VARCHAR(25)
);

CREATE TABLE pokemon_type
(
    pokemon_id   INT(4) UNSIGNED,
    type_id      INT(2) UNSIGNED
);

CREATE TABLE pokemon_specie
(
    pokemon_id INT(4) UNSIGNED,
    lang       VARCHAR(5),
    specie     VARCHAR(25)
);

CREATE TABLE team
(
    id               INT(2) UNSIGNED PRIMARY KEY,
    color            VARCHAR(10),
    emblem_flat_png  VARCHAR(30),
    emblem_png       VARCHAR(30),
    emblem_svg       VARCHAR(30),
    player           VARCHAR(10),
    image            VARCHAR(30)
);

CREATE TABLE team_name
(
    team_id     INT(2) UNSIGNED,
    lang        VARCHAR(3),
    name        VARCHAR(20)
);

CREATE TABLE type
(
    id      INT(2) UNSIGNED PRIMARY KEY,
    img     VARCHAR(20)
);

CREATE TABLE type_name
(
    type_id     INT(2) UNSIGNED,
    lang        VARCHAR(3),
    name        VARCHAR(15)
);

CREATE TABLE version
(
    version DECIMAL(3,1) UNSIGNED PRIMARY KEY
);

/*
 create relation between tables
 */
ALTER TABLE fastmove
    ADD FOREIGN KEY (type) REFERENCES type(id),
    ADD FOREIGN KEY (id) REFERENCES pokemon_fastmove(fastmove_id);

ALTER TABLE mainmove
    ADD FOREIGN KEY (type) REFERENCES type(id),
    ADD FOREIGN KEY (id) REFERENCES pokemon_mainmove(mainmove_id);

ALTER TABLE pokemon
    ADD FOREIGN KEY (pokedex) REFERENCES pokedex(id);

ALTER TABLE pokemon_abilitie
    ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);

ALTER TABLE pokemon_fastmove
    ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);

ALTER TABLE pokemon_mainmove
    ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);

ALTER TABLE pokemon_name
    ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);

ALTER TABLE pokemon_type
    ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);

ALTER TABLE pokemon_specie
    ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);
