-- name: CreateCompany :one
INSERT INTO "Company" (
    company_name, company_phone, company_email, "address", "status"
) VALUES (
    $1, $2, $3, $4, $5
)
RETURNING *;

-- name: GetCompany :one
SELECT company_name, company_phone, company_email, "status", created_at, updated_at, "isRestricted", "address"
FROM "Company"
WHERE company_id = $1
LIMIT 1;

-- name: GetCompanies :many
SELECT company_name, company_phone, company_email, "status", created_at, updated_at, "isRestricted", "address"
FROM "Company"
ORDER BY company_id
LIMIT $1
OFFSET $2;

-- name: GetCompanyForUpdate :one
SELECT company_name, company_phone, company_email, "status", created_at, updated_at, "isRestricted", "address" 
FROM "Company"
WHERE company_id = $1
LIMIT 1
FOR NO KEY UPDATE;

-- name: UpdateCompany :one
UPDATE "Company"
SET 
    company_name = COALESCE($2, company_name),
    company_phone = COALESCE($3, company_phone),
    company_email = COALESCE($4, company_email),
    "address" = COALESCE($5, "address"),
    "status" = COALESCE($6, "status"),
    "isRestricted" = COALESCE($7, "isRestricted"),
    updated_at = now()
WHERE company_id = $1
RETURNING company_name, company_phone, company_email, "status", created_at, updated_at,"address", "isRestricted";

-- name: BanCompany :exec
UPDATE "Company"
SET "isRestricted" = true
WHERE company_id = $1;

-- name: DeleteCompany :exec
DELETE FROM "Company"
WHERE company_id = $1;
