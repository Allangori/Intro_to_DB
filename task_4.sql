sql_query = """
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT, COLUMN_KEY, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'your_database_name' AND TABLE_NAME = 'books';
"""

file_name = 'task_4.sql'

with open(file_name, 'w') as file:
    file.write(sql_query)

print(f'SQL query written to {file_name}')

