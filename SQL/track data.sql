select * from spotify_tracks.trackdata
order by popularity desc;      
 
  -- sample of the data that we are going to be using (Kendrick Lamar's most popular tracks in the data set)
 Select artists, album_name, track_name, popularity, duration_ms, explicit, danceability, energy, loudness, liveness
 FROM spotify_tracks.trackdata
 where artists like '%kendrick lamar%' 
 -- group by artists
 order by 4 desc;

-- showing the artist who have the most popular songs
 Select artists, MAX(popularity) as highest_popularity
 FROM spotify_tracks.trackdata
 group by artists
 order by 2 desc;
 
 -- showing which genre has the highest average popularity
 select avg(popularity) as average_popularity, track_genre
 from spotify_tracks.trackdata
 group by track_genre
 order by average_popularity desc;
 
 -- create a new table for genre for average loudness, energy, danceability, speechiness, acousticness, instrumentalness, liveness, valence and tempo
 -- tableau radar chart visualization
INSERT INTO spotify_tracks.genres
select track_genre, AVG(popularity) as avg_popularity, ABS(AVG(loudness * 10)) as avg_loudness, AVG(danceability * 100) as avg_danceability, AVG(energy * 100) as avg_energy, AVG(speechiness * 100) as avg_speechiness, 
	AVG(acousticness * 100) as avg_acousticness, AVG(instrumentalness * 100) as avg_instrumentalness, AVG(liveness * 100) as avg_liveness, AVG(valence * 100) as avg_valence, AVG(tempo) as avg_tempo
FROM spotify_tracks.trackdata
group by track_genre;

-- select * from spotify_tracks.genres;

-- the following table takes the data from spotify_tracks.genres and converts into percentile, bringing a better visualizations for the radar chart.
INSERT INTO spotify_tracks.radar_chart
select distinct Genres, percent_rank() over (order by popularity) as Popularity, percent_rank() over (order by loudness) as Loudness, percent_rank() over (order by danceability) as Danceability, 
	percent_rank() over (order by energy) as Energy, percent_rank() over (order by speechiness) as Speechiness, percent_rank() over (order by acousticness) as Acousticness, percent_rank() over 
    (order by instrumentalness) as Instrumentalness, percent_rank() over (order by liveness) as Liveness, percent_rank() over (order by valence) as Valence, percent_rank() over (order by tempo) as Tempo
from spotify_tracks.genres
order by popularity desc;

select * from spotify_tracks.radar_chart;

-- create a new table with artists, album name, track name, popularity, duration, explicit, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, time signature, and genre (everything except track id and id).
-- create a view for later visualizations and connect to tableau
-- upload to github 