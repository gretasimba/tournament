-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Create DB
 
CREATE DATABASE tournament;
\c tournament;
DROP TABLE players, matches CASCADE;
 
CREATE TABLE players (player_name text, player_id serial primary key);
CREATE TABLE matches (match_winner integer references Players (player_id), match_loser integer references Players (player_id),match_id serial primary key);
CREATE OR REPLACE VIEW winners_v AS
    select player_id, player_name, count(match_id) number_of_winns
    from players left outer join matches on player_id = match_winner
    group by player_id, player_name
    order by count(match_id) desc;
CREATE OR REPLACE VIEW losers_v AS
    select player_id, player_name, count(match_id) number_of_loss
    from players left outer join matches on player_id = match_loser
    group by player_id, player_name
    order by count(match_id) desc;
CREATE OR REPLACE VIEW totals_v AS
select w.player_id, w.player_name,(number_of_loss + number_of_winns) total_match, w.number_of_winns
from winners_v as w inner join losers_v as l on l.player_id = w.player_id
order by number_of_winns DESC;

