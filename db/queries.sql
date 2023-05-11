set schema 'hurricane_track';

-- Get all hurricanes that passed through the charleston area
SELECT DISTINCT h.sid, name
FROM hurricane_instance
INNER JOIN hurricane h on h.sid = hurricane_instance.sid
WHERE lat BETWEEN (32.776566 - 1) AND (32.776566 + 1)
  AND lon BETWEEN (-79.930923 - 1) AND (-79.930923 + 1); -- plus/minus 50ish miles

-- Get the strongest wind speed for each hurricane
SELECT sid, max(wmo_wind)
FROM hurricane_instance
WHERE wmo_wind IS NOT NULL
GROUP BY sid;

-- Find all hurricanes that made landfall
SELECT DISTINCT hurricane.SID, Name
FROM hurricane_track.hurricane
INNER JOIN hurricane_track.hurricane_instance hi on hurricane.sid = hi.sid
WHERE landfall = 0;

-- Get the average pressure for a particular hurricane
SELECT sid, avg(wmo_pres)
FROM hurricane_instance
WHERE sid = '2020045S15075'
GROUP BY sid;

-- Get all hurricanes in a particular basin
SELECT DISTINCT h.sid, h.name
FROM hurricane_instance
         INNER JOIN hurricane h on hurricane_instance.sid = h.sid
WHERE basin = 'SI';
