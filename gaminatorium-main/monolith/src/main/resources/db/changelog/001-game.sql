--liquibase formatted sql

--changeSet Slawek84PL:001_1
CREATE TABLE IF NOT EXISTS game
(
    id                 BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    title              VARCHAR(30),
    description        VARCHAR(200),
    game_tags          VARCHAR(255),
    game_service_link  VARCHAR(255),
    source_code_link   VARCHAR(255),
    moderation_status  SMALLINT,
    max_players        INTEGER                                 NOT NULL,
    times_played_total BIGINT                                  NOT NULL,
    release_date       date,
    last_time_played   TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_game PRIMARY KEY (id)
);

--changeSet Slawek84PL:001_2
CREATE TABLE IF NOT EXISTS game_rating
(
    id           BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    score        INTEGER                                 NOT NULL,
    comment      VARCHAR(255),
    posting_date date,
    game_id      BIGINT,
    CONSTRAINT pk_game_rating PRIMARY KEY (id)
);

ALTER TABLE game_rating
    ADD CONSTRAINT FK_GAME_RATING_ON_GAME FOREIGN KEY (game_id) REFERENCES game (id);

--changeSet Slawek84PL:001_3
CREATE TABLE IF NOT EXISTS game_active
(
    id              BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    current_players INTEGER                                 NOT NULL,
    started_at      TIMESTAMP WITHOUT TIME ZONE,
    game_id         BIGINT,
    CONSTRAINT pk_game_active PRIMARY KEY (id)
);

ALTER TABLE game_active
    ADD CONSTRAINT FK_GAME_ACTIVE_ON_GAME FOREIGN KEY (game_id) REFERENCES game (id);

--changeSet Slawek84PL:001_4
insert into game (title, description,
                  game_tags, game_service_link,
                  max_players, release_date, times_played_total)
VALUES ('Makao', 'A fun multiplayer card game.',
        'card multi turn-based', 'https://www.gaminatorium.eu/games/makao.png',
        4, '2024-06-01', 0);

--changeSet Slawek84PL:001_5
insert into game (title, description, game_service_link,
                  max_players, moderation_status, release_date, times_played_total)
VALUES ('Mahjong', 'An addictve solo puzzle game.','https://www.gaminatorium.eu/games/mahjong.png',
        1, 1, '2024-05-31', 0);

--changeSet Slawek84PL:001_6
insert into game (title, description, game_service_link,
                  max_players, moderation_status, release_date, times_played_total)
VALUES ('Tictactoe', 'Play this classic game with a friend or against a computer.','https://www.gaminatorium.eu/games/tictactoe.png',
        2, 1, '2024-06-15', 17);

--changeSet Slawek84PL:001_7
INSERT INTO game_rating (score, comment, posting_date, game_id)
VALUES (4, 'spoko', '2024-06-01', 1),
    (1, 'shitty', '2024-06-05', 2),
    (2, 'boring', '2024-06-06', 3),
    (3, 'mediocre', '2024-06-11', 1),
    (4, 'nothing special', '2024-06-12', 2),
    (8, 'okay', '2024-06-15', 1),
    (9, 'nice', '2024-06-16', 3),
    (9, 'exciting', '2024-06-01', 2),
    (8, 'great', '2024-06-08', 1),
    (10, 'awesome', '2024-06-07', 3),
    (4, 'spoko', '2024-06-06', 2);


