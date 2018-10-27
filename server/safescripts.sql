CREATE TABLE prescription (
	id SERIAL PRIMARY KEY,
	name VARCHAR(500),
	description VARCHAR(500),
	whentotake TIME,
	frequency TEXT,
	active BOOLEAN,
	created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--Stretch Goal Tables

CREATE TABLE "monday" (
	"monday_id" serial NOT NULL,
	"schedule_id" integer NOT NULL,
	"med_name" varchar(30) NOT NULL,
	"dosage_unit" varchar(10) NOT NULL,
	"notes" varchar(2000) NOT NULL,
	"expiration_date" DATE NOT NULL,
	"refill_date" DATE NOT NULL,
	CONSTRAINT monday_pk PRIMARY KEY ("monday_id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "schedule" (
	"schedule_id" serial NOT NULL,
	"user_name" varchar(30) NOT NULL,
	"date_added" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT schedule_pk PRIMARY KEY ("schedule_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "monday" ADD CONSTRAINT "monday_fk0" FOREIGN KEY ("schedule_id") REFERENCES "schedule"("schedule_id");

SELECT * FROM "monday" 