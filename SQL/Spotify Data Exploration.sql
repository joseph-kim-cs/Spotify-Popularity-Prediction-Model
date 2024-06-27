CREATE SCHEMA `spotify_tracks` ;

CREATE TABLE spotify_tracks.trackdata (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `track_id` VARCHAR(100) NULL,
  `artists` VARCHAR(250) NULL,
  `album_name` VARCHAR(250) NULL,
  `track_name` VARCHAR(250) NULL,
  `popularity` INT(10) NULL,
  `duration_ms` INT(10) NULL,
  `explicit` VARCHAR(20) NULL,
  `danceability` float NULL,
  `energy` float NULL,
  `key` INT(10) NULL,
  `loudness` float NULL,
  `mode` INT(10) NULL,
  `speechiness` float NULL,
  `acousticness` float NULL,
  `instrumentalness` float NULL,
  `liveness` float NULL,
  `valence` float NULL,
  `tempo` float NULL,
  `time_signature` INT(10) NULL,
  `track_genre` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));
	
-- data loading from csv file
LOAD DATA LOCAL INFILE 'C:/Users/Joseph/Desktop/python/dataset.csv'
INTO TABLE spotify_tracks.trackdata
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE spotify_tracks.genres;
-- create a new table for genre for average loudness, energy, danceability, speechiness, acousticness, instrumentalness, liveness, valance and tempo
-- DONE

CREATE TABLE spotify_tracks.genres (
  Genres nvarchar(255),
  popularity float4,
  loudness float4,
  energy float4, 
  danceability float4,
  speechiness float4,
  acousticness float4,
  instrumentalness float4, 
  liveness float4,
  valence float4,
  tempo float4
  );
  
  CREATE TABLE spotify_tracks.radar_chart (
  Genres nvarchar(255),
  popularity float4,
  loudness float4,
  energy float4, 
  danceability float4,
  speechiness float4,
  acousticness float4,
  instrumentalness float4, 
  liveness float4,
  valence float4,
  tempo float4
  );
