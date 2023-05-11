set schema 'hurricane_track';

-- Get all hurricanes that passed through the charleston area
SELECT DISTINCT h.sid, name
FROM hurricane_instance
    INNER JOIN hurricane h USING (sid)
WHERE lat BETWEEN (32.776566 - 1) AND (32.776566 + 1)
  AND lon BETWEEN (-79.930923 - 1) AND (-79.930923 + 1); -- plus/minus 50ish miles

-- Get the strongest wind speed for each hurricane
SELECT hi.sid, h.name, max(wmo_wind)
FROM hurricane_instance hi
    INNER JOIN hurricane h USING(sid)
WHERE wmo_wind IS NOT NULL
GROUP BY hi.sid, h.name;

-- Find all hurricanes that made landfall
SELECT DISTINCT hurricane.SID, Name
FROM hurricane
    INNER JOIN hurricane_instance USING (sid)
WHERE landfall = 0;

-- Get the average pressure for a particular hurricane
SELECT sid, avg(wmo_pres)
FROM hurricane_instance
WHERE sid = '2020045S15075'
GROUP BY sid;

-- Get all hurricanes in a particular basin
SELECT DISTINCT h.sid, h.name
FROM hurricane_instance
    INNER JOIN hurricane h USING (sid)
WHERE basin = 'SI';

-- Get all hurricanes that were reported by both the USA agency and the Tokyo agency
SELECT DISTINCT sid
FROM hurricane h
    INNER JOIN usa_agency_report uar USING (sid)
    INNER JOIN tokyo_agency_report tar USING(sid);
