# Apartment Management System

This project is a full-fledged web application designed to streamline apartment management for residents, owners, and administrators. It leverages a robust database structure powered by MySQL to effectively maintain information about apartments, residents, events, and staff.

## Features

- **Apartment Listings:** Clients can conveniently browse through available apartments, including their types (2 BHK, 3 BHK, 4 BHK) and rent details. Apartment owners have the ability to manage their listings and contact information.

- **Event Management:** Residents can stay informed about upcoming and past events within the society, fostering a sense of community and engagement.

- **Resident Portal:** Residents can access a dedicated portal to view events they have participated in, manage their personal information, and stay updated on society matters.

- **Administrative Dashboard:** Administrators are equipped with a comprehensive dashboard, granting them full control over the database. They can add, edit, and remove information pertaining to apartments, residents, staff, events, and various other aspects of the system.

## Tech Stack

### Backend

- **MySQL:** A powerful relational database management system for efficient data storage and retrieval.
  - **Database Structure:**
    ```plaintext
    +---------------------+
    | Tables_in_ams        |
    +---------------------+
    | apartment            |
    | apartment_owner      |
    | available_rooms      |
    | events               |
    | resident_conducts    |
    | residents            |
    | residents_doj        |
    | role                 |
    | staff                |
    | staff_works          |
    | visitors             |
    +---------------------+
    ```
- **Node.js:** A popular JavaScript runtime environment enabling server-side development.

- **Express.js:** A flexible and versatile web application framework built on top of Node.js.

### Frontend

- **HTML:** The foundation for structuring and presenting content within the web application.

- **CSS:** Responsible for styling and defining the visual appearance of the application.

- **JavaScript:** Adds interactivity and dynamic behavior to the user interface.

## Benefits

- **Improved Organization and Efficiency:** Streamlined database management simplifies data access and manipulation, enhancing overall organization and efficiency.

- **Enhanced Transparency and Communication:** Residents, owners, and administrators gain access to centralized information, fostering clarity and communication.

- **Simplified Management:** The system empowers administrators to effortlessly manage various aspects of the apartment complex, reducing manual tasks and potential errors.
