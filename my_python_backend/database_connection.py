import mysql.connector
from mysql.connector import Error

def create_server_connection(host_name, port, user_name, db_name, user_password=None):
    connection = None
    try:
        if user_password:
            connection = mysql.connector.connect(
                host=host_name,
                user=user_name,
                port = port,
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
port = 3306
username = "root"
database = "firstaid"

# Establish a database connection
connection = create_server_connection(host, port, username, database, "")

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

def create_server_connection(host_name, user_name, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            database=db_name
            # Add 'password' if needed
        )
        print("MySQL Database connection successful")
    except Exception as err:
        print(f"Error: '{err}'")

    return connection

def get_user_medications(connection, user_id):
    cursor = connection.cursor(dictionary=True)
    query = """
    SELECT name FROM user_medications WHERE user_id = %s;
    """
    cursor.execute(query, (user_id,))
    return [row["name"] for row in cursor.fetchall()]

def add_medication(connection, user_id, medication_name):
    cursor = connection.cursor()
    query = """
    INSERT INTO user_medications (user_id, name) VALUES (%s, %s);
    """
    cursor.execute(query, (user_id, medication_name))
    connection.commit()


def remove_medication(connection, user_id, medication_name):
    cursor = connection.cursor()
    query = """
    DELETE FROM user_medications WHERE user_id = %s AND name = %s;
    """
    cursor.execute(query, (user_id, medication_name))
    connection.commit()

def get_user_allergies(connection, user_id):
    cursor = connection.cursor(dictionary=True)
    query = """
    SELECT name FROM user_allergies WHERE user_id = %s;
    """
    cursor.execute(query, (user_id,))
    return [row["name"] for row in cursor.fetchall()]

def add_allergy(connection, user_id, allergy_name):
    cursor = connection.cursor()
    query = """
    INSERT INTO user_allergies (user_id, name) VALUES (%s, %s);
    """
    cursor.execute(query, (user_id, allergy_name))
    connection.commit()


def remove_allergy(connection, user_id, allergy_name):
    cursor = connection.cursor()
    query = """
    DELETE FROM user_allergies WHERE user_id = %s AND name = %s;
    """
    cursor.execute(query, (user_id, allergy_name))
    connection.commit()