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

        # Query to get full description of books table
        query = """
            SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, EXTRA
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'books';
        """

        # Execute the query
        cursor.execute(query)

        # Fetch and print the description of each column in the books table
        columns_description = cursor.fetchall()
        print("Description of 'books' table:")
        for column in columns_description:
            print(f"Column Name: {column[0]}, Type: {column[1]}, Nullable: {column[2]}, Key: {column[3]}, Extra: {column[4]}")

except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    # Ensure the connection is closed
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
    print("MySQL connection is closed.")
