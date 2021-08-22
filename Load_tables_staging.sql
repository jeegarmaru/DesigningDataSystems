CREATE DATABASE FinalProject;

CREATE SCHEMA "FINALPROJECT"."STAGING";

-- Loading the Yelp data with JSON files

CREATE FILE FORMAT "FINALPROJECT"."STAGING".JSON TYPE = 'JSON' COMPRESSION = 'AUTO' ENABLE_OCTAL = FALSE ALLOW_DUPLICATE = FALSE STRIP_OUTER_ARRAY = FALSE STRIP_NULL_VALUES = FALSE IGNORE_UTF8_ERRORS = FALSE;

CREATE TABLE "FINALPROJECT"."STAGING"."COVID19_YELP_JSON" ("V" VARIANT);

CREATE STAGE "FINALPROJECT"."STAGING".my_json_stage;

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/covid_19_dataset_2020_06_10/yelp_academic_dataset_covid_features.json @my_json_stage auto_compress=true;

COPY INTO "FINALPROJECT"."STAGING"."COVID19_YELP_JSON" FROM '@"FINALPROJECT"."STAGING"."MY_JSON_STAGE"' FILE_FORMAT = '"FINALPROJECT"."STAGING"."JSON"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;

CREATE STAGE "FINALPROJECT"."STAGING".yelp_business;

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/yelp_academic_dataset_business.json @yelp_business auto_compress=true;

CREATE TABLE "FINALPROJECT"."STAGING"."YELP_BUSINESS" ("V" VARIANT);

COPY INTO "FINALPROJECT"."STAGING"."YELP_BUSINESS" FROM '@"FINALPROJECT"."STAGING"."YELP_BUSINESS"' FILE_FORMAT = '"FINALPROJECT"."STAGING"."JSON"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;

CREATE STAGE "FINALPROJECT"."STAGING".yelp_checkin;

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/yelp_academic_dataset_checkin.json @yelp_checkin auto_compress=true;

CREATE TABLE "FINALPROJECT"."STAGING"."YELP_CHECKIN" ("V" VARIANT);

COPY INTO "FINALPROJECT"."STAGING"."YELP_CHECKIN" FROM '@"FINALPROJECT"."STAGING"."YELP_CHECKIN"' FILE_FORMAT = '"FINALPROJECT"."STAGING"."JSON"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;

CREATE STAGE "FINALPROJECT"."STAGING".yelp_review;

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/yelp_academic_dataset_review.json @yelp_review auto_compress=true;

CREATE TABLE "FINALPROJECT"."STAGING"."YELP_REVIEW" ("V" VARIANT);

COPY INTO "FINALPROJECT"."STAGING"."YELP_REVIEW" FROM '@"FINALPROJECT"."STAGING"."YELP_REVIEW"' FILE_FORMAT = '"FINALPROJECT"."STAGING"."JSON"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;

CREATE STAGE "FINALPROJECT"."STAGING".yelp_tip;

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/yelp_academic_dataset_tip.json @yelp_tip auto_compress=true;

CREATE TABLE "FINALPROJECT"."STAGING"."YELP_TIP" ("V" VARIANT);

COPY INTO "FINALPROJECT"."STAGING"."YELP_TIP" FROM '@"FINALPROJECT"."STAGING"."YELP_TIP"' FILE_FORMAT = '"FINALPROJECT"."STAGING"."JSON"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;

CREATE STAGE "FINALPROJECT"."STAGING".yelp_user;

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/yelp_academic_dataset_user.json @yelp_user auto_compress=true;

CREATE TABLE "FINALPROJECT"."STAGING"."YELP_USER" ("V" VARIANT);

COPY INTO "FINALPROJECT"."STAGING"."YELP_USER" FROM '@"FINALPROJECT"."STAGING"."YELP_USER"' FILE_FORMAT = '"FINALPROJECT"."STAGING"."JSON"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;


-- Loading the weather data with CSV files

CREATE FILE FORMAT "FINALPROJECT"."STAGING".CSV TYPE = 'CSV' COMPRESSION = 'AUTO' FIELD_DELIMITER = ',' RECORD_DELIMITER = '\n' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE' TRIM_SPACE = FALSE ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE ESCAPE = 'NONE' ESCAPE_UNENCLOSED_FIELD = '\134' DATE_FORMAT = 'AUTO' TIMESTAMP_FORMAT = 'AUTO' NULL_IF = ('');

CREATE TABLE "FINALPROJECT"."STAGING"."TEMPERATURE" ("DATE" INTEGER, "MIN" FLOAT, "MAX" FLOAT, "NORMAL_MIN" FLOAT, "NORMAL_MAX" FLOAT);

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/USW00023169-temperature-degreeF.csv @TEMPERATURE/ui1622723386273

COPY INTO "FINALPROJECT"."STAGING"."TEMPERATURE" FROM @/ui1622723386273 FILE_FORMAT = '"FINALPROJECT"."STAGING"."CSV"' ON_ERROR = 'ABORT_STATEMENT' PURGE = TRUE;

CREATE TABLE "FINALPROJECT"."STAGING"."PRECIPITATION" ("DATE" INTEGER, "PRECIPITATION" FLOAT, "PRECIPITATION_NORMAL" FLOAT);

CREATE FILE FORMAT "FINALPROJECT"."STAGING".CSV2 TYPE = 'CSV' COMPRESSION = 'AUTO' FIELD_DELIMITER = ',' RECORD_DELIMITER = '\n' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE' TRIM_SPACE = FALSE ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE ESCAPE = 'NONE' ESCAPE_UNENCLOSED_FIELD = '\134' DATE_FORMAT = 'AUTO' TIMESTAMP_FORMAT = 'AUTO' NULL_IF = ('T');

PUT file:///Users/jeegarmaru/Documents/Dev/Courses/DataArchitect/Course2/FinalProject/USW00023169-LAS_VEGAS_MCCARRAN_INTL_AP-precipitation-inch.csv @PRECIPITATION/ui1622723710154

COPY INTO "FINALPROJECT"."STAGING"."PRECIPITATION" FROM @/ui1622723710154 FILE_FORMAT = '"FINALPROJECT"."STAGING"."CSV2"' ON_ERROR = 'ABORT_STATEMENT' PURGE = TRUE;

