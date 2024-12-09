# Airline Booking System

This project is a relational database design and implementation for an airline booking system. It provides functionality for ticket reservations, flight information, and payment processing.

## Project Goal
The goal of this project is to create a database for an airline booking system that allows users and employees to manage reservations, check flight prices, and inquire about flight details effectively.

## Features
- Manage flights, passengers, tickets, airports, and airlines.
- Process payments using stored credit card details.
- Perform advanced SQL queries like filtering and categorization.
- Create and execute stored procedures.

## Database Design
### Entities:
- **FLIGHT**: Contains flight details (e.g., departure time, price, and date).
- **PASSENGER_PROFILE**: Stores passenger information (e.g., name, phone number).
- **TICKET_INFO**: Maps passengers to flights using tickets.
- **AIRLINE**: Stores airline information.
- **AIRPORT**: Contains airport data (e.g., address).
- **CREDIT_CARD_DETAILS**: Includes passenger payment information.

### Functional Dependencies:
- `Flight_ID → Departure_time, Arrival_time, Total_seats, Price, Flight_date`
- `Profile_ID → First_name, Last_name, Phone_number, Email_ID`
- `Ticket_ID → Flight_ID, Profile_ID`

### ER Diagram
![ER Diagram](ER_diagram.png)

## Example Queries
1. **List flights ordered by flight date:**
   ```sql
   SELECT FLIGHT_ID, FLIGHT_DATE 
   FROM FLIGHT 
   ORDER BY FLIGHT_DATE DESC;
##Procedures
**Compare flight prices with a minimum price:**
```sql
CREATE OR REPLACE PROCEDURE priceCheck (MinPrice NUMBER) AS 
    CURSOR executive IS 
        SELECT Flight_ID, price 
        FROM FLIGHT 
        WHERE price > MinPrice;
BEGIN
    FOR v_cursrec IN executive LOOP 
        DBMS_OUTPUT.PUT_LINE(v_cursrec.Flight_ID || ' ' || v_cursrec.price);
    END LOOP;
END priceCheck;
