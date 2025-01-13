# Auth-App: Authentication System with SQLC

This project is a backend application designed for user and company management with robust authentication and verification features. It uses **PostgreSQL** for the database and **SQLC** for generating Go code from SQL queries, ensuring type-safe database interactions.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [Features](#features)
3. [Setup](#setup)
4. [Database Schema](#database-schema)
5. [Queries](#queries)
6. [SQLC Integration](#sqlc-integration)
7. [Contributing](#contributing)
8. [License](#license)

---

## Features

- **User Management**: Create, retrieve, update, ban, and delete users.
- **Company Management**: Manage companies with status tracking (e.g., `verified`, `pending`).
- **OTP Verification**: Generate and verify OTPs for secure authentication.
- **Reporting System**: Users can report suspicious companies.
- **Verification Requests**: Tracks interactions between users and companies.
- **SQLC Integration**: Auto-generates type-safe Go code from SQL queries.

---

## Setup

### Prerequisites

- **Go** (latest version)
- **PostgreSQL** (latest version)
- **SQLC** (installed globally)

### Steps

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd auth-app

