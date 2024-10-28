sql_content = """
USE alx_book_store;

INSERT INTO customer (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');
"""

with open("task_5.sql", "w") as file:
    file.write(sql_content)

print("task_5.sql created successfully!")
