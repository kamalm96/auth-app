CREATE TABLE "Users" (
  "user_id" uuid PRIMARY KEY,
  "fullName" varchar(50) NOT NULL,
  "phoneNumber" varchar(20) UNIQUE NOT NULL,
  "isVerified" bool NOT NULL DEFAULT false,
  "email" varchar(50) UNIQUE NOT NULL,
  "password_hash" text NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz NOT NULL DEFAULT now(),
  "isRestricted" bool NOT NULL DEFAULT false
);

CREATE TABLE "Company" (
  "company_id" uuid PRIMARY KEY,
  "company_name" varchar(100) NOT NULL,
  "company_phone" varchar(20) UNIQUE NOT NULL,
  "company_email" varchar(100) UNIQUE NOT NULL,
  "address" text NOT NULL,
  "registered_date" date NOT NULL,
  "status" varchar(20) NOT NULL DEFAULT 'pending',
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz NOT NULL DEFAULT now(),
  "isRestricted" bool NOT NULL DEFAULT false
);

CREATE TABLE "OTP_Verification" (
  "otp_id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "otp_code" varchar(10) NOT NULL,
  "expires_at" timestamptz NOT NULL,
  "is_verified" bool NOT NULL DEFAULT false,
  "failed_attempts" int NOT NULL DEFAULT 0,
  "created_at" timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE "Verification_Request" (
  "request_id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "company_id" uuid NOT NULL,
  "otp_id" uuid NOT NULL,
  "verification_status" varchar(20) NOT NULL DEFAULT 'pending',
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE "Report" (
  "report_id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "company_id" uuid NOT NULL,
  "report_reason" text NOT NULL,
  "report_status" varchar(20) NOT NULL DEFAULT 'open',
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE "Admin" (
  "admin_id" uuid PRIMARY KEY,
  "email" varchar(100) UNIQUE NOT NULL,
  "password_hash" text NOT NULL,
  "role" varchar(20) NOT NULL DEFAULT 'moderator',
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE "OTP_Verification" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");

ALTER TABLE "Verification_Request" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");
ALTER TABLE "Verification_Request" ADD FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id");
ALTER TABLE "Verification_Request" ADD FOREIGN KEY ("otp_id") REFERENCES "OTP_Verification" ("otp_id");

ALTER TABLE "Report" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");
ALTER TABLE "Report" ADD FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id");
