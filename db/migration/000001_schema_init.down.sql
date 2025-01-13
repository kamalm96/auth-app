ALTER TABLE "Verification_Request" DROP CONSTRAINT "verification_request_user_id_fkey";
ALTER TABLE "Verification_Request" DROP CONSTRAINT "verification_request_company_id_fkey";
ALTER TABLE "Verification_Request" DROP CONSTRAINT "verification_request_otp_id_fkey";
ALTER TABLE "Report" DROP CONSTRAINT "report_user_id_fkey";
ALTER TABLE "Report" DROP CONSTRAINT "report_company_id_fkey";
ALTER TABLE "OTP_Verification" DROP CONSTRAINT "otp_verification_user_id_fkey";

DROP TABLE IF EXISTS "Admin";
DROP TABLE IF EXISTS "Report";
DROP TABLE IF EXISTS "Verification_Request";
DROP TABLE IF EXISTS "OTP_Verification";
DROP TABLE IF EXISTS "Company";
DROP TABLE IF EXISTS "Users";
