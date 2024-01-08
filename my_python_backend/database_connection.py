import mysql.connector
from mysql.connector import Error

def create_server_connection(host_name, user_name, db_name, user_password=None):
    connection = None
    try:
        if user_password:
            connection = mysql.connector.connect(
                host=host_name,
                user=user_name,
                password=user_password, 
                database=db_name
            )
        else:
            connection = mysql.connector.connect(
                host=host_name,
                user=user_name,
                database=db_name
            )            
        print("MySQL Database connection successful")
    except Error as err:
        print(f"Error: '{err}'")

    return connection

# Replace the following details with your MySQL server details
host = "localhost"
username = "root"
database = "firstaid"

# Establish a database connection
connection = create_server_connection(host, username, database, "")

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query successful")
    except Error as err:
        print(f"Error: '{err}'")

def read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as err:
        print(f"Error: '{err}'")

def authenticate_user(connection, email, password):
    cursor = connection.cursor(dictionary=True)
    try:
        cursor.execute("SELECT * FROM user WHERE email = %s AND password = %s", (email, password))
        user = cursor.fetchone()  # Fetches one record or None
        return user
    except Error as err:
        print(f"Error: '{err}'")
        return None


def insert_user(connection, name, surname, email, phone_number, gender, age, blood_type, rh_factor, password):
    cursor = connection.cursor()
    try:
        cursor.execute("""
            INSERT INTO user (password, name, surname, email, phone_number, gender, age, blood_type, rh_factor)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);
            """, (password, name, surname, email, phone_number, gender, age, blood_type, rh_factor))
        connection.commit()
        return cursor.lastrowid  # Returns the ID of the newly inserted user
    except Error as err:
        print(f"Error: '{err}'")
        return None

def get_user_by_id(connection, user_id):
    cursor = connection.cursor(dictionary=True)
    try:
        cursor.execute("SELECT * FROM user WHERE user_id = %s", (user_id,))
        user = cursor.fetchone()
        return user
    except Error as err:
        print(f"Error: '{err}'")
        return None
    
def update_user(connection, user_id, name, surname, email, phone_number, gender, age, blood_type, rh_factor, points):
    cursor = connection.cursor()
    try:
        cursor.execute("""
            UPDATE user 
            SET name = %s, surname = %s, email = %s, phone_number = %s, gender = %s, age = %s, blood_type = %s, rh_factor = %s, points = %s
            WHERE user_id = %s;
            """, (name, surname, email, phone_number, gender, age, blood_type, rh_factor, points, user_id))
        connection.commit()
    except Error as err:
        print(f"Error: '{err}'")
