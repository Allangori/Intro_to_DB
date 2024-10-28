import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server (without specifying a database initially)
    connection = mysql.connector.connect(
        host="localhost",            # Adjust if your MySQL server is hosted elsewhere
        user="root",        # Replace with your MySQL username
        password="Daisy20)"     # Replace with your MySQL password
    )

    if connection.is_connected():
        print("Connected to MySQL server.")

        # Create a cursor to execute SQL commands
        cursor = connection.cursor()

        # Create the alx_book_store database if it doesn't exist
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database 'alx_book_store' created successfully!")

except mysql.connect.Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    # Close the cursor and connection if they were opened
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
    print("MySQL connection is closed.")
