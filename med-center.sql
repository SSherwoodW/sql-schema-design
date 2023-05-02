-- in terminal:
-- psql < med-center.sql
-- psql medical_center

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
  id integer PRIMARY KEY,
  first_name text NOT NULL,
  last_name text NOT NULL,
  specialty text
);

CREATE TABLE patients (
  id integer PRIMARY KEY,
  first_name text NOT NULL,
  last_name text,
  insurance text,
  birthday DATE
);

CREATE TABLE visits (
  id integer PRIMARY KEY,
  patient_id integer REFERENCES patients,
  doc_id integer REFERENCES doctors,
  date DATE
);

CREATE TABLE diseases (
  id integer PRIMARY KEY, 
  disease text UNIQUE
);

CREATE TABLE diagnoses (
  id integer PRIMARY KEY,
  patient_id integer REFERENCES patients NOT NULL, 
  doc_id integer REFERENCES doctors NOT NULL,
  diag_date DATE
);



