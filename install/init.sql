CREATE DATABASE pogopi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use pogopi;

CREATE TABLE abilitie
(
    id             INT(3) UNSIGNED PRIMARY KEY,
    description_en varchar(255),
    description_fr varchar(255),
    name_en        varchar(20),
    name_fr        varchar(20)
);

CREATE TABLE fast_move
(
    id            INT(3) UNSIGNED PRIMARY KEY,
    damage        INT(3) UNSIGNED,
    dps           DECIMAL(3,1) UNSIGNED,
    energy        INT(3) UNSIGNED,
    eps           DECIMAL(3,1) UNSIGNED,
    move_duration INT(4) UNSIGNED, -- in ms
    name_en       VARCHAR(20),
    name_fr       VARCHAR(20),
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
    name_en       VARCHAR(20),
    name_fr       VARCHAR(20),
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
    height          DECIMAL(5,2) UNSIGNED,
    image           VARCHAR(20),
    name_en         VARCHAR(20),     -- is index
    name_fr         VARCHAR(20),     -- is index
    `order`         INT(4) UNSIGNED, -- is index
    pc_max          INT(4) UNSIGNED,
    pv              INT(4) UNSIGNED,
    pv_max          INT(4) UNSIGNED,
    scream          VARCHAR(20),
    specie_en       VARCHAR(20),
    specie_fr       VARCHAR(20),
    speed           INT(4) UNSIGNED,
    stamina_max     INT(4) UNSIGNED,
    weight          DECIMAL(5,2) UNSIGNED,
    abilitie_1      INT(3) UNSIGNED, -- fk table abilitie
    abilitie_2      INT(3) UNSIGNED, -- fk table abilitie
    abilitie_3      INT(3) UNSIGNED, -- fk table abilitie
    fast_move_1     INT(3) UNSIGNED, -- fk table fast_move
    fast_move_2     INT(3) UNSIGNED, -- fk table fast_move
    fast_move_3     INT(3) UNSIGNED, -- fk table fast_move
    main_move_1     INT(3) UNSIGNED, -- fk table main_move
    main_move_2     INT(3) UNSIGNED, -- fk table main_move
    main_move_3     INT(3) UNSIGNED, -- fk table main_move
    main_move_4     INT(3) UNSIGNED, -- fk table main_move
    pokedex         INT(2) UNSIGNED, -- fk table pokedex, is index
    type_1          INT(2) UNSIGNED, -- fk table type
    type_2          INT(2) UNSIGNED  -- fk table type
);

/*
 create index for fastest query
 */
CREATE INDEX idx_pokedex
    ON pokemon (pokedex);

CREATE INDEX idx_name_en
    ON pokemon (name_en);

CREATE INDEX idx_name_fr
    ON pokemon (name_fr);

CREATE INDEX idx_order
    ON pokemon (`order`);

CREATE TABLE team
(
    id         INT(2) UNSIGNED PRIMARY KEY,
    color_en   VARCHAR(10),
    color_fr   VARCHAR(10),
    img_player VARCHAR(30),
    img_pngXl  VARCHAR(30),
    img_pngXs  VARCHAR(30),
    img_svg    VARCHAR(30),
    name_en    VARCHAR(10),
    name_fr    VARCHAR(10),
    player_en  VARCHAR(10),
    player_fr  VARCHAR(10)
);

CREATE INDEX idx_name_en
    ON team (name_en);
CREATE INDEX idx_name_fr
    ON team (name_fr);
CREATE INDEX idx_color_en
    ON team (color_en);
CREATE INDEX idx_color_fr
    ON team (color_fr);

CREATE TABLE type
(
    id      INT(2) UNSIGNED PRIMARY KEY,
    img     VARCHAR(20),
    name_en VARCHAR(20),
    name_fr VARCHAR(20)
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
    ADD FOREIGN KEY (abilitie_1) REFERENCES abilitie(id),
    ADD FOREIGN KEY (abilitie_2) REFERENCES abilitie(id),
    ADD FOREIGN KEY (abilitie_3) REFERENCES abilitie(id),
    ADD FOREIGN KEY (fast_move_1) REFERENCES fast_move(id),
    ADD FOREIGN KEY (fast_move_2) REFERENCES fast_move(id),
    ADD FOREIGN KEY (fast_move_3) REFERENCES fast_move(id),
    ADD FOREIGN KEY (main_move_1) REFERENCES main_move(id),
    ADD FOREIGN KEY (main_move_2) REFERENCES main_move(id),
    ADD FOREIGN KEY (main_move_3) REFERENCES main_move(id),
    ADD FOREIGN KEY (main_move_4) REFERENCES main_move(id),
    ADD FOREIGN KEY (pokedex) REFERENCES pokedex(id),
    ADD FOREIGN KEY (type_1) REFERENCES type(id),
    ADD FOREIGN KEY (type_2) REFERENCES type(id);