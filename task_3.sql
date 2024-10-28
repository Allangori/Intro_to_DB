import mysql.connector
from mysql.connector import Error

try:
    # Connect to the alx_book_store database
    connection = mysql.connector.connect(
        host="localhost",            # Adjust if your MySQL server is hosted elsewhere
        user="your_username",        # Replace with your MySQL username
        password="your_password",    # Replace with your MySQL password
        database="alx_book_store"    # Connect to the alx_book_store database
    )

    if connection.is_connected():
        print("Connected to the alx_book_store database.")

        # Create a cursor object
        cursor = connection.cursor()

        # Query to show all tables
        cursor.execute("SHOW TABLES;")

        # Fetch all tables and print them
        tables = cursor.fetchall()
        print("Tables in 'alx_book_store' database:")
        for table in tables:
            print(table[0])

except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    # Ensure the connection is closed
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
    print("MySQL connection is closed.")
