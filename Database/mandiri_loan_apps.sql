CREATE TABLE "notification" (
  "notification_id" int NOT NULL,
  "user_id" uuid NOT NULL,
  "message" char NOT NULL,
  "send_at" timestamp NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "delete_at" timestamp NOT NULL
);

CREATE TABLE "biometrics" (
  "biometric_id" int,
  "fingerprint" char,
  "face_id" char
);

CREATE TABLE "users" (
  "user_id" uuid PRIMARY KEY,
  "email" varchar NOT NULL,
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "phone_number" int NOT NULL,
  "password" char NOT NULL,
  "photo" char NOT NULL,
  "ktp" char NOT NULL,
  "biometric_id" int NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "delete_at" timestamp NOT NULL
);

CREATE TABLE "loans" (
  "loan_id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "loan_installment_id" uuid NOT NULL,
  "amount" int NOT NULL,
  "tenor_month" int NOT NULL,
  "status_loan_id" uuid NOT NULL,
  "due_date_at" timestamp NOT NULL,
  "payment_at" timestamp NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "loans_installment" (
  "loan_installment_id" uuid PRIMARY KEY,
  "loan_id" uui NOT NULL,
  "installment_number" int NOT NULL,
  "payment_method" varchar NOT NULL,
  "payment_at" timestamp NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "status_loans" (
  "status_loan_id" uuid PRIMARY KEY,
  "description" varchar NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

ALTER TABLE "notification" ADD CONSTRAINT "notification_service" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "users" ADD FOREIGN KEY ("biometric_id") REFERENCES "biometrics" ("biometric_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "loans" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "loans_installment" ADD FOREIGN KEY ("loan_id") REFERENCES "loans" ("loan_installment_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "loans" ADD FOREIGN KEY ("status_loan_id") REFERENCES "status_loans" ("status_loan_id") DEFERRABLE INITIALLY IMMEDIATE;
