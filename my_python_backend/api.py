from flask import Flask, request, jsonify
import database_connection as db_conn

app = Flask(_name_)

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

def delete_user_from_db(connection, user_id):
    cursor = connection.cursor()
    try:
        # Delete user by user_id
        cursor.execute("DELETE FROM user WHERE user_id = %s", (user_id,))
        connection.commit()
        return True
    except Exception as e:
        print(f"Error deleting user: {str(e)}")
        connection.rollback()
        return False
    finally:
        cursor.close()

@app.route('/api/user/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    deleted = delete_user_from_db(connection, user_id)
    connection.close()
    if deleted:
        return jsonify({"message": "User deleted successfully"}), 200
    else:
        return jsonify({"message": "Failed to delete user"}), 500

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


# Assuming you have a MySQL database connection already established
# You should import your database connection module at the top

# Function to fetch user points from the database
def get_user_points_from_database(user_id, connection):
    try:
        # Execute a SQL query to retrieve user points
        cursor = connection.cursor()
        cursor.execute('SELECT points FROM user WHERE user_id = %s', (user_id,))
        result = cursor.fetchone()
        
        if result:
            points = result[0]  # Assuming the points are in the first column
            return points
        else:
            return 0  # User not found or no points
    except Exception as e:
        print(f"Error fetching user points: {e}")
        return 0  # Handle error

# Function to calculate user badge based on points
def calculate_user_badge(user_id, connection):
    try:
        # Fetch user points
        points = get_user_points_from_database(user_id, connection)
        
        if points >= 100:
            return 'Gold'
        elif points >= 50:
            return 'Silver'
        elif points >= 25:
            return 'Bronze'
        else:
            return 'No Badge'  # User has fewer than 25 points
    except Exception as e:
        print(f"Error calculating user badge: {e}")
        return 'No Badge'  # Handle error

# Define your endpoints
@app.route('/api/user/<int:user_id>/points', methods=['GET'])
def get_user_points(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    points = get_user_points_from_database(user_id, connection)
    return jsonify({'points': points})

@app.route('/api/user/<int:user_id>/badge', methods=['GET'])
def get_user_badge(user_id):
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    badge = calculate_user_badge(user_id, connection)
    return jsonify({'badge': badge})

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

# Function to fetch all articles from the database
def fetch_all_articles_from_database(connection):
    try:
        # Execute a SQL query to retrieve all articles
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM articles')
        articles = []
        
        for row in cursor.fetchall():
            article = {
                'article_id': row[0],
                'title': row[1],
                'content': row[2],
                'date_published': row[3],
            }
            articles.append(article)

        return articles
    except Exception as e:
        print(f"Error fetching all articles: {e}")
        return []

# Function to fetch a single article from the database by ID
def fetch_article_from_database(article_id, connection):
    try:
        # Execute a SQL query to retrieve an article by ID
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM articles WHERE article_id = %s', (article_id,))
        row = cursor.fetchone()
        
        if row:
            article = {
                'article_id': row[0],
                'title': row[1],
                'content': row[2],
                'date_published': row[3],
            }
            return article
        else:
            return None  # Article not found
    except Exception as e:
        print(f"Error fetching article by ID: {e}")
        return None  # Handle error

# Define your endpoints
@app.route('/api/articles', methods=['GET'])
def get_all_articles():
    # Replace this with your logic to fetch all articles from the database
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    articles = fetch_all_articles_from_database(connection)
    return jsonify(articles)

@app.route('/api/articles/<int:article_id>', methods=['GET'])
def get_article(article_id):
    # Replace this with your logic to fetch a single article from the database
    connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
    article = fetch_article_from_database(article_id, connection)
    if article:
        return jsonify(article)
    else:
        return jsonify({"message": "Article not found"}), 404


# Endpoint to finish an article and gain points
@app.route('/api/articles/<int:article_id>/finish', methods=['POST'])
def finish_article(article_id):
    try:
        # Implement logic to gain points (e.g., 10 points) and update the user's points in the database
        connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
        user_id = request.json['user_id']  # Assuming you pass the user_id in the request JSON
        points_to_add = 10

        # Execute a SQL query to update the user's points
        cursor = connection.cursor()
        cursor.execute('UPDATE user SET points = points + %s WHERE user_id = %s', (points_to_add, user_id))
        cursor.execute("INSERT INTO read_articles (user_id, article_id, date_read) VALUES (%s, %s, NOW())", (user_id, article_id))
        connection.commit()

        return jsonify({"message": f"Article finished! {points_to_add} points added."}), 200
    except Exception as e:
        print(f"Error finishing article: {e}")
        return jsonify({"message": "Error finishing article"}), 500

@app.route('/api/read-articles/<int:user_id>', methods=['GET'])
def get_read_articles(user_id):
    try:
        connection = db_conn.create_server_connection(MYSQL_HOST, MYSQL_USER, MYSQL_DB)
        cursor = connection.cursor()
        cursor.execute("SELECT a.* FROM articles a JOIN read_articles ra ON a.article_id = ra.article_id WHERE ra.user_id = %s", (user_id,))
        articles = cursor.fetchall()
        return jsonify([{'article_id': article[0], 'title': article[1], 'content': article[2], 'date_published': article[3]} for article in articles])
    
    except Exception as e:
        print(f"Error loading read article: {e}")
        return jsonify({"message": "Error loading read article"}), 500


if _name_ == '_main_':
    app.run(debug=True)
