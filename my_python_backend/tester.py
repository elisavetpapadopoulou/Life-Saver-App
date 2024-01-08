from database_connection import connection, insert_user, authenticate_user, get_user_by_id, update_user, read_query, execute_query
'''
# Test insert_user function
new_user_id = insert_user(connection, "John", "Doe", "johndoe@example.com", "123456789", "Male", 30, "O", "+", "password123")
print(f"New user ID: {new_user_id}")


# Test authenticate_user function
user_email = "jane@example.com"
user_password = "password123"  # Assuming you have hashed passwords in the database
authenticated_user = authenticate_user(connection, user_email, user_password)
if authenticated_user:
    print(f"Authenticated User: {authenticated_user}")
else:
    print("Authentication failed.")

# Test get_user_by_id function
user_id = 1  # Replace with an actual user_id from your database
user_data = get_user_by_id(connection, user_id)
if user_data:
    print(f"User Data: {user_data}")
else:
    print("User not found.")

# Test update_user function
update_user_id = 1  # Replace with an actual user_id from your database
update_user(connection, update_user_id, "Jane", "Doe", "jane@example.com", "987654321", "Female", 28, "O", "-", 200)
print("User updated successfully.")

# Test read_query function
read_query_sql = "SELECT * FROM user;"
users = read_query(connection, read_query_sql)
if users:
    for user in users:
        print(user)
else:
    print("No users found.")

# Sample SQL query to insert a new badge
insert_badge_sql = "INSERT INTO badges (name) VALUES ('Achievement Unlocked');"

# Test execute_query function for a sample query (like inserting a badge)
insert_badge_sql = "INSERT INTO badges (name) VALUES ('New Badge');"
execute_query(connection, insert_badge_sql)
print("Badge inserted successfully.")
'''
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World!"

if __name__ == '__main__':
    app.run(debug=True)
