-- name: CreateUsers :one
INSERT INTO "Users" (
    "fullName", "phoneNumber", email, password_hash
) VALUES (
    $1, $2, $3, $4
)
RETURNING *;

-- name: GetUser :one
SELECT "fullName", "phoneNumber", email, "isVerified", created_at, updated_at, "isRestricted" 
FROM "Users"
WHERE user_id = $1
LIMIT 1;

-- name: GetUsers :many
SELECT "fullName", "phoneNumber", email, "isVerified", created_at, updated_at, "isRestricted"
FROM "Users"
ORDER BY user_id
LIMIT $1
OFFSET $2;

-- name: GetUsersForUpdate :one
SELECT "fullName", "phoneNumber", email, "isVerified", created_at, updated_at, "isRestricted"
FROM "Users"
WHERE user_id = $1
LIMIT 1
FOR NO KEY UPDATE;

-- name: UpdateUsers :one
UPDATE "Users"
SET 
    "fullName" = COALESCE($2, "fullName"),
    "phoneNumber" = COALESCE($3, "phoneNumber"),
    email = COALESCE($4, email),
    password_hash = COALESCE($5, password_hash),
    "isVerified" = COALESCE($6, "isVerified"),
    "isRestricted" = COALESCE($7, "isRestricted"),
    updated_at = now()
WHERE user_id = $1
RETURNING "fullName", "phoneNumber", email, "isVerified", created_at, updated_at, "isRestricted";

-- name: BanUsers :exec
UPDATE "Users"
SET "isRestricted" = true
WHERE user_id = $1;

-- name: DeleteUsers :exec
DELETE FROM "Users"
WHERE user_id = $1;
