CREATE TABLE location(
city text,
county text not null,
habitat text,
weather text,
regionId smallint not null,
PRIMARY KEY(regionId)
);

CREATE TABLE species(
class text,
family text,
speciesId smallint not null,
speciesName text,
regionId smallint,
PRIMARY KEY(speciesId)
);

CREATE TABLE physicalDescription(
speciesId smallint not null,
size text,
color text,
weight text,
isPoisonous boolean,
isVenomous boolean,
lifeSpan int,
PRIMARY KEY(color),
FOREIGN KEY(speciesId) REFERENCES species(speciesId)
);

CREATE TABLE eater(
predatorId smallint not null,
preyId smallint,
plant text,
FOREIGN KEY(predatorId) REFERENCES species(speciesId),
FOREIGN KEY(preyId) REFERENCES species(speciesId)
);

CREATE TABLE endangeredLevel(
speciesId smallint not null,
level smallint,
population int,
dateOfEndager date,
FOREIGN KEY(speciesId) REFERENCES species(speciesId)
);

