
# CraftMingle

CraftMingle is a Java Full Stack marketplace designed for local artisans to showcase and sell their crafts. The platform offers secure transactions, a user-friendly interface, and smooth browsing for users. Whether you're an artisan looking to sell your creations or a buyer looking for unique, handcrafted items, CraftMingle provides a seamless experience.

## Key Features

- **Marketplace for Artisans**: A platform for artisans to display and sell their crafts.
- **Secure Transactions**: Ensures safe and encrypted transactions for buyers and sellers.
- **User-Friendly Interface**: Simple and intuitive UI that allows users to easily browse and purchase items.
- **Smooth Browsing Experience**: Efficient navigation through a wide range of handmade items.
- **Search and Filter**: Users can search and filter products based on categories, price, and other criteria.
- **Order Management**: Artisans can manage orders, update stock, and track sales.

## Tech Stack

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java Servlets
- **Database**: MySQL
- **Version Control**: Git, GitHub

## Repository

You can access the project's repository [here](https://github.com/harinireddy0611/CraftMingle).

## Installation Guide

To get started with CraftMingle on your local machine, follow these steps:

### Prerequisites

- **Java 8 or later** installed on your system.
- **Apache Tomcat** (or any Java Servlet container) for running the application.
- **MySQL** installed and running.
- **Git** for version control.

### Step-by-Step Installation

1. **Clone the Repository**

   First, clone the repository to your local machine using the following command:

   ```bash
   git clone https://github.com/harinireddy0611/CraftMingle.git
   ```

2. **Navigate to the Project Directory**

   Go to the project directory:

   ```bash
   cd CraftMingle
   ```

3. **Set Up the Database**

   - Install MySQL if you haven't already.
   - Create a new database for the project (e.g., `craftmingle_db`).
   - Configure the database connection details in the `db.properties` file located in the `WEB-INF` directory.
     Example configuration:
     
     ```properties
     db.url=jdbc:mysql://localhost:3306/craftmingle_db
     db.username=root
     db.password=yourpassword
     ```

4. **Deploy the Application on Apache Tomcat**

   - Install Apache Tomcat if you haven't already.
   - Copy the project directory into the `webapps` folder of your Tomcat installation.
   - If you're using an IDE (such as IntelliJ IDEA or Eclipse), deploy the project by configuring it in the IDE's Tomcat server setup.

5. **Build and Run the Project**

   - After setting up Tomcat, you can either run the server from your IDE or start it manually by running the following command from the Tomcat bin directory:
   
     ```bash
     ./startup.sh   # On Linux/Mac
     startup.bat    # On Windows
     ```

6. **Access the Application**

   Once the application is running, open your web browser and go to `http://localhost:8080/CraftMingle` to access the CraftMingle platform.

## Contributing

If you'd like to contribute to CraftMingle, feel free to fork the repository and submit pull requests. Please ensure that your code adheres to the existing coding standards and includes tests where appropriate.


