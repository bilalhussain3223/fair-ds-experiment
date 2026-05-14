-- FAIR Data Science Part 3 - WP2 T2.1
-- Project: Predicting the Market Value of Football Players Using Various Factors
-- Role A deliverable: DBRepo schema design
-- Dialect: MariaDB/MySQL-style SQL, suitable for a DBRepo MariaDB container.
-- Purpose: 3NF schema for the two reused football-player valuation input datasets.
-- Source datasets:
--   1) Briseño, Hugo; Rivera, José Carlos (2024), Forward football player valuation, Mendeley Data, V1, DOI: 10.17632/cgc33scxg7.1, CC BY 4.0.
--   2) Nisanov, Ronald (2025), Transfer Value Determinants, Mendeley Data, V2, DOI: 10.17632/3btg6ptc7b.2, CC BY 4.0.

CREATE TABLE source_dataset (
    source_dataset_id SMALLINT PRIMARY KEY,
    dataset_title VARCHAR(255) NOT NULL,
    original_creators VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    version_label VARCHAR(50),
    doi VARCHAR(100) NOT NULL UNIQUE,
    doi_url VARCHAR(255) NOT NULL,
    license_name VARCHAR(100) NOT NULL,
    license_url VARCHAR(255) NOT NULL,
    source_filename VARCHAR(255),
    notes TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE player (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(255) NOT NULL,
    UNIQUE KEY uq_player_name (player_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE club (
    club_id INT AUTO_INCREMENT PRIMARY KEY,
    club_name VARCHAR(255) NOT NULL,
    UNIQUE KEY uq_club_name (club_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE position (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL,
    UNIQUE KEY uq_position_name (position_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE nationality (
    nationality_id INT AUTO_INCREMENT PRIMARY KEY,
    nationality_name VARCHAR(100) NOT NULL,
    UNIQUE KEY uq_nationality_name (nationality_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE season (
    season_year SMALLINT PRIMARY KEY,
    notes VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Normalized table for dataset 1: Forward football player valuation.
-- Original columns represented: nombre, VALUE, VALUE_R, AGE, TEAM, EUROPA,
-- MATCHES, GOALS, ASSISTS, MPG, MINUTES, INSTA.
CREATE TABLE forward_player_valuation (
    forward_valuation_id INT AUTO_INCREMENT PRIMARY KEY,
    source_dataset_id SMALLINT NOT NULL,
    player_id INT NOT NULL,
    club_id INT NOT NULL,
    original_player_name VARCHAR(255) NOT NULL,
    original_team_name VARCHAR(255) NOT NULL,
    player_age_years SMALLINT,
    market_value_mln DECIMAL(12,3),
    value_rank SMALLINT,
    plays_in_europe BOOLEAN,
    matches_played INT,
    goals INT,
    assists INT,
    minutes_per_goal INT,
    minutes_played INT,
    instagram_followers_mln DECIMAL(12,3),
    CONSTRAINT fk_forward_source_dataset FOREIGN KEY (source_dataset_id) REFERENCES source_dataset(source_dataset_id),
    CONSTRAINT fk_forward_player FOREIGN KEY (player_id) REFERENCES player(player_id),
    CONSTRAINT fk_forward_club FOREIGN KEY (club_id) REFERENCES club(club_id),
    UNIQUE KEY uq_forward_source_player_club (source_dataset_id, player_id, club_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Normalized table for dataset 2: Transfer Value Determinants.
-- Original columns represented: player_name, position, nationality, age_then,
-- age_now, club_name, club_performance, relegation, success_or_not, total_games,
-- assists, penalty_kicks, total_minutes, total_goals, height, start_value,
-- end_value, delta_value, value_0_mln, value_end_mln, value_delta_mln, season.
-- The 2019 sheet contains club_performance/relegation/success_or_not; later sheets
-- may not contain these columns, therefore they are nullable.
CREATE TABLE transfer_value_observation (
    transfer_observation_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    source_dataset_id SMALLINT NOT NULL,
    player_id INT NOT NULL,
    position_id INT NOT NULL,
    nationality_id INT NOT NULL,
    club_id INT NOT NULL,
    season_year SMALLINT NOT NULL,
    original_player_name VARCHAR(255) NOT NULL,
    original_position_name VARCHAR(100) NOT NULL,
    original_nationality_name VARCHAR(100) NOT NULL,
    original_club_name VARCHAR(255) NOT NULL,
    age_then_years SMALLINT,
    age_now_years SMALLINT,
    club_performance SMALLINT NULL,
    relegation BOOLEAN NULL,
    success_or_not SMALLINT NULL,
    total_games INT,
    assists INT,
    penalty_kicks INT,
    total_minutes INT,
    total_goals INT,
    height_cm DECIMAL(6,2),
    start_value_eur DECIMAL(16,2),
    end_value_eur DECIMAL(16,2),
    delta_value_eur DECIMAL(16,2),
    value_start_mln DECIMAL(12,3),
    value_end_mln DECIMAL(12,3),
    value_delta_mln DECIMAL(12,3),
    CONSTRAINT fk_transfer_source_dataset FOREIGN KEY (source_dataset_id) REFERENCES source_dataset(source_dataset_id),
    CONSTRAINT fk_transfer_player FOREIGN KEY (player_id) REFERENCES player(player_id),
    CONSTRAINT fk_transfer_position FOREIGN KEY (position_id) REFERENCES position(position_id),
    CONSTRAINT fk_transfer_nationality FOREIGN KEY (nationality_id) REFERENCES nationality(nationality_id),
    CONSTRAINT fk_transfer_club FOREIGN KEY (club_id) REFERENCES club(club_id),
    CONSTRAINT fk_transfer_season FOREIGN KEY (season_year) REFERENCES season(season_year),
    UNIQUE KEY uq_transfer_source_player_club_season_position (source_dataset_id, player_id, club_id, season_year, position_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO source_dataset (
    source_dataset_id, dataset_title, original_creators, publisher, version_label,
    doi, doi_url, license_name, license_url, source_filename, notes
) VALUES
(1, 'Forward football player valuation', 'Hugo Briseño; José Carlos Rivera', 'Mendeley Data', 'V1',
 '10.17632/cgc33scxg7.1', 'https://doi.org/10.17632/cgc33scxg7.1', 'CC BY 4.0',
 'https://creativecommons.org/licenses/by/4.0/', 'soccerplayers.xlsx',
 'Reused external source dataset. The group republishes/uses the data but is not the original publisher or rights holder.'),
(2, 'Transfer Value Determinants', 'Ronald Nisanov', 'Mendeley Data', 'V2',
 '10.17632/3btg6ptc7b.2', 'https://doi.org/10.17632/3btg6ptc7b.2', 'CC BY 4.0',
 'https://creativecommons.org/licenses/by/4.0/', 'Nisanov_final_data.xlsx',
 'Reused external source dataset. The group republishes/uses the data but is not the original publisher or rights holder.');

INSERT INTO season (season_year, notes) VALUES
(2019, 'Season sheet in Transfer Value Determinants'),
(2020, 'Season sheet in Transfer Value Determinants'),
(2021, 'Season sheet in Transfer Value Determinants'),
(2022, 'Season sheet in Transfer Value Determinants'),
(2023, 'Season sheet in Transfer Value Determinants');
