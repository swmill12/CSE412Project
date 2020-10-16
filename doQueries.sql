/*doQueries.sql*/

/*Find physical description of "Grizzly Bear" */
SELECT *
FROM physicalDescription, species
WHERE physicalDescription.speciesID = species.speciesID AND speciesName %LIKE% "Grizzly Bear";

/*Find habitat of "Grizzly Bear" */
SELECT habitat
FROM location, species
WHERE species.regionID = location.regionID AND speciesName %LIKE% "Grizzly Bear";

/*Find what species "Grizzly Bear" eats */
SELECT Prey.speciesName
FROM species AS Prey,eater
WHERE Prey.speciesID = (SELECT eater.preyID FROM species AS Predator, eater WHERE Predator.speciesName %LIKE% "Grizzly Bear" AND eater.predatorID = Predator.speciesID );

/*Find what species eats "Grizzly Bear"  */
SELECT Pedator.speciesName
FROM species AS Predator ,eater
WHERE Predator.speciesID = (SELECT eater.predatorID FROM species AS Prey, eater WHERE Prey.speciesName %LIKE% "Grizzly Bear" AND eater.preyID = Prey.speciesID );

/*Find population of "Grizzly Bear" */
SELECT population
FROM endangeredLevel, species
WHERE species.speciesID = endangeredLevel.speciesID AND speciesName %LIKE% "Grizzly Bear";

/*Find population of "Grizzly Bear" */
SELECT population
FROM endangeredLevel, species
WHERE species.speciesID = endangeredLevel.speciesID AND speciesName %LIKE% "Grizzly Bear";


/*Find if "Grizzly Bear" is venomous*/
SELECT isVenomous
FROM physicalDescription, species
WHERE physicalDescription.speciesID = species.speciesID AND speciesName %LIKE% "Grizzly Bear";

/*Find all animals with population <100 */
SELECT speciesName
FROM endangeredLevel, species
WHERE endangeredLevel.population < 100;


/*Insert Bat */
INSERT INTO species
VALUES('mammal', bat,8,'Lesser long-nosed bat',7); /*lives in sedona, but I am setting to live in flagstaff so that we can update it later*/

INSERT INTO physicalDescription
VALUES(8, 'small','BROWN',.048,false,false, 12);

/*Update Lesser long-nosed Bat to live in sedona*/
UPDATE species
 SET regionId = 6 
 WHERE speciesID= 8;
