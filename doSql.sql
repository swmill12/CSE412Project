
/*doQueries.sql*/
SELECT * FROM species;
SELECT * FROM location;
SELECT * FROM physicalDescription;
SELECT * FROM eater;
SELECT * FROM endangeredLevel;
/*Find physical description of "Grizzly Bear" */
SELECT *
FROM physicalDescription, species
WHERE physicalDescription.speciesID = species.speciesID AND speciesName = 'Grizzly Bear';

/*Find habitat of 'Desert Pupfish'*/
SELECT habitat
FROM location, species
WHERE species.regionID = location.regionID AND speciesName = 'Desert Pupfish';

/*Find what species 'Mexican Spotted Owl' eats */
SELECT Prey.speciesName FROM species prey, species pred, eater
WHERE pred.speciesName = 'Mexican Spotted Owl' AND pred.speciesId = eater.predatorId AND prey.speciesId = eater.preyId;


/*Find what species eats 'Black Footed Prairie Dog'  */
SELECT pred.speciesName FROM species prey, species pred, eater
WHERE prey.speciesName = 'Black Footed Prairie Dog' AND pred.speciesId = eater.predatorId AND prey.speciesId = eater.preyId;


/*Find what plants 'Black Footed Prairie Dog' eats*/
SELECT eater.plant FROM species, eater
WHERE species.speciesName = 'Black Footed Prairie Dog' AND species.speciesId = eater.predatorId;

/*Find population of 'Jaguar' */
SELECT population
FROM endangeredLevel, species
WHERE species.speciesID = endangeredLevel.speciesID AND speciesName = 'Jaguar';


/*Find if 'New Mexican Ridge-Nosed rattlesnake' is venomous*/
SELECT isVenomous
FROM physicalDescription, species
WHERE physicalDescription.speciesID = species.speciesID AND speciesName = 'New Mexican Ridge-Nosed rattlesnake';

/*Find if 'Ocelot' is venomous*/
SELECT isVenomous
FROM physicalDescription, species
WHERE physicalDescription.speciesID = species.speciesID AND speciesName = 'Ocelot';

/*Find all animals with population <100 */
SELECT speciesName
FROM endangeredLevel, species
WHERE endangeredLevel.population < 100 AND endangeredLevel.speciesId = species.speciesId;

DELETE FROM species WHERE speciesName = 'Lesser Long-Nosed bat'; 

/*Insert Bat */
INSERT INTO species
VALUES('mammal','bat',19,'Lesser Long-Nosed bat',7); /*lives in sedona, but I am setting to live in flagstaff so that we can update it later*/

INSERT INTO physicalDescription
VALUES(19, 'small','BROWN',.048,false,false, 12);

/*Update Lesser long-nosed Bat to live in sedona*/
UPDATE species
 SET regionId = 6 
 WHERE speciesID= 19;