-- name: CreateOTP :one
INSERT INTO "OTP_Verification" (
    otp_code, expires_at, is_verified, failed_attempts, user_id
) VALUES (
    $1, $2, $3, $4, $5
)
RETURNING *;

-- name: GetOTP :one
SELECT * FROM "OTP_Verification"
WHERE otp_id = $1
LIMIT 1;

-- name: GetOTPs :many
SELECT * FROM "OTP_Verification"
ORDER BY otp_id
LIMIT $1
OFFSET $2;

-- name: UpdateFailedAttempts :one
UPDATE "OTP_Verification"
SET failed_attempts = $1
WHERE otp_id = $2
RETURNING otp_id, failed_attempts;

-- name: DeleteOTP :exec
DELETE FROM "OTP_Verification"
WHERE otp_id = $1;
