import mysql.connector
from mysql.connector import Error
from flask import Flask

import pandas as pd
import random
import datetime


def random_name():
    names = ["John", "Jane", "Alice", "Bob", "Charlie", "Diana", "Ethan", "Fiona", "George", "Hannah"]
    return random.choice(names)

def random_surname():
    surnames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis"]
    return random.choice(surnames)

def random_email(name):
    domains = ["example.com", "mail.com", "test.org"]
    return f"{name.lower()}@{random.choice(domains)}"

def random_phone_number():
    return random.randint(6900000000, 6999999999)

def random_gender():
    return random.choice(["Male", "Female", "Other"])

def random_age():
    return random.randint(18, 80)

def random_blood_type():
    return random.choice(["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"])

def random_points():
    return random.randint(0, 100)

def random_badge_name():
    badge_names = ["Gold", "Silver", "Bronze", "Platinum", "Emerald", "Sapphire", "Ruby", "Diamond"]
    return random.choice(badge_names)

def random_article_title():
    titles = ["The Future of Technology", "Exploring the Universe", "The Secrets of the Ocean", "History of the Internet",
              "Advances in Medicine", "The World of Art", "Understanding Economics", "Politics in the Modern World"]
    return random.choice(titles)

def random_date(start_year=2020, end_year=2023):
    start = datetime.date(start_year, 1, 1)
    end = datetime.date(end_year, 12, 31)
    return start + (end - start) * random.random()

def random_medication_name():
    medications = ["MedA", "MedB", "MedC", "MedD", "MedE", "MedF", "MedG", "MedH"]
    return random.choice(medications)

def random_condition_name():
    conditions = ["ConditionA", "ConditionB", "ConditionC", "ConditionD", "ConditionE"]
    return random.choice(conditions)

def random_allergy_name():
    allergies = ["AllergyA", "AllergyB", "AllergyC", "AllergyD"]
    return random.choice(allergies)

def random_text():
    texts = ["Lorem ipsum dolor sit amet", "Consectetur adipiscing elit", "Sed do eiusmod tempor incididunt",
             "Ut labore et dolore magna aliqua", "Ut enim ad minim veniam", "Quis nostrud exercitation ullamco"]
    return random.choice(texts)

# Creating dummy data
num_users = 5
num_badges = 5
num_articles = 5
num_conditions = 5
num_allergies = 5
num_medications = 5

# Users
users_data = [{
    "user_id": i,
    "name": random_name(),
    "surname": random_surname(),
    "email": random_email(random_name()),
    "phone_number": random_phone_number(),
    "gender": random_gender(),
    "age": random_age(),
    "blood_type": random_blood_type(),
    "points": random_points()
} for i in range(1, num_users + 1)]

# Badges
badges_data = [{"badge_id": i, "name": random_badge_name()} for i in range(1, num_badges + 1)]

# User Badges
user_badges_data = [{"user_id": random.randint(1, num_users), "badge_id": random.randint(1, num_badges)} for _ in range(10)]

# Articles
articles_data = [{
    "article_id": i,
    "title": random_article_title(),
    "content": random_text(),
    "date_published": random_date()
} for i in range(1, num_articles + 1)]

# User Articles
user_articles_data = [{"user_id": random.randint(1, num_users), "article_id": random.randint(1, num_articles),
                       "date_read": random_date()} for _ in range(10)]

# Medical Conditions
medical_conditions_data = [{"condition_id": i, "name": random_condition_name(), "description": random_text()} for i in range(1, num_conditions + 1)]

# User Conditions
user_conditions_data = [{"user_id": random.randint(1, num_users), "condition_id": random.randint(1, num_conditions),
                         "status": random.choice(["current", "past"]), "date_diagnosed": random_date(),
                         "date_resolved": random_date()} for _ in range(10)]

# Allergies
allergies_data = [{"allergy_id": i, "name": random_allergy_name(), "description": random_text()} for i in range(1, num_allergies + 1)]

# User Allergies
user_allergies_data = [{"user_id": random.randint(1, num_users), "allergy_id": random.randint(1, num_allergies)} for _ in range(10)]

# Medications
medications_data = [{"medication_id": i, "name": random_medication_name(), "description": random_text(), "dosage": random_text()} for i in range(1, num_medications + 1)]

# User Medications
user_medications_data = [{"user_id": random.randint(1, num_users), "medication_id": random.randint(1, num_medications),
                          "dosage": random_text(), "start_date": random_date(), "end_date": random_date(), "notes": random_text()} for _ in range(10)]

# Convert to DataFrames
df_users = pd.DataFrame(users_data)
df_badges = pd.DataFrame(badges_data)
df_user_badges = pd.DataFrame(user_badges_data)
df_articles = pd.DataFrame(articles_data)
df_user_articles = pd.DataFrame(user_articles_data)
df_medical_conditions = pd.DataFrame(medical_conditions_data)
df_user_conditions = pd.DataFrame(user_conditions_data)
df_allergies = pd.DataFrame(allergies_data)
df_user_allergies = pd.DataFrame(user_allergies_data)
df_medications = pd.DataFrame(medications_data)
df_user_medications = pd.DataFrame(user_medications_data)

app = Flask(__name__)
# Set a secret key
app.secret_key = "alekos"

def connect_to_database(host, user, password, db):
    try:
        connection = mysql.connector.connect(host='localhost', port=3306, user='root', password='password', database='firstaid')
        if connection.is_connected():
            print("Successfully connected to the database")
            return connection
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None

def insert_data(connection, query, data):
    try:
        cursor = connection.cursor()
        cursor.executemany(query, data)
        connection.commit()
        print(f"{cursor.rowcount} records inserted successfully into table")
    except Error as e:
        print(f"Failed to insert record into table: {e}")
    finally:
        if cursor:
            cursor.close()

def main():
    # Database connection
    host = 'localhost'
    user = 'your_username'
    password = 'your_password'
    database = 'your_database'
    
    connection = connect_to_database(host, user, password, database)
    if not connection:
        return

    # Insert data into tables
    # You can add similar blocks for other tables as well
    
    # Insert into 'user' table
    user_query = "INSERT INTO user (user_id, name, surname, email, phone_number, gender, age, blood_type, points) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
    insert_data(connection, user_query, [tuple(user.values()) for user in users_data])

    # Insert into 'badges' table
    badge_query = "INSERT INTO badges (badge_id, name) VALUES (%s, %s)"
    insert_data(connection, badge_query, [tuple(badge.values()) for badge in badges_data])

    # Insert into 'user_badges' table
    user_badge_query = "INSERT INTO user_badges (user_id, badge_id) VALUES (%s, %s)"
    insert_data(connection, user_badge_query, [tuple(user_badge.values()) for user_badge in user_badges_data])

    # Insert into 'articles' table
    article_query = "INSERT INTO articles (article_id, title, content, date_published) VALUES (%s, %s, %s, %s)"
    insert_data(connection, article_query, [tuple(article.values()) for article in articles_data])

    # Insert into 'user_articles' table
    user_article_query = "INSERT INTO user_articles (user_id, article_id, date_read) VALUES (%s, %s, %s)"
    insert_data(connection, user_article_query, [tuple(user_article.values()) for user_article in user_articles_data])

    # Insert into 'medical_conditions' table
    condition_query = "INSERT INTO medical_conditions (condition_id, name, description) VALUES (%s, %s, %s)"
    insert_data(connection, condition_query, [tuple(condition.values()) for condition in medical_conditions_data])

    # Insert into 'user_conditions' table
    user_condition_query = "INSERT INTO user_conditions (user_id, condition_id, status, date_diagnosed, date_resolved) VALUES (%s, %s, %s, %s, %s)"
    insert_data(connection, user_condition_query, [tuple(user_condition.values()) for user_condition in user_conditions_data])

    # Insert into 'allergies' table
    allergy_query = "INSERT INTO allergies (allergy_id, name, description) VALUES (%s, %s, %s)"
    insert_data(connection, allergy_query, [tuple(allergy.values()) for allergy in allergies_data])

    # Insert into 'user_allergies' table
    user_allergy_query = "INSERT INTO user_allergies (user_id, allergy_id) VALUES (%s, %s)"
    insert_data(connection, user_allergy_query, [tuple(user_allergy.values()) for user_allergy in user_allergies_data])

    # Insert into 'medications' table
    medication_query = "INSERT INTO medications (medication_id, name, description, dosage) VALUES (%s, %s, %s, %s)"
    insert_data(connection, medication_query, [tuple(medication.values()) for medication in medications_data])

    # Insert into 'user_medications' table
    user_medication_query = "INSERT INTO user_medications (user_id, medication_id, dosage, start_date, end_date, notes) VALUES (%s, %s, %s, %s, %s, %s)"
    insert_data(connection, user_medication_query, [tuple(user_medication.values()) for user_medication in user_medications_data])

    
    # Close the connection
    if connection.is_connected():
        connection.close()
        print("MySQL connection is closed")

if __name__ == "__main__":
    main()
