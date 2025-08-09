# 🍪 Cookie Store App

A multi-user cookie shopping experience built with **UIKit**, **Storyboard**, and **in-memory data management**. Designed for MAP523 Midterm Project.

##  App Overview

The Cookie Store App allows users to:
- Log in as one of three predefined users.
- Browse a selection of cookies for sale.
- Purchase cookies with optional variants and stock constraints.
- View personalized purchase history.
- Share cookie inventory across all users.

##  User Credentials

| Username | Password   |
|----------|------------|
| alice    | wonderland |
| bob      | builder    |
| charlie  | chocolate  |

Each user has their **own purchase history**, but all share a **global cookie inventory**.

---

##  Features

### 1. Login Screen
- Hardcoded user credentials
- Transitions to the app via `UITabBarController`
- Resets login fields after logout

### 2. Item List Screen (Tab 1)
- TableView using a custom cell (`CookieCell`)
- Displays:
  - 🍪 Cookie image
  - 📝 Cookie name
  - 💰 Cookie price
- Tap to navigate to Purchase screen

### 3. Purchase Screen
- Displays selected cookie image and name
- Quantity Picker:
  - Single variant ➜ One column (quantity only)
  - Multiple variants ➜ Two columns (variant + quantity)
- Dynamic total price
- Buy button:
  - Reduces inventory
  - Records purchase to current user's history
  - Alerts success or out-of-stock

### 4. Sales History Screen (Tab 2)
- TableView showing current user’s past purchases
- Each cell displays:
  - Cookie name & variant
  - Quantity
  - Purchase date (e.g., `16/06/25`)

### 5. Multi-User & Logout
- Users can log out and log in as others
- Shared inventory reflects in real-time across users
- Logout button available in navigation bar on both tabs

---

Compatible with Xcode 15.2 and iOS 17+

