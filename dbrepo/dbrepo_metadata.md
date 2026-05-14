# DBRepo metadata for T2.1

Use this text when creating the DBRepo database and table descriptions.

## Database title
Predicting the Market Value of Football Players Using Various Factors - Input Data Schema

## Database description
This database contains a normalized relational representation of two reused football-player valuation datasets. The purpose is to support a reproducible data science workflow for predicting football player market values from player attributes, club context, season information, performance variables, and valuation variables. The database separates shared entities such as players, clubs, positions, nationalities, seasons, and source datasets from observation tables to reduce duplication and keep the design close to Third Normal Form.

## Correct publisher / rights wording
The original source datasets were published by Mendeley Data. The student group only reuses and republishes metadata/derived structures for a course experiment and must not be listed as the original publisher or rights owner of the input data.

## Source dataset 1
Title: Forward football player valuation
Original creators: Hugo Briseño; José Carlos Rivera
Publisher: Mendeley Data
Version: V1
DOI: 10.17632/cgc33scxg7.1
DOI URL: https://doi.org/10.17632/cgc33scxg7.1
Licence: CC BY 4.0
Licence URL: https://creativecommons.org/licenses/by/4.0/
Source file used in this course project: soccerplayers.xlsx / Dataset soccerplayers_short.xlsx

## Source dataset 2
Title: Transfer Value Determinants
Original creator: Ronald Nisanov
Publisher: Mendeley Data
Version: V2
DOI: 10.17632/3btg6ptc7b.2
DOI URL: https://doi.org/10.17632/3btg6ptc7b.2
Licence: CC BY 4.0
Licence URL: https://creativecommons.org/licenses/by/4.0/
Source file used in this course project: Nisanov_final_data.xlsx / Nisanov_final_data_short.xlsx

## Table descriptions

### source_dataset
Stores metadata about the reused external datasets, including original creators, publisher, DOI, licence, and source file name. This table keeps provenance information explicit and avoids incorrectly treating the student group or TU Wien as the original publisher of the input data.

### player
Stores unique football player names used across the input datasets. This avoids repeating player names in every observation row.

### club
Stores unique football club names used across the input datasets. This avoids repeating club names in every observation row.

### position
Stores unique football playing positions, used mainly by the transfer-value dataset.

### nationality
Stores unique nationality labels, used mainly by the transfer-value dataset.

### season
Stores the season year represented in the transfer-value dataset sheets.

### forward_player_valuation
Stores observations from the Forward football player valuation dataset. Each row links one player and club to age, market value, rank, European participation flag, match statistics, minutes, and Instagram follower information.

### transfer_value_observation
Stores observations from the Transfer Value Determinants dataset. Each row links a player, club, position, nationality, and season to performance variables, height, and start/end/delta market-value variables.
