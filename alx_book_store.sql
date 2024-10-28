import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password ="Daisy20)"
    )

    if connection.is_connected():
        print("Connected to MySQL server")
        cursor = connection.cursor()

        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database created successfully or already exists.")

        cursor.execute("USE alx_book_store;")
        print("Switched to alx_book_store database.")

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS Authors (
                author_id INT PRIMARY KEY AUTO_INCREMENT,
                author_name VARCHAR(215) NOT NULL
            );
        """)
        print("Authors table created.")

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS Books (
                book_id INT PRIMARY KEY AUTO_INCREMENT,
                title VARCHAR(130) NOT NULL,
                author_id INT,
                price DOUBLE,
                publication_date DATE,
                FOREIGN KEY (author_id) REFERENCES Authors(author_id)
            );
        """)
        print("Books table created.")

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS Customers (
                customer_id INT PRIMARY KEY AUTO_INCREMENT,
                customer_name VARCHAR(215) NOT NULL,
                email VARCHAR(215) UNIQUE NOT NULL,
                address TEXT
            );
        """)
        print("Customers table created.")

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS Orders (
                order_id INT PRIMARY KEY AUTO_INCREMENT,
                customer_id INT,
                order_date DATE,
                FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
            );
        """)
        print("Orders table created.")

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS Order_Details (
                orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
                order_id INT,
                book_id INT,
                quantity DOUBLE,
                FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                FOREIGN KEY (book_id) REFERENCES Books(book_id)
            );
        """)
        print("Order_Details table created.")

        connection.commit()
        print("All tables created and committed successfully.")

except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    # Close the cursor and connection if they were opened
    if 'cursor' in locals() and cursor.is_connected():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
    print("MySQL connection is closed.")
