sql_query = """
SELECT COLUMN_NAME, COLUMN_TYPE, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT, COLUMN_KEY, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books';
"""

file_name = 'task_4.sql'

with open(file_name, 'w') as file:
    file.write(sql_query)

print(f'SQL query written to {file_name}')

