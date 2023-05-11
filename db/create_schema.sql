DROP SCHEMA IF EXISTS hurricane_track CASCADE;
CREATE SCHEMA hurricane_track;
SET SCHEMA 'hurricane_track';

DROP TABLE IF EXISTS hurricane CASCADE;
CREATE TABLE hurricane (
    SID char(13) NOT NULL UNIQUE,
    Season int, /* year? */
    Number int,
    Name varchar(30) DEFAULT 'NOT_NAMED',
    PRIMARY KEY (SID)
);

INSERT INTO hurricane VALUES ('2020004S14122', 2020, 1, 'BLAKE');
INSERT INTO hurricane VALUES ('2020015S12170', 2020, 3, 'TINO');
INSERT INTO hurricane VALUES ('2020019S11063', 2020, 4);
INSERT INTO hurricane VALUES ('2020022S17043', 2020, 5, 'DIANE');
INSERT INTO hurricane VALUES ('2020034S17129', 2020, 9, 'DAMIEN');
INSERT INTO hurricane VALUES ('2020037S13163', 2020, 10, 'UESI');

DROP TABLE IF EXISTS hurricane_instance CASCADE;
CREATE TABLE hurricane_instance (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Basin char(2),
    Subbasin char(2),
    Nature char(2),
    WMO_wind int,
    WMO_pres int,
    WMO_agency varchar(30),
    Track_type varchar(30),
    Dist2Land int,
    Landfall int,
    Iflag char(14),
    Storm_speed int,
    Storm_dir int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane (SID)
);


INSERT INTO hurricane_instance VALUES ('2020004S14122', '1/4/2020  12:00:00 AM', -13.8, 122.2, 'SI', 'WA',
                                       'NR', 15, 1005, 'bom', 'main', 310, 310, '______O_______', 1, 238);
INSERT INTO hurricane_instance VALUES ('2020004S14122', '1/4/2020  3:00:00 AM', -13.8363, 122.14, 'SI', 'WA',
                                       'NR', null, null, null, 'main', 314, 314, '______P_______', null, null);
INSERT INTO hurricane_instance VALUES ('2020015S12170', '1/18/2020  3:00:00 PM', -22.1551, 188.065, 'SP', 'MM',
                                       'TS', null, null, null, 'main', 940, 940, 'P______I______', 207, 30);
INSERT INTO hurricane_instance VALUES ('2020019S11063', '1/21/2020  6:00:00 AM', -16.2, 66.9, 'SI', 'MM',
                                       'TS', null, null, null, 'main', 1054, 314, 'O_____________', 150, 30);
INSERT INTO hurricane_instance VALUES ('2020019S11063', '1/21/2020  9:00:00 AM', -16.8375, 67.1574, 'SI', 'MM',
                                       'TS', null, null, null, 'main', 1065, 1054, 'P_____________', 150, 30);
INSERT INTO hurricane_instance VALUES ('2020019S11063', '1/21/2020  12:00:00 PM', -17.4, 67.4, 'SI', 'MM',
                                       'TS', null, null, null, 'main', 1060, 1057, 'O_____________', 150, 30);
INSERT INTO hurricane_instance VALUES ('2020022S17043', '1/25/2020  9:00:00 PM', -22.3368, 65.3999, 'SI', 'WA',
                                       'TS', null, null, null, 'main', 818, 818, 'P____P________', 190, 32);
INSERT INTO hurricane_instance VALUES ('2020034S17129', '2/7/2020  6:00:00 AM', -18.15, 117, 'SI', 'WA',
                                       'TS', 65, 971, 'bom', 'main', 280, 257, 'O_____O_______', 165, 20);
INSERT INTO hurricane_instance VALUES ('2020037S13163', '2/12/2020  12:00:00 AM', -22.5667, 162.6, 'SP', 'MM',
                                       'TS', 65, 976, 'nadi', 'main', 272, 272, 'O_____O_______', 160, 20);
INSERT INTO hurricane_instance VALUES ('2020037S13163', '2/13/2020  12:00:00 AM', -27.4, 161.036, 'SP', 'MM',
                                       'TS', null, null, 'wellington', 'main', 732, 705, 'O_____O_O_____', 190, 30);


DROP TABLE IF EXISTS usa_agency_report CASCADE;
CREATE TABLE usa_agency_report (
    SID char(13) NOT NULL ,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    R34_NE int, R34_NW int, R34_SE int, R34_SW int,
    R50_NE int, R50_NW int, R50_SE int, R50_SW int,
    R64_NE int, R64_NW int, R64_SE int, R64_SW int,
    Poci int,
    Roci int,
    RMW int,
    Eye int,
    Gust int,
    Seahgt int,
    Searad_NE int, Searad_NW int, Searad_SE int, Searad_SW int,
    Atcf_ID char(8),
    Record char(1),
    Status char(2),
    SSHS int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

/* (sid, iso_time, lat, lon, wind, pres,
   R34_NE, R34_NW, R34_SE, R34_SW,
   R50_NE, R50_NW, R50_SE, R50_SW,
   R64_NE, R64_NW, R64_SE, R64_SW,
   poci, roci, rmw, eye, gust, seaght,
   Searad_NE, Searad_NW, Searad_SE, Searad_SW,
   atcf_id, record, status, sshs)*/
-- INSERT INTO usa_agency_report VALUES ('1980001S13173', '', );
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();
-- INSERT INTO usa_agency_report VALUES ();

DROP TABLE IF EXISTS tokyo_agency_report CASCADE;
CREATE TABLE tokyo_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Grade int,
    R30_dir int, R30_short int, R30_long int,
    R50_dir int, R50_short int, R50_long int,
    Tokyo_land int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();


DROP TABLE IF EXISTS cma_agency_report CASCADE;
CREATE TABLE cma_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Cat int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();
-- INSERT INTO tokyo_agency_report VALUES ();


DROP TABLE IF EXISTS hko_agency_report CASCADE;
CREATE TABLE hko_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Cat varchar(5),
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();
-- INSERT INTO hko_agency_report VALUES ();


DROP TABLE IF EXISTS newdelhi_agency_report CASCADE;
CREATE TABLE newdelhi_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Grade varchar(5),
    Ci float,
    Poci int,
    Dp int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();
-- INSERT INTO newdelhi_agency_report VALUES ();

DROP TABLE IF EXISTS reunion_agency_report CASCADE;
CREATE TABLE reunion_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Type int,
    Tnum float,
    Ci float,
    R34_NE int, R34_NW int, R34_SE int, R34_SW int,
    R50_NE int, R50_NW int, R50_SE int, R50_SW int,
    R64_NE int, R64_NW int, R64_SE int, R64_SW int,
    Gust int,
    Gust_per int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();
-- INSERT INTO reunion_agency_report VALUES ();


DROP TABLE IF EXISTS bom_agency_report CASCADE;
CREATE TABLE bom_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Type int,
    Tnum int,
    Ci float,
    R34_NE int, R34_NW int, R34_SE int, R34_SW int,
    R50_NE int, R50_NW int, R50_SE int, R50_SW int,
    R64_NE int, R64_NW int, R64_SE int, R64_SW int,
    Roci int,
    Poci int,
    RMW int,
    Eye int,
    Pos_method int,
    Pres_method int,
    Gust int,
    Gust_per int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();
-- INSERT INTO bom_agency_report VALUES ();

DROP TABLE IF EXISTS nadi_agency_report CASCADE;
CREATE TABLE nadi_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Cat int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();
-- INSERT INTO nadi_agency_report VALUES ();


DROP TABLE IF EXISTS wellington_agency_report CASCADE;
CREATE TABLE wellington_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();
-- INSERT INTO wellington_agency_report VALUES ();


DROP TABLE IF EXISTS ds824_agency_report CASCADE;
CREATE TABLE ds824_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Stage char(2),
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();
-- INSERT INTO ds824_agency_report VALUES ();


DROP TABLE IF EXISTS td9636_agency_report CASCADE;
CREATE TABLE td9636_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Stage int,
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();
-- INSERT INTO td9636_agency_report VALUES ();


DROP TABLE IF EXISTS td9635_agency_report CASCADE;
CREATE TABLE td9635_agency_report (
   SID char(13) NOT NULL,
   Iso_time varchar(23) NOT NULL,
   Latitude float,
   Longitude float,
   Wind int,
   Pressure int,
   Roci int,
   PRIMARY KEY (SID, Iso_time),
   FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
   FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();
-- INSERT INTO td9635_agency_report VALUES ();


DROP TABLE IF EXISTS neumann_agency_report CASCADE;
CREATE TABLE neumann_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Class char(2),
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();
-- INSERT INTO neumann_agency_report VALUES ();


DROP TABLE IF EXISTS mlc_agency_report CASCADE;
CREATE TABLE mlc_agency_report (
    SID char(13) NOT NULL,
    Iso_time varchar(23) NOT NULL,
    Latitude float,
    Longitude float,
    Wind int,
    Pressure int,
    Class char(2),
    PRIMARY KEY (SID, Iso_time),
    FOREIGN KEY (SID) REFERENCES hurricane_track.hurricane_instance (SID),
    FOREIGN KEY (Iso_time) REFERENCES hurricane_track.hurricane_instance(Iso_time)
);

-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();
-- INSERT INTO mlc_agency_report VALUES ();

