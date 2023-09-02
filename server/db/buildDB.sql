-- 
DROP TABLE users, travel_group, itinerary_item, group_members;

-- Users table
CREATE TABLE IF NOT EXISTS users(
    _id serial NOT NULL,
    username varchar NOT NULL,
    password varchar NOT NULL,
    firstname varchar NOT NULL,
    lastname varchar NOT NULL,
    CONSTRAINT "users_pk0" PRIMARY KEY ("_id")
) WITH (OIDS=FALSE);

-- Group table
CREATE TABLE IF NOT EXISTS travel_group(
    _id serial NOT NULL,
    owner_id bigint NOT NULL,
    group_name varchar NOT NULL,
    travel_destination varchar NOT NULL,
    CONSTRAINT "travel_group_pk0" PRIMARY KEY ("_id")
) WITH (OIDS=FALSE);

--Itinerary Item table
CREATE TABLE IF NOT EXISTS itinerary_item(
    _id serial NOT NULL,
    group_id bigint NOT NULL,
    title varchar NOT NULL,
    category varchar NOT NULL,
    hyperlink varchar NOT NULL,
    cost float NOT NULL,
    date_of_event date NOT NULL,
    CONSTRAINT "itinerary_item_pk0" PRIMARY KEY ("_id")
) WITH (OIDS=FALSE);

--Travel group members
CREATE TABLE IF NOT EXISTS group_members(
    _id serial NOT NULL,
    user_id bigint NOT NULL,
    group_id bigint NOT NULL,
    CONSTRAINT "group_member_pk0" PRIMARY KEY ("_id")
) WITH (OIDS=FALSE);

/* 
Travel Group FKs 
    - owner_id: users
*/
ALTER TABLE travel_group ADD CONSTRAINT "travel_group_fk0" FOREIGN KEY ("owner_id") REFERENCES users("_id");

/*
Itinerary Item:
    - group_id
*/
ALTER TABLE itinerary_item ADD CONSTRAINT "itinerary_item_fk0" FOREIGN KEY ("group_id") REFERENCES travel_group("_id");

/*
Travel Group Members:
    - user_id: users
    - group_id: travel_group
*/

ALTER TABLE group_members ADD CONSTRAINT "group_members_fk0" FOREIGN KEY ("user_id") REFERENCES users("_id");
ALTER TABLE group_members ADD CONSTRAINT "group_members_fk1" FOREIGN KEY ("group_id") REFERENCES travel_group("_id");