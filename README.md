parking
============

acmX real-time campus parking information.

Web
---
  - Austin Diviness
  - Andrew DeMaria

### Database Design 
#### Case 1:
The sensors just measure delta in cars
- Parking Lot
    - Location
    - Max_capacity
- Event
    - Car_delta
        - Positive | Car into parking lot
        - Negative | Car out of parking lot
    - Time
    - Day

Parking Lot has many Events

#### Case 2:
The sensors provide some sense of exact spaces being occupied/unoccupied
- Parking Lot
    - Lot_Location (in regards to campus)
    - Max_capacity
- Parking Space
    - Status
        - Occupied / Unoccupied
    - Space_Location (in regards to the lot)
        - Row
        - offset

          r1    r2    r3  r4
          ---------  ---------
           0  - 0     0  -  0
          ---------  ---------
           1  - 1     1  -  1
          ---------  ---------
           2  - 2     2  -  2
          ---------  ---------
           3  - 3     3  -  3
          ---------  ---------
           4  - 4  
          --------- 

Parking Lot has many Parking Spaces

Do we still need a sense of events for history tracking?

Hardware
---

Hub
---

Mobile
---
