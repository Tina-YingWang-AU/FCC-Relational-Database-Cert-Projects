# 🧪 Periodic Table Database (Project 4)

## 📝 Project Overview
This project focuses on **Database Refactoring** and **Data Integrity**. Starting with an unoptimized dataset of chemical elements, the goal was to clean the data, standardize the schema according to relational best practices, and build a Bash script to query element information dynamically.

## 🛠️ Technical Highlights
* **Schema Refactoring**:
    - Performed extensive `ALTER TABLE` operations to rename columns, add constraints (`NOT NULL`, `UNIQUE`), and adjust data types.
    - Successfully merged and deleted redundant data to normalize the database structure.
* **Data Cleaning & Standardization**:
    - Used SQL `UPDATE` and `TRIM` to fix typos (e.g., removing trailing zeros from atomic mass).
    - Capitalized element symbols and names to maintain data consistency.
* **Relational Mapping**:
    - Established a new `types` table and linked it via foreign keys to replace hard-coded strings, demonstrating a mastery of database normalization.
* **Version Control Integration**:
    - Completed the project using a strict Git workflow, committing changes at each major refactoring milestone.

## 🚀 Key Skills Demonstrated
* **Database Maintenance**: Handling "legacy" data and bringing it up to modern standards.
* **Constraint Enforcement**: Ensuring that every element has a unique symbol and atomic number.
* **Complex CLI Scripting**: The `element.sh` script handles multiple input types (Atomic Number, Symbol, or Name) using regex and multi-table joins to return a comprehensive summary.

## 📊 Logic Example
The script identifies the input type:
- If input is numeric $\rightarrow$ Search by `atomic_number`.
- If input is 1-2 chars $\rightarrow$ Search by `symbol`.
- Otherwise $\rightarrow$ Search by `name`.
It then performs a **Three-Table Join** (`elements` + `properties` + `types`) to display the result.
