# 💇 Salon Appointment Scheduler (Project 3)

## 📝 Project Overview
This project is an interactive CLI (Command Line Interface) application that manages a salon's appointment booking system. It integrates a Bash script frontend with a PostgreSQL backend to handle real-time user inputs, customer registrations, and scheduling.

## 🛠️ Technical Highlights
* **Interactive Logic Flow**: Built a dynamic menu system using Bash `while` loops and `case` statements that guides users through service selection.
* **Relational Data Persistence**:
    - **Customer Identification**: Logic to check if a customer exists by phone number; if not, automatically prompts for a name and creates a new record.
    - **Transaction Handling**: Links `customer_id`, `service_id`, and `time` into an `appointments` table.
* **Advanced Bash Scripting**:
    - Used `psql --tuples-only` to fetch clean data from the database.
    - Implemented variable piping and string manipulation to provide a personalized user experience (e.g., "I have put you down for a [service] at [time], [name].").

## 🚀 Key Skills Demonstrated
* **Flow Control**: Managing complex `if/else` branches based on database query results.
* **Input Sanitization**: Handling user inputs to ensure the database receives valid data.
* **Schema Design**: Utilizing a three-table relational structure (`customers`, `services`, `appointments`) with foreign key constraints to maintain referential integrity.

## 🏗️ Logic Workflow
1. Display list of available services from the `services` table.
2. Prompt user for `service_id` (loop back if invalid).
3. Prompt for `phone_number`.
4. If phone number is new, prompt for `customer_name` and insert into `customers`.
5. Prompt for appointment `time`.
6. Insert appointment details and confirm with a formatted success message.
