import mysql.connector
from mysql.connector import Error


def create_tables(connection):
    tables = {
        "authors": """
            CREATE TABLE IF NOT EXISTS authors (
                author_id INT PRIMARY KEY AUTO_INCREMENT,
                author_name VARCHAR(215) NOT NULL
            );
        """,
        "books": """
            CREATE TABLE IF NOT EXISTS books (
                book_id INT PRIMARY KEY AUTO_INCREMENT,
                title VARCHAR(130) NOT NULL,
                author_id INT,
                price DOUBLE,
                publication_date DATE,
                FOREIGN KEY (author_id) REFERENCES authors(author_id)
            );
        """,
        "customers": """
            CREATE TABLE IF NOT EXISTS customers (
                customer_id INT PRIMARY KEY AUTO_INCREMENT,
                customer_name VARCHAR(215) NOT NULL,
                email VARCHAR(215) UNIQUE NOT NULL,
                address TEXT
            );
        """,
        "orders": """
            CREATE TABLE IF NOT EXISTS orders (
                order_id INT PRIMARY KEY AUTO_INCREMENT,
                customer_id INT,
                order_date DATE,
                FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
            );
        """,
        "order_details": """
            CREATE TABLE IF NOT EXISTS order_details (
                orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
                order_id INT,
                book_id INT,
                quantity DOUBLE,
                FOREIGN KEY (order_id) REFERENCES orders(order_id),
                FOREIGN KEY (book_id) REFERENCES books(book_id)
            );
        """
    }

    cursor = connection.cursor()

    for table_name, create_table_query in tables.items():
        try:
            cursor.execute(create_table_query)
            print(f"Table '{table_name}' created successfully.")
        except Error as e:
            print(f"Error creating table '{table_name}':", e)

    cursor.close()

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Daisy20)",
        database="alx_book_store"
    )

    if connection.is_connected():
        print("Connected to the alx_book_store database.")
        
        
        create_tables(connection)
        connection.commit()  
except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    if 'connection' in locals() and connection.is_connected():
        connection.close()
    print("MySQL connection is closed.")
