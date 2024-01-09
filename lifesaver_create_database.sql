CREATE DATABASE IF NOT EXISTS firstaid; 
USE firstaid

CREATE TABLE user(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  password VARCHAR(255), 
  name VARCHAR(50),
  surname VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(15),
  gender VARCHAR(10),
  age INT,
  blood_type VARCHAR(3),
  rh_factor ENUM('+', '-') DEFAULT '+',
  points INT DEFAULT 0
);

CREATE TABLE symptoms (
symptom_id INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE badges (
badge_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE user_badges (
user_id INT,
badge_id INT,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (badge_id) REFERENCES badges(badge_id),
PRIMARY KEY (user_id, badge_id)
);

CREATE TABLE articles (
  article_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  date_published DATE NOT NULL
);

CREATE TABLE user_articles (
  user_id INT,
  article_id INT,
  date_read DATETIME,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (article_id) REFERENCES articles(article_id),
  PRIMARY KEY (user_id, article_id)
);

CREATE TABLE user_conditions (
  user_id INT,
  condition_id INT,
  status ENUM('current', 'past', 'chronic') NOT NULL,
  date_diagnosed DATE,
  date_resolved DATE,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  PRIMARY KEY (condition_id, status)
);

CREATE TABLE user_allergies (
  user_id INT,
  allergy_id INT,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  PRIMARY KEY (allergy_id)
);

CREATE TABLE user_medications (
  user_id INT,
  medication_id INT,
  name VARCHAR(255) NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  PRIMARY KEY (user_id, medication_id) 
);