# Airline Booking System

This project is a relational database design and implementation for an airline booking system. It provides functionality for ticket reservations, flight information, and payment processing.

## Project Goal
To create a database that allows users and employees to manage reservations, check flight prices, and inquire about flight details effectively.

## Features
- Flight and airport management
- Passenger profile and ticket handling
- Payment processing with credit card details
- Optimized SQL queries for reports and analysis

## Database Design
### ER Diagram
Below is the ER diagram for the airline booking system:

![ER Diagram](ER_digram.png)

### Entities:
- **Flight**
- **Passenger Profile**
- **Ticket Info**
- **Credit Card Details**
- **Airport**
- **Airline**

### Functional Dependencies
- `Flight_ID → Departure_time, Arrival_time, Total_seats, Price, Flight_date`
- `Profile_ID → First_name, Last_name, Phone_number, Email_ID`
- And more...

## Queries
Example queries included:
1. List flights ordered by date.
2. Display the number of credit cards per type.
3. Categorize flights by ticket price.
4. Find the flight with the highest price.

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Airline-Booking-System.git
