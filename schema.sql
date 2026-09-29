CREATE DATABASE IF NOT EXISTS teacher_ministry_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE teacher_ministry_db;

CREATE TABLE IF NOT EXISTS roles (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE IF NOT EXISTS teachers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    national_id VARCHAR(50) UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(50),
    gender VARCHAR(20),
    district VARCHAR(100),
    province VARCHAR(100),
    status VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS teacher_qualifications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    teacher_id BIGINT NOT NULL,
    qualification_type VARCHAR(100) NOT NULL,
    qualification_name VARCHAR(200) NOT NULL,
    institution_name VARCHAR(200),
    grade VARCHAR(50),
    award_year INT,
    certificate_number VARCHAR(100),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);
