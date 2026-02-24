# ⚽ World Cup Database (Project 2)

## 📝 Project Overview
This project demonstrates the ability to automate data processing and perform complex analytical queries. It involves creating a PostgreSQL database for World Cup results and building a Bash-based ETL pipeline to migrate data from a CSV source.

## 🛠️ Technical Highlights
* **Automated Data Injection (ETL)**: Developed a robust Bash script (`insert_data.sh`) that reads from `games.csv`, handles logic for duplicate entries (e.g., team names), and populates the `teams` and `games` tables.
* **Database Schema**: 
    - Designed a normalized schema with relational links between teams (winners/opponents) and game results.
    - Utilized sequences and serial keys for efficient indexing.
* **Advanced SQL Querying**: Authored `queries.sh` to extract specific insights, utilizing:
    - **JOINS**: Linking team IDs to their respective names across multiple columns.
    - **Aggregations**: `SUM`, `AVG`, `COUNT`, `MAX`.
    - **Pattern Matching**: Using `LIKE` for specific string filtering.

## 🚀 Key Skills Demonstrated
* **Bash/SQL Integration**: Passing variables between shell scripts and the PostgreSQL terminal.
* **Data Cleaning**: Managing string whitespace and ensuring unique record insertion through conditional logic.
* **Relational Logic**: Handling self-referencing style relationships (two different IDs from the same `teams` table mapped to one game).

## 📊 Sample Queries Included
- Total goals scored by winning teams.
- Average goals of winners vs. opponents.
- List of unique winning teams.
- Number of games played in specific years.
