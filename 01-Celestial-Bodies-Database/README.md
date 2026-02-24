# 🌌 Celestial Bodies Database (Project 1)

## 📝 Project Overview
This project involves designing and implementing a complex PostgreSQL database from scratch. The goal was to model a celestial universe, ensuring data integrity through relational mapping and strict architectural constraints.

## 🛠️ Technical Implementation
* **Relational Schema**: Designed a 5-table architecture including `galaxy`, `star`, `planet`, `moon`, and a custom `nebula` table.
* **Data Integrity**: Implemented various PostgreSQL constraints:
    * **Primary Keys**: Unique identifiers for every entity.
    * **Foreign Keys**: Establishing one-to-many relationships (e.g., Star belongs to a Galaxy).
    * **Constraints**: Applied `NOT NULL`, `UNIQUE`, and `CHECK` constraints to ensure data quality.
* **Data Types**: Utilized a variety of types including `INT`, `NUMERIC`, `TEXT`, `VARCHAR`, and `BOOLEAN`.

## 🏗️ Database Structure (ERD Concepts)
- Each **Galaxy** can host multiple **Stars**.
- Each **Star** is orbited by multiple **Planets**.
- Each **Planet** may have multiple **Moons**.
- A custom table **Nebula** connects to the universe via relational IDs.

## 🚀 Key SQL Skills
* Schema Generation (`CREATE DATABASE`, `CREATE TABLE`)
* Relational Mapping (Linking tables via IDs)
* Data Population (`INSERT INTO`)
* Exporting/Importing PostgreSQL dumps
