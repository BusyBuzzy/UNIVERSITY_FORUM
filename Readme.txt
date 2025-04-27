Welcome to the Role-Based Web System by Team Complex

This README provides clear instructions to help you set up and run the application on your local machine.  

Getting Started

If you plan to host this system online, you will need a domain name and hosting service. However, for testing or development purposes, you can run it locally without any cost.

Local Installation Guide

Follow the steps below to set up the system on your PC:

1. Install a Local Development Environment
   We recommend using [XAMPP](https://www.apachefriends.org/index.html), as it is cross-platform and works on Windows, macOS, and Linux.  
   Alternatively, you may use MAMP, LAMP, or WAMP if preferred.

2. Place the Project Files
   - Install XAMPP on your system.
   - Move the project folder into the `htdocs` directory of your XAMPP installation.


3. Run the System
   - Open your browser and navigate to:  
     `http://localhost/your_project_folder/index.php`
   - Log in as Admin using the credentials:
     - Email: `khin@gmail.com`
     - Password: `123`

4. User Management
   - Only an admin can create user accounts.
   - Ensure the email entered during user creation is valid and a Gmail address, as it is required for proper communication features.

 Database Setup

> ⚠️ Important: This system will not work without the database.

- Create a new database in phpMyAdmin named: `tc_ewsd1`
- Import the provided SQL file (`tc_ewsd1.sql`) into this database.

---

 ✅ You're all set!
Thank you for using the system developed by Team Complex. We hope it serves your needs well.

Enjoy!  
😉