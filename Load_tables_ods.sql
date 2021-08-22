
CREATE SCHEMA "FINALPROJECT"."ODS";

CREATE TABLE "FINALPROJECT"."ODS".temperature LIKE "FINALPROJECT"."STAGING"."TEMPERATURE";

insert into ods.temperature select * from staging.temperature;

CREATE TABLE "FINALPROJECT"."ODS".precipitation LIKE "FINALPROJECT"."STAGING"."PRECIPITATION";

insert into ods.precipitation select * from staging.precipitation;

CREATE TABLE "FINALPROJECT"."ODS"."YELP_BUSINESS" ("BUSINESS_ID" STRING NOT NULL, "NAME" STRING, "ADDRESS" STRING, "CITY" STRING, "STATE" STRING, "POSTAL_CODE" STRING, "IS_OPEN" INTEGER, "REVIEW_COUNT" FLOAT, "STARS" FLOAT, "LATITUDE" FLOAT, "LONGITUDE" FLOAT, "RESTAURANTS_TAKEOUT" STRING, "BUSINESS_PARKING" STRING, "CATEGORIES" STRING, "HOURS_MONDAY" STRING, "HOURS_TUESDAY" STRING, "HOURS_WEDNESDAY" STRING, "HOURS_THURSDAY" STRING, "HOURS_FRIDAY" STRING, "HOURS_SATURDAY" STRING, "HOURS_SUNDAY" STRING);

insert into "ODS"."YELP_BUSINESS"(business_id, name, address, city, state, postal_code, is_open, review_count, stars, latitude, longitude, restaurants_takeout, business_parking, categories, hours_monday, hours_tuesday, hours_wednesday, hours_thursday, hours_friday, hours_saturday, hours_sunday) select v:business_id, v:name, v:address, v:city, v:state, v:postal_code, v:is_open, v:review_count, v:stars, v:latitude, v:longitude, v:attributes.RestaurantsTakeOut, v:attributes.BusinessParking, v:categories, v:hours.Monday, v:hours.Tuesday, v:hours.Wednesday, v:hours.Thursday, v:hours.Friday, v:hours.Saturday, v:hours.Sunday from yelp_business;

CREATE TABLE "FINALPROJECT"."ODS"."YELP_CHECKIN" ("BUSINESS_ID" STRING, "DATES" STRING);

insert into "ODS"."YELP_CHECKIN"(business_id, dates) select v:business_id, v:date from yelp_checkin;

CREATE TABLE "FINALPROJECT"."ODS"."YELP_REVIEW" ("REVIEW_ID" STRING, "BUSINESS_ID" STRING, "REVIEW_DATE" INTEGER, "REVIEW_DATETIME" TIMESTAMP, "USER_ID" STRING, "TEXT" STRING, "COOL" INTEGER, "FUNNY" INTEGER, "USEFUL" INTEGER, "STARS" INTEGER);

insert into "ODS"."YELP_REVIEW"(review_id, business_id, review_date, review_datetime, user_id, text, cool, useful, funny, stars) select v:review_id, v:business_id, CAST(TO_CHAR(TO_TIMESTAMP_NTZ(v:date), 'YYYYMMDD') as integer), TO_TIMESTAMP_NTZ(v:date), v:user_id, v:text, v:cool, v:useful, v:funny, v:stars from yelp_review;

CREATE TABLE "FINALPROJECT"."ODS"."YELP_TIP" ("BUSINESS_ID" STRING, "USER_ID" STRING, "TIP_DATE" TIMESTAMP, "TEXT" STRING, "COMPLIMENT_COUNT" INTEGER);

insert into "ODS"."YELP_TIP"(business_id, user_id, tip_date, text, compliment_count) select v:business_id, v:user_id, TO_TIMESTAMP_NTZ(v:date), v:text, v:compliment_count from yelp_tip;

CREATE TABLE "FINALPROJECT"."ODS"."YELP_USER" ("USER_ID" STRING, "NAME" STRING, "REVIEW_COUNT" INTEGER, "USEFUL" INTEGER, "FUNNY" INTEGER, "COOL" INTEGER, "AVERAGE_STARS" FLOAT, "YELPING_SINCE" TIMESTAMP, "FRIENDS" STRING, "FANS" INTEGER, "ELITE" STRING, "COMPLIMENT_HOT" INTEGER, "COMPLIMENT_MORE" INTEGER, "COMPLIMENT_PROFILE" INTEGER, "COMPLIMENT_CUTE" INTEGER, "COMPLIMENT_LIST" INTEGER, "COMPLIMENT_NOTE" INTEGER, "COMPLIMENT_PLAIN" INTEGER, "COMPLIMENT_COOL" INTEGER, "COMPLIMENT_FUNNY" INTEGER, "COMPLIMENT_WRITER" INTEGER, "COMPLIMENT_PHOTOS" INTEGER);

insert into "ODS"."YELP_USER"(user_id, name, review_count, useful, funny, cool, average_stars, yelping_since, friends, fans, elite, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos) select v:user_id, v:name, v:review_count, v:useful, v:funny, v:cool, v:average_stars, v:yelping_since, v:friends, v:fans, v:elite, v:compliment_hot, v:compliment_more, v:compliment_profile, v:compliment_cute, v:compliment_list, v:compliment_note, v:compliment_plain, v:compliment_cool, v:compliment_funny, v:compliment_writer, v:compliment_photos from yelp_user;

CREATE TABLE "FINALPROJECT"."ODS"."YELP_COVID19" ("BUSINESS_ID" STRING, "HIGHLIGHTS" STRING, "DELIVERY_TAKEOUT" STRING, "COVID_BANNER" STRING, "CALL_TO_ACTION_ENABLED" STRING, "GRUBHUB_ENABLED" STRING, "REQUEST_A_QUOTE_ENABLED" STRING, "TEMPORARY_CLOSED_UNTIL" STRING, "VIRTUAL_SERVICES_OFFERED" STRING);

insert into "ODS"."YELP_COVID19"(business_id, highlights, delivery_takeout, covid_banner, call_to_action_enabled, grubhub_enabled, request_a_quote_enabled, temporary_closed_until, virtual_services_offered) select v:business_id, v:highlights, v:"delivery or takeout", v:"Covid Banner", v:"Call To Action enabled", v:"Grubhub enabled", v:"Request a Quote Enabled", v:"Temporary Closed Until", v:"Virtual Services Offered" from covid19_yelp_json;
