CREATE DATABASE pogopiV2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use pogopiV2;

CREATE TABLE abilitie
(
    id             INT(3) UNSIGNED PRIMARY KEY,
    descriptions   TEXT, -- indexed array lang->text
    names          VARCHAR(255) -- indexed array lang->text
);

CREATE TABLE fast_move
(
    id            INT(3) UNSIGNED PRIMARY KEY,
    damage        INT(3) UNSIGNED,
    dps           DECIMAL(3,1) UNSIGNED,
    energy        INT(3) UNSIGNED,
    eps           DECIMAL(3,1) UNSIGNED,
    move_duration INT(4) UNSIGNED, -- in ms
    names         VARCHAR(255), -- indexed array lang->text
    sound_fx      varchar(20),
    type          INT(4) UNSIGNED  -- fk with table type
);

CREATE TABLE main_move
(
    id            INT(3) UNSIGNED PRIMARY KEY,
    damage        INT(3) UNSIGNED,
    dps           DECIMAL(3,1) UNSIGNED,
    energy        INT(3) UNSIGNED,
    move_duration INT(4) UNSIGNED, -- in ms
    names         VARCHAR(255), -- indexed array lang->text
    slot          INT(1) UNSIGNED,
    sound_fx      varchar(20),
    type          INT(4) UNSIGNED  -- fk with table type
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
    abilities       VARCHAR(20), -- array of table abilitie's key
    attack          INT(3) UNSIGNED,
    attack_max      INT(3) UNSIGNED,
    attack_spe      INT(3) UNSIGNED,
    base_experience INT(3) UNSIGNED,
    base_happiness   INT(3) UNSIGNED,
    buddy_walk      INT(2) UNSIGNED,
    capture_rate    INT(5) UNSIGNED, -- max 10 000
    defense         INT(3) UNSIGNED,
    defense_max     INT(3) UNSIGNED,
    defense_spe     INT(3) UNSIGNED,
    escape_rate     INT(4) UNSIGNED, -- percent
    fast_moves      VARCHAR(20), -- array of table fast_move's key
    height          DECIMAL(5,2) UNSIGNED,
    hp              INT(4) UNSIGNED,
    hp_max          INT(4) UNSIGNED,
    image           VARCHAR(20),
    main_moves      VARCHAR(20), -- array of table main_move's key
    names           VARCHAR(255), -- indexed array lang->text
    `order`         INT(4) UNSIGNED, -- is index
    pc_max          INT(4) UNSIGNED,
    pokedex         INT(2) UNSIGNED, -- fk table pokedex, is index
    scream          VARCHAR(20),
    species         VARCHAR(255), -- indexed array lang->text
    speed           INT(4) UNSIGNED,
    stamina_max     INT(4) UNSIGNED,
    types          VARCHAR(20), -- array of table type's key
    weight          DECIMAL(5,2) UNSIGNED
);

/*
 create index for fastest query
 */
CREATE INDEX idx_pokedex
    ON pokemon (pokedex);

CREATE INDEX idx_order
    ON pokemon (`order`);

CREATE TABLE team
(
    id         INT(2) UNSIGNED PRIMARY KEY,
    colors     VARCHAR(255), -- indexed array lang->text
    img_player VARCHAR(30),
    img_pngXl  VARCHAR(30),
    img_pngXs  VARCHAR(30),
    img_svg    VARCHAR(30),
    names      VARCHAR(255), -- indexed array lang->text
    players    VARCHAR(10) -- indexed array lang->text
);

CREATE TABLE type
(
    id      INT(2) UNSIGNED PRIMARY KEY,
    img     VARCHAR(20),
    names   VARCHAR(255) -- indexed array lang->text
);

CREATE TABLE version
(
    version DECIMAL(3,1) UNSIGNED PRIMARY KEY
);

/*
 create relation between tables
 */
ALTER TABLE fast_move
    ADD FOREIGN KEY (type) REFERENCES type(id);

ALTER TABLE main_move
    ADD FOREIGN KEY (type) REFERENCES type(id);

ALTER TABLE pokemon
    ADD FOREIGN KEY (pokedex) REFERENCES pokedex(id);
