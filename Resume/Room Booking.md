# High-Level Overview

> "This is a Flask-based Room Booking Management System that uses MongoDB as the database. It supports two types of users: Admin and Normal Users. Authentication for normal users is implemented using JWT tokens stored in HTTP-only cookies, while the admin login uses Flask sessions."

The application has four main components:

- Flask (Backend)
- MongoDB (Database)
- JWT Authentication
- HTML Templates (Frontend)

---

# Imports

```
from flask import Flask, render_template, request, g, redirect, url_for, flash, make_response, session
```

These are Flask utilities.

|Import|Purpose|
|---|---|
|Flask|Creates the application|
|render_template|Renders HTML pages|
|request|Gets form data from users|
|redirect|Redirects to another route|
|url_for|Generates URLs|
|flash|Displays messages|
|session|Stores server-side session data|
|make_response|Creates HTTP responses|
|g|Stores data for one request|

---

```
from pymongo import MongoClient
```

Used to connect Flask with MongoDB.

---

```
from bson.objectid import ObjectId
```

MongoDB IDs are ObjectIds.

Needed when deleting documents.

---

```
import bcrypt
```

Used for password hashing.

Instead of storing

```
123456
```

it stores

```
$2b$12$Asdfasdfasd...
```

This is much safer.

---

```
import jwt
```

Implements JSON Web Tokens.

JWT allows stateless authentication.

---

```
from functools import wraps
```

Used when creating decorators like

```
@login_required
```

---

```
from datetime import datetime, timedelta
```

Used to create token expiry.

Example:

```
Current time+1 hour=Expiry time
```

---

```
import pandas as pd
```

Used only for displaying accepted bookings.

---

```
from House_details import get_house_info
```

Loads room/house information from another Python file.

---

# Creating Flask Application

```
application = Flask(__name__)
```

Creates the Flask app.

---

```
application.secret_key = "hello"
```

Used by Flask Sessions.

Without this,

```
session["is_admin"]
```

would not work.

---

# JWT Settings

```
JWT_ALGORITHM = "HS256"
```
`"HS256"` stands for **HMAC using SHA-256**.

Algorithm used to sign JWT.
## HS256 vs. RS256 (The Alternative)

When dealing with JWTs, you will almost always choose between `HS256` and `RS256`.

| **Feature**   | **HS256**                                                                       | **RS256**                                                                                                                                     |
| ------------- | ------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| **Type**      | Symmetric                                                                       | Asymmetric                                                                                                                                    |
| **Keys Used** | **One secret key** shared by everyone who signs or verifies.                    | **A key pair:** A Private key (to sign) and a Public key (to verify).                                                                         |
| **Speed**     | Fast                                                                            | Slower (computationally heavier)                                                                                                              |
| **Best For**  | Internal monolithic apps where only one server handles login and data fetching. | Microservices or Third-party APIs where one server issues tokens, but external servers need to verify them without knowing the master secret. |

---

```
JWT_EXP_SECONDS = 3600
```

JWT expires after

```
3600 seconds
```

which is

```
1 hour
```

---

# MongoDB Connection

```
client = MongoClient(connection_string)
```

Connects to MongoDB.

---

```
db = client['Room_booking']
```

Uses database

```
Room_booking
```

---

Collections

```
reservationscollectionusers
```

These are equivalent to SQL tables.

|MongoDB|SQL|
|---|---|
|Database|Database|
|Collection|Table|
|Document|Row|

---

# House Information

```
house_info = get_house_info()
```

Loads all available houses.

Probably returns

```
{    "H1":{        "rooms":3,        "description":"..."    }}
```

---

# JWT Creation

```
def create_token(user):
```

This function creates a JWT after login.

Payload contains

```
{"user_id","username","role","exp"}
```

Then

```
jwt.encode(...)
```

creates a signed token.

---

# token_required Decorator

```
@token_required
```

This protects routes.

Flow

```
Request↓Read Cookie↓Decode JWT↓If valid↓Allow accessElse↓Redirect login
```

---

```
g.user
```

Stores decoded user information.

Later,

```
g.user["username"]
```

can be accessed anywhere in the request.

---

# Admin Authentication

Instead of JWT

Admin uses

```
session["is_admin"]
```

This is Flask Session Authentication.

---

Decorator

```
@admin_required
```

Checks

```
if not session.get("is_admin"):
```

If not logged in

↓

Redirect to login.

---

# Route

```
@application.route('/')
```

Displays

```
login.html
```

---

# Add User

Only admin can access.

Flow

```
GET↓Display formPOST↓Receive username↓Check duplicate↓Hash password↓Insert into MongoDB
```

Password hashing

```
bcrypt.hashpw(...)
```

Very important because passwords are never stored in plain text.

---

# Login

```
authenticate()
```

This is the main authentication logic.

Flow

```
Receive username/password↓Admin?↓Yes↓Create Flask Session↓Open Admin Dashboard
```

Otherwise

```
Search MongoDB↓User Found?↓Verify bcrypt password↓Create JWT↓Store JWT in Cookie↓Redirect Dashboard
```

---

# Cookie

```
resp.set_cookie(...)
```

Stores

```
access_token
```

Browser automatically sends this cookie with future requests.

---

```
httponly=True
```

JavaScript cannot access it.

Protects against XSS attacks.

---

# Logout

```
session.clear()
```

Removes admin session.

---

```
delete_cookie()
```

Deletes JWT.

---

# User Dashboard

```
@index1
```

Protected using

```
@token_required
```

Only logged-in users can open it.

---

# Search Available Houses

```
submit()
```

User enters

```
Check-inCheck-outRooms Needed
```

For every house

Program checks

```
Enough rooms?↓Existing reservation?↓If no↓Available
```

Reservation overlap logic

```
{"check_in":{"$lte":check_out},"check_out":{"$gte":check_in}}
```

This detects overlapping bookings.

---

Example

Existing booking

```
10 Jun↓15 Jun
```

New booking

```
12 Jun↓18 Jun
```

These overlap.

Therefore booking is rejected.

---

# Book

Simply forwards

```
House IDCheck-inCheck-out
```

to guest details form.

---

# Submit Booking

```
form_data = dict(request.form)
```

Converts HTML form into dictionary.

Adds

```
status="pending"
```

and

```
requested_by=username
```

Then

```
insert_one()
```

stores booking.

---

# Admin Panel

Shows

```
status="pending"
```

bookings.

Admin can

```
AcceptReject
```

If rejected

```
Reason
```

can also be stored.

MongoDB Update

```
update_one(...)
```

updates booking status.

---

# Accepted Bookings

Reads accepted bookings

↓

Creates Pandas DataFrame

↓

Converts back to dictionary

↓

Displays HTML

Pandas is not actually required here.

---

# Add Rooms

Admin submits form

↓

Inserted into

```
Rooms Collection
```

---

# View Rooms

Fetches every room

↓

Displays them.

---

# Delete Room

```
ObjectId(id)
```

Converts string

```
"6865..."
```

into MongoDB ObjectId.

Then

```
delete_one()
```

removes the room.

---

# Application Start

```
if __name__ == "__main__":
```

Runs

```
application.run(debug=True)
```

Only when this file is executed directly.

---

# Complete Flow
```
                Login Page
                     │
          username/password
                     │
        ┌────────────┴────────────┐
        │                         │
      Admin                    User
        │                         │
 Flask Session               JWT Token
        │                         │
        ▼                         ▼
 Admin Dashboard          User Dashboard
        │                         │
        │                    Search Rooms
        │                         │
        │                  Available Houses
        │                         │
        │                     Book House
        │                         │
        │                  Guest Details
        │                         │
        │                 Save Reservation
        │                         │
        └────────────► Pending Booking
                              │
                              ▼
                      Admin Approves
                              │
                  Accepted / Rejected
```

## Interview strengths to highlight

When explaining this code in an interview, emphasize these design concepts:

- **Authentication:** Uses **JWT** for normal users and **Flask sessions** for the admin.
- **Authorization:** Custom decorators (`@token_required` and `@admin_required`) protect routes based on the user's identity.
- **Security:** Passwords are hashed with **bcrypt**, JWTs have an expiry time, and tokens are stored in **HTTP-only cookies** to reduce XSS risk.
- **Database:** Uses **MongoDB** with separate collections (`users`, `reservations`, and `Rooms`) and performs CRUD operations using PyMongo.
- **Booking logic:** Prevents double-booking by checking for **overlapping date ranges** before confirming room availability.
- **Flask architecture:** Organizes the application around routes, templates, decorators, and helper functions to keep responsibilities separated.