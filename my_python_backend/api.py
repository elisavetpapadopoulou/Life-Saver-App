from flask import Flask, request, jsonify
import database_connection as db_conn

app = Flask(__name__)

# MySQL server details
MYSQL_HOST = "localhost"
MYSQL_USER = "root"
MYSQL_DB = "firstaid"
# MYSQL_PASSWORD = "yourpassword"  # Uncomment and add as an argument if you have a password

@app.route('/api/signup', methods=['POST'])
def signup():
    user_data = request.get_json()
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)  # Add password as a fourth argument if needed
    user_id = db_conn.insert_user(connection, **user_data)
    connection.close()
    if user_id:
        return jsonify({"message": "User created successfully", "user_id": user_id}), 201
    else:
        return jsonify({"message": "Signup failed"}), 500

@app.route('/api/login', methods=['POST'])
def login():
    credentials = request.get_json()
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    user = db_conn.authenticate_user(connection, credentials['email'], credentials['password'])
    connection.close()
    if user:
        return jsonify({"message": "Login successful", "user": user}), 200
    else:
        return jsonify({"message": "Invalid credentials"}), 401

@app.route('/api/user/<int:user_id>', methods=['GET'])
def get_user_profile(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    user = db_conn.get_user_by_id(connection, user_id)
    connection.close()
    if user:
        return jsonify(user), 200
    else:
        return jsonify({"message": "User not found"}), 404

@app.route('/api/user/<int:user_id>', methods=['PUT'])
def update_user_profile(user_id):
    update_data = request.get_json()
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    db_conn.update_user(connection, user_id, **update_data)
    connection.close()
    return jsonify({"message": "User updated successfully"}), 200


def verify_and_update_password(user_id, old_password, new_password, connection):
    cursor = connection.cursor()
    try:
        # Fetch the user's current password from the database
        cursor.execute("SELECT password FROM user WHERE user_id = %s", (user_id,))
        result = cursor.fetchone()
        if result is None:
            cursor.close()
            return False  # User not found

        current_password = result[0]

        # Verify the old password
        if old_password.strip() != current_password.strip():
            cursor.close()
            return False  # Old password does not match

        # Update to the new password in the database
        cursor.execute("UPDATE user SET password = %s WHERE user_id = %s", (new_password, user_id))
        connection.commit()

    except Exception as e:
        print(f"Database error: {e}")
        cursor.close()
        return False  # Database error occurred
    else:
        cursor.close()
        return True  # Password update successful


@app.route('/api/user/<int:user_id>/change-password', methods=['PUT'])
def change_user_password(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    data = request.get_json()
    old_password = data.get('oldPassword')
    new_password = data.get('newPassword')

    success = verify_and_update_password(user_id, old_password, new_password, connection)

    if success:
        return jsonify({"message": "Password updated successfully"}), 200
    else:
        return jsonify({"message": "Password update failed"}), 400


@app.route('/api/user/<int:user_id>/medications', methods=['GET'])
def get_user_medications(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    medications = db_conn.get_user_medications(connection, user_id)  # Implement this function in db_conn
    connection.close()
    return jsonify(medications), 200

@app.route('/api/user/<int:user_id>/medications', methods=['POST'])
def add_user_medication(user_id):
    try:
        medication = request.get_json()
        print("Received medication data:", medication)  # Log received data

        connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
        result = db_conn.add_medication(connection, user_id, medication['name'])
        connection.close()

        if result:
            return jsonify({"message": "Medication added successfully"}), 200
        else:
            return jsonify({"message": "Failed to add medication"}), 500
    except Exception as e:
        print("Error:", e)  # Log any exceptions
        return jsonify({"message": "Internal Server Error"}), 500


@app.route('/api/user/<int:user_id>/medications', methods=['DELETE'])
def remove_user_medication(user_id):
    medication = request.get_json()
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    result = db_conn.remove_medication(connection, user_id, medication['name'])  # Implement this function in db_conn
    connection.close()
    return jsonify({"message": "Medication removed successfully"}) if result else jsonify({"message": "Failed to remove medication"}), 200 if result else 500

@app.route('/api/user/<int:user_id>/allergies', methods=['GET'])
def get_user_allergies(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    allergies = db_conn.get_user_allergies(connection, user_id)  # Implement this function in db_conn
    connection.close()
    return jsonify(allergies), 200

@app.route('/api/user/<int:user_id>/allergies', methods=['POST'])
def add_user_allergy(user_id):
    try:
        allergy = request.get_json()
        print("Received medication data:", allergy)  # Log received data

        connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
        result = db_conn.add_allergy(connection, user_id, allergy['name'])
        connection.close()

        if result:
            return jsonify({"message": "Allergy added successfully"}), 200
        else:
            return jsonify({"message": "Failed to add allergy"}), 500
    except Exception as e:
        print("Error:", e)  # Log any exceptions
        return jsonify({"message": "Internal Server Error"}), 500


@app.route('/api/user/<int:user_id>/allergies', methods=['DELETE'])
def remove_user_allergy(user_id):
    allergy = request.get_json()
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    result = db_conn.remove_allergy(connection, user_id, allergy['name'])  # Implement this function in db_conn
    connection.close()
    return jsonify({"message": "Allergy removed successfully"}) if result else jsonify({"message": "Failed to remove allergy"}), 200 if result else 500

if __name__ == '__main__':
    app.run(debug=True)