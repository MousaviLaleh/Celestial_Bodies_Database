
------------------------------------------------------------
1. Create Database and connect to it
------------------------------------------------------------

psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;
\c universe;


------------------------------------------------------------
2. Create tables as required conditions
------------------------------------------------------------

CREATE TABLE galaxy(
    galaxy_id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR(30) NOT NULL UNIQUE, 
    galaxy_types VARCHAR(20), 
    age_in_million INT, 
    size_in_lightYear INT, 
    radius_in_km NUMERIC, 
    has_life BOOLEAN, 
    is_spherical BOOLEAN, 
    description TEXT
 );

CREATE TABLE star(
    star_id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR(30) NOT NULL UNIQUE, 
    radius_in_km INT, 
    age_in_million INT, 
    distance_from_earth NUMERIC, 
    has_life BOOLEAN, 
    is_spherical BOOLEAN, 
    description TEXT
 );

CREATE TABLE planet(
    planet_id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR(30) NOT NULL UNIQUE, 
    planet_types VARCHAR(20), 
    radius_in_km INT, 
    age_in_million INT, 
    distance_from_earth NUMERIC, 
    has_life BOOLEAN, 
    is_spherical BOOLEAN, 
    description TEXT
 );

CREATE TABLE moon(
    moon_id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR(30) NOT NULL UNIQUE, 
    radius_in_km INT, 
    age_in_million INT, 
    distance_from_planet NUMERIC, 
    has_life BOOLEAN, 
    is_spherical BOOLEAN, 
    description TEXT
 );

CREATE TABLE constellation(
    constellation_id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR(30) NOT NULL UNIQUE
);



------------------------------------------------------------
3. Fill the tables as required data conditions
------------------------------------------------------------

INSERT INTO galaxy(name, galaxy_types, age_in_million, size_in_lightYear, radius_in_km, has_life, is_spherical, description) 
VALUES
    ('Andromeda', 'Spirals', 10, 260000, 1.0407*10^18, TRUE, TRUE, 'Andromeda, also known as Messier 31 (M31), is a spiral galaxy located about 2.5 million light years away.'),
    ('Black Eye', 'Spirals', 17, 70000, 2.5053*10^17, TRUE, TRUE, 'The Black Eye Galaxy is a relatively isolated spiral galaxy 17 million light-years away in the mildly northern constellation of Coma Berenices. It was discovered by Edward Pigott in March 1779, and independently by Johann Elert Bode in April of the same year, as well as by Charles Messier the next year.'),
    ('Milk Way', 'Spirals', 800, 100000, 9.5*10^17, TRUE, TRUE, 'Andromeda, also known as Messier 31 (M31), is a spiral galaxy located about 2.5 million light years away.'),
    ('Cartwheel', 'Lenticular', 300, 150000, NULL, TRUE, FALSE, 'The Cartwheel Galaxy is a lenticular ring galaxy about 500 million light-years away in the constellation Sculptor. It was discovered by Fritz Zwicky in 1941.'),
    ('Cigar', 'Spirals', 12, 40800, 10.7502*10^17, TRUE, FALSE, 'M82 Galaxy Messier 82 is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major. It is the second-largest member of the M81 Group, with the D₂₅ isophotal diameter of 12.52 kiloparsecs.'),
    ('Leo', 'Spirals', 10, 260000, 1.0407*10^18, TRUE, TRUE, 'Leo I is a dwarf spheroidal galaxy in the constellation Leo. It is a member of the Local Group of galaxies and is thought to be one of the most distant satellites of the Milky Way galaxy.');
      

INSERT INTO constellation(constellation_name) VALUES ('Cassiopeia'), ('Aquarius'), ('Aries'), ('Auriga'), ('Aquila'), ('Ara'), ('Apus'), ('Antlia'), ('Carina'), ('Leo'), ('Hercules');


INSERT INTO star(star_name, radius_in_km, age_in_million, distance_from_earth, has_life, is_spherical, description, galaxy_id, constellation_id) 
VALUES
    ('Mirach', 69.57, 3.1, 96.87, TRUE, TRUE, 'Alpheratz, or Alpha Andromedae, is a bright star 97 light-years from the Sun \nand is the brightest star in the constellation of Andromeda when Beta Andromedae undergoes its periodical dimming.',  1, 4),
    ('Arcturus', 17.671, 7.1, 36.66, TRUE, FALSE, 'Arcturus is the brightest star in the northern constellation of Boötes. \nWith an apparent visual magnitude of −0.05, it is the fourth-brightest star in the night sky, and the brightest in the northern celestial hemisphere.',  2, 7),
    ('Aquila', 994994, 4, 16.8, TRUE, FALSE, 'Aquila represents the bird that carried thunderbolts of Zeus or Jupiter.\nIts brightest star, located along the Milky Way.',  3, 2),
    ('Mizar', 459480, 370, 82.84, TRUE, FALSE, 'Mizar is a second-magnitude star in the handle of the Big Dipper asterism in the constellation of Ursa Major. \nIt forms a well-known naked eye double star with the fainter star Alcor, and is itself a quadruple star system.', 4, 2),
    ('HIP 47594', 695800, 1446000, 478.95, TRUE, TRUE, 'HIP 47594 is a white to yellow giant star in the constellation of Ursa Major. It can be seen in the northern hemisphere night sky.', 5),
    ('Regulus', 455535, 100, 77.63, TRUE, TRUE, 'Regulus is the brightest object in the constellation Leo and one of the brightest stars in the night sky. \nIt has the Bayer designation designated α Leonis, which is Latinized to Alpha Leonis, and abbreviated Alpha Leo or α Leo', 6, 6);


INSERT INTO planet(name, planet_types, radius_in_km, age_in_million, distance_from_earth, has_life, is_spherical, description, star_id) 
VALUES
    ('Mercury', 'Elliptical', 4879, 4.6, 48, FALSE, TRUE, 'Mercury is the first planet from the Sun and the smallest in the Solar System. \nIt is a terrestrial planet with a heavily cratered surface due to overlapping impact events. \nThese features are well preserved since the planet has no geological activity and an extremely tenuous atmosphere called an exosphere.', 8),
    ('Venus', 'Circular', 12104, 500, 147.92, FALSE, TRUE, 'Venus is the second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System, and the only one with a mass and size that is close to that of its orbital neighbour Earth.', 8),
    ('Earth', 'Circular', 12742, 50, 0, TRUE, TRUE, 'Earth is the third planet from the Sun and has a dynamic atmosphere and a composition of primarily nitrogen and oxygen.', 8),
    ('Mars', 'Elliptical', 6779, 800, 140, FALSE, FALSE, 'Mars is the fourth planet and the furthest terrestrial planet from the Sun. \nThe reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname -the Red Planet', 8),
    ('Jupiter', 'Elliptical', 139820, 11.86, 588, FALSE, TRUE, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. \nIt is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun.', 8),
    ('Saturn', 'Elliptical', 120536, 400, 1.5345, FALSE, FALSE, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. \nIt is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive.', 8),
    ('Uranus', 'Elliptical', 51118, 4.6, 2.8336, FALSE, TRUE, 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. \nMost of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called ''ice'' or volatiles.', 8),
    ('Neptune', '', 49528, 4.6, 4.5031, FALSE, TRUE, 'Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. \nIt is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus.', 8);



INSERT INTO moon(name, radius_in_km, age_in_million, distance_from_planet, has_life, is_spherical, description, planet_id) 
VALUES
('Luna', 1737.4, 4500, 384400, FALSE, TRUE, 'The Moon, also known as Luna, is Earth only natural satellite and is the fifth-largest satellite in the Solar System.\nThe Moon has played a crucial role in shaping Earth''s tides and has been a subject of fascination and study throughout human history.', 3),
('Phobos', 11.1, 4300, 9378, FALSE, FALSE, 'Phobos is one of the two moons of Mars, and it is the larger and closer of the two.\nThe surface of Phobos is covered in a layer of dust and loose, fragmented material called regolith.', 4),
('Deimos', 6.2, 4600, 23460, FALSE, FALSE, 'Deimos is one of the two moons of Mars, and it is the smaller and more distant of the two.\nThe surface of Deimos is covered in a layer of dust and regolith.', 4),
('Io', 1821.3, 4500, 421700, FALSE, FALSE, 'Io is the largest moon of Jupiter and most fascinating moons with a surface of volcanic calderas, lava lakes, and extensive plains formed by various volcanic processes.', 5),
('Europa', 1560, 4000, 671034, FALSE, TRUE, 'One of Jupiter largest moons, is a fascinating celestial body with unique features.\nThe surface is covered in a layer of smooth ice, marked by a network of dark streaks, cracks, and ridges.' , 5),
('Ganymede', 2634, 4500, 1070412, FALSE, TRUE, 'Ganymede, Jupiter''s largest and the largest moon in our solar system.\nThe surface is a mix of two types of terrain: darker regions covered in older, heavily cratered ice, \nand lighter regions with grooved terrain believed to be caused by tectonic processes.', 5),
('Callisto', 2410.3, 4500, 1882700, FALSE, TRUE,'Callisto, is a unique celestial body with a heavily cratered and ancient surface.\nThe surface is marked by impact craters of various sizes, suggesting a lack of processes\nlike tectonics or volcanic activity that could erase or modify cratering over time.', 5),
('Titan', 2575, 4500, 1221870, FALSE, TRUE, 'Titan, Saturn''s largest moon, is a fascinating celestial body with a thick atmosphere and surface of a thick atmosphere and vast plains, dunes, mountains, and lakes.' , 6),
('Enceladus', 252, NULL, 238020, FALSE, TRUE, 'Enceladus, one of Saturn''s moons, is a small and has a highly reflective surface covered in clean, white ice.', 6),
('Mimas', 198.2, NULL, 185520, FALSE, TRUE, 'Mimas is one of the smaller major moons of Saturn, with  a large impact crater named Herschel Crater, which gives the moon a unique appearance. ', 6),
('Rhea', 764.3, NULL, 527108, FALSE, TRUE, 'Second largest moon of Saturn after Titan. Rhea is composed mainly of water ice and a small amount of rock \nand it''s  surface exhibits a variety of features, including impact craters of different sizes.', 6),
('Dione', 561.4, NULL, 377396, FALSE, TRUE, 'One of the largest moon of Saturn''s moons, with a surface exhibits a variety of features, including impact craters, cliffs, and chasms.', 6),
('Tethys', 531.1, NULL, 294619, FALSE, TRUE, 'Tethys is one of Saturn''s moons, has a heavily cratered surface, and one of its most prominent features is the enormous impact basin named Odysseus.\n The moon''s surface is predominantly icy, and it reflects a significant amount of sunlight, giving it a bright appearance.', 6),
('Titania', 788.9, NULL, 436300, FALSE, TRUE, 'Titania is the largest moon of Uranus,  primarily composed of water ice, mixed with rocky material. Its surface is likely covered by a layer of water ice.', 7),
('Oberon', 761.4, NULL, 582600, FALSE, TRUE, 'Oberon is the second-largest moon of Uranus and the ninth-largest moon in the solar system.\nOberon''s surface is marked by a variety of geological features, including impact craters and a prominent equatorial ridge.', 7),
('Miranda', 235.8, NULL, 129900, FALSE, TRUE, 'Miranda is the smallest and innermost of Uranus''s five major moons.\nMiranda''s surface is notable for its diverse and complex features, including large fault systems, canyons, and cliffs.', 7),
('Ariel', 578.9, NULL, 191020, FALSE, TRUE, 'Ariel is the fourth-largest moon of Uranus and is primarily composed of water ice and rock.\nAriel''s surface is characterized by impact craters, valleys, and fault lines.', 7),
('Umbriel', 584.7, NULL, 266000, FALSE, TRUE, 'Umbriel is the third-largest moon of Uranus, \nwith a surface of characterized by impact craters, and it lacks the extensive geological features found on some of Uranus''s other moons.', 7),
('Proteus', 210, NULL, 117647, FALSE, FALSE, 'Proteus is the second-largest moon of Neptune. It has a heavily cratered surface, indicating a history of impacts. \nProteus has an irregular shape like a football or rugby ball.', 8),
('Triton', 1353, NULL, 354760, FALSE, TRUE, 'Triton is the seventh-largest moon in the solar system, with a surface of diverse and includes icy plains, ridges, valleys, and impact craters.', 8),
('Nereid', 180, NULL, 5513400, FALSE, FALSE, 'Nereid is a small moon with an irregular shape. It has a highly eccentric and inclined orbit around Neptune.', 8),
('Larissa', 97, NULL, 73500, FALSE, FALSE, 'Larissa is one of the smaller moons of Neptune with an irregular shape.', 8);



------------------------------------------------------------
4. Foreign Key assignment
------------------------------------------------------------

ALTER TABLE galaxy ADD FOREIGN KEY star_id INT REFERENCES star(star_id)
ALTER TABLE star ADD COLUMN galaxy_id REFERENCES galaxy(galaxy_id);
ALTER TABLE star   ADD FOREIGN KEY planet_id INT REFERENCES planet(planet_id)
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE planet ADD FOREIGN KEY moon_id INT REFERENCES moon(moon_id)
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);



------------------------------------------------------------
5. Compact sql db queries into universe.sql file
------------------------------------------------------------

pg_dump -cC --inserts -U freecodecamp universe > universe.sql



