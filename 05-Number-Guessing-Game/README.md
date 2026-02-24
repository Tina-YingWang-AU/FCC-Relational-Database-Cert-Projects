# 🎮 Number Guessing Game (Project 5)

## 📝 Project Overview
The final project of the certification combines complex Bash programming with SQL database persistence. It is a CLI-based game where the system tracks user history, calculates personal bests, and manages session data through a PostgreSQL backend.

## 🛠️ Technical Highlights
* **User Persistence Logic**:
    - Implemented a "Welcome Back" vs. "New User" flow. The script queries the database for the username:
        - **Existing Users**: Retrieves total games played and the "best game" (minimum guesses).
        - **New Users**: Greets them and initializes their profile in the `users` table.
* **State Management**:
    - Uses Bash variables to track the current game's guess count and compares it with the stored `best_game` to conditionally update the record.
* **Data Integrity & Validation**:
    - Integrated Regex in Bash to ensure user inputs are integers, preventing script crashes and database errors.
* **SQL Operations**:
    - Utilizes `INSERT` for new users and `UPDATE` for existing stats, combined with `JOIN` style logic (implicitly) to link games to usernames.

## 🚀 Key Skills Demonstrated
* **Integrated Logic**: Combining computational math (random number generation) with persistent storage.
* **Conditional UI**: Tailoring terminal output based on database query results.
* **Edge Case Handling**: Managing the logic for when a user ties or breaks their previous "Best Game" record.

## 🏗️ Logic Workflow
1. Prompt for username.
2. Check database for user.
3. If exists: Display `games_played` and `best_game`.
4. If not: Insert new user and welcome them.
5. Execute guessing loop:
    - Increment counter for each guess.
    - Validate integer input.
    - Give "higher/lower" hints.
6. On win: Update `games_played` and check if the current score is the new `best_game`.
