-- name: CreateVerificationRequest :one
INSERT INTO "Verification_Request" (
    user_id, company_id, otp_id, verification_status
) VALUES (
    $1, $2, $3, $4
)
RETURNING *;

-- name: GetVerification :one
SELECT * FROM "Verification_Request"
WHERE request_id = $1
LIMIT 1;

-- name: GetVerifications :many
SELECT * FROM "Verification_Request"
ORDER BY request_id
LIMIT $1
OFFSET $2;

-- name: UpdateRequest :one
UPDATE "Verification_Request"
SET otp_id = $1
WHERE request_id = $2
RETURNING *;

-- name: DeleteRequest :exec
DELETE FROM "Verification_Request"
WHERE request_id = $1;