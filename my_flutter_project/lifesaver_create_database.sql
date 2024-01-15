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

CREATE TABLE articles (
  article_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  date_published DATE NOT NULL
);

CREATE TABLE read_articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  article_id INT NOT NULL,
  date_read DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

CREATE TABLE user_allergies (
  user_id INT,
  allergy_id INT AUTO_INCREMENT,
  name VARCHAR(255), 
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  PRIMARY KEY (allergy_id)
);

CREATE TABLE user_medications (
  medication_id INT AUTO_INCREMENT,
  user_id INT,
  name VARCHAR(255) NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  PRIMARY KEY (medication_id) 
);

INSERT INTO user(password, name, surname, email, phone_number, gender, age, blood_type, rh_factor) VALUES('password', 'John', 'Doe', 'johndoe@mail.com', '123456789', 'Male', 45, 'A', '+');

INSERT INTO user_allergies(user_id, name) VALUES(3, 'cats');
INSERT INTO user_allergies(user_id, name) VALUES(3, 'bees');

INSERT INTO user_medications(user_id, name) VALUES(3, 'depon');
INSERT INTO user_medications(user_id, name) VALUES(3, 'augmentin');


-- Article 1: Immediate Response: How to Perform Hands-Only CPR
INSERT INTO articles (title, content, date_published) VALUES
("Immediate Response: How to Perform Hands-Only CPR", "Introduction:

In critical moments before professional help arrives, knowing how to perform Hands-Only CPR can be the difference between life and death. Cardiac emergencies can happen anytime, anywhere, and immediate intervention can significantly improve the chances of survival. This article aims to equip you with the knowledge and skills necessary to take prompt action in such situations. Read on for a step-by-step guide on initiating Hands-Only CPR and understand the crucial role you can play in saving a life.

Key Points:

1. Recognizing when CPR is needed:
    - CPR, or cardiopulmonary resuscitation, is a life-saving technique used when someone's heartbeat or breathing has stopped.
    - If a person is unresponsive and not breathing normally, or only gasping, CPR should be initiated immediately.

2. Step-by-step guide to Hands-Only CPR:
    - Check for responsiveness: Gently tap the person and shout loudly, ''Are you okay?'' If there is no response, the person is not breathing normally, or only gasping, it's time to start CPR.
    - Call for help: Dial emergency services (911 or your local emergency number) and provide clear information about the situation.
    - Position your hands: Place the heel of one hand on the center of the person's chest, just below the nipple line.
    - Perform chest compressions: Use your upper body weight to push hard and fast at least 2 inches deep at a rate of 100-120 compressions per minute. Allow the chest to fully recoil between compressions.
    - Continue until help arrives: Keep performing chest compressions until professional help arrives or the person shows signs of life.

3. Importance of maintaining a consistent rhythm and depth:
    - Consistency in the rhythm and depth of compressions is crucial for effective CPR.
    - Adequate compression depth ensures proper blood circulation, while maintaining a consistent rhythm helps optimize oxygen delivery to vital organs.

4. Tips for minimizing fatigue during prolonged CPR:
    - CPR can be physically demanding, especially during extended efforts.
    - If another person is available, consider taking turns to minimize fatigue.
    - Focus on effective chest compressions, using your body weight rather than just your arms.

Remember, quick action and confident application of Hands-Only CPR can significantly increase the chances of survival for someone experiencing a cardiac emergency. By learning and practicing these steps, you become a crucial link in the chain of survival until professional help arrives.", "2024-01-01");

-- Article 2: When Someone Collapses: A Step-by-Step Guide to Responding to Unconsciousness
INSERT INTO articles (title, content, date_published) VALUES
("When Someone Collapses: A Step-by-Step Guide to Responding to Unconsciousness", "Introduction:

Witnessing someone collapse can be a frightening experience, but knowing how to respond can make a significant difference. Whether the cause is a medical emergency or another sudden event, taking immediate and appropriate action can be the key to saving a life. This article provides a step-by-step guide on how to respond when someone loses consciousness, emphasizing the importance of quick and decisive measures.

Key Points:

1. Check for responsiveness and breathing:
    - Approach the person and gently tap their shoulder, asking loudly, ''Are you okay?''
    - If there is no response, check for normal breathing. Place your ear close to their mouth and nose, look for chest movement, and listen for breath sounds.

2. Call emergency services and provide clear information:
    - If the person is unresponsive and not breathing normally, or only gasping, call emergency services immediately (911 or your local emergency number).
    - Clearly communicate the situation, including the person's condition and your location.

3. Position the person:
    - Carefully place the person on their back on a firm surface.
    - Ensure the airway is open by tilting their head back slightly.

4. Perform chest compressions:
    - If the person is unresponsive and not breathing normally, start hands-only CPR.
    - Position your hands in the center of the chest (just below the nipple line) and perform chest compressions at a rate of 100-120 compressions per minute.
    - Continue CPR until professional help arrives or the person shows signs of life.

5. Stay with the person until professional help arrives:
    - Continue to monitor the person's condition.
    - Be prepared to provide additional information to emergency responders when they arrive.

Responding promptly to unconsciousness is vital for the person's chances of survival. By following these steps, you play a crucial role in initiating emergency care until professional help is on the scene. Keep in mind that staying calm and focused is essential, and your actions can make a meaningful impact on someone in distress.", "2024-01-11");

-- Article 3: Drowning Prevention and Response: What to Do in Water Emergencies
INSERT INTO articles (title, content, date_published) VALUES
("Drowning Prevention and Response: What to Do in Water Emergencies", "Introduction:

Water emergencies, including drowning incidents, can happen swiftly and without warning. Being informed about drowning prevention and knowing how to respond in such situations is crucial for everyone, whether you're at the pool, beach, or any aquatic environment. This article provides essential guidance on preventing water-related accidents and outlines the steps to take if someone is drowning, emphasizing the importance of water safety for all age groups.

Key Points:

1. Importance of Water Safety:
    - Supervision is key: Always ensure that children and inexperienced swimmers are under constant and vigilant supervision by a responsible adult when in or around water.
    - Learn to swim: Enroll yourself and your family members in swimming lessons to build water confidence and essential swimming skills.
    - Use life jackets: When boating or participating in water activities, ensure everyone wears a properly fitted life jacket.

2. Recognizing the Signs of Drowning:
    - Drowning is often silent and can happen quickly. Be alert for these signs:
        - Silent struggling in the water.
        - Inability to call for help.
        - Gasping for air or hyperventilating.

3. Calling for Help and Alerting Lifeguards:
    - If you see someone in distress in the water, take immediate action:
        - Call for help: Dial emergency services (911 or your local emergency number) and provide clear information about the situation.
        - Alert lifeguards: If at a pool or beach with lifeguards, signal or shout for their attention.

4. Performing Water Rescue Techniques if Trained:
    - Reach or throw, don't go: If you are not a trained rescuer, avoid entering the water. Instead, reach for the person using a pole or throw a buoyant object to them.
    - Use the proper techniques: If trained, perform water rescue techniques like the 'reach and throw' method or use a buoyant aid to assist the person in distress.

5. Administering First Aid:
    - Once the person is out of the water, check for responsiveness and breathing.
    - If unresponsive, begin CPR immediately.
    - Continue CPR until professional help arrives or the person shows signs of life.

6. Promoting Water Safety Education:
    - Advocate for water safety education in your community.
    - Encourage swimming lessons and water safety programs for children and adults.
    - Participate in or support initiatives that promote water safety awareness.

By staying informed and following these guidelines, you contribute to a safer aquatic environment for yourself, your family, and your community. Remember, drowning prevention is a shared responsibility, and your awareness and actions can save lives.", "2024-01-12");

-- Article 4: Choking Hazards: Quick Actions to Save a Life
INSERT INTO articles (title, content, date_published) VALUES
("Choking Hazards: Quick Actions to Save a Life", "Introduction:

Choking is a sudden and potentially life-threatening situation that can occur unexpectedly. Knowing how to respond promptly can make a crucial difference in saving a life. This article provides practical guidance on recognizing the signs of choking and the immediate actions you can take to assist someone who is choking. Read on to learn how to perform the Heimlich maneuver and be prepared to respond effectively in a choking emergency.

Key Points:

1. Recognizing the signs of choking:
    - Choking occurs when a person's airway is blocked by a foreign object, preventing normal breathing.
    - Common signs include difficulty breathing, inability to speak, and grabbing the throat.
2. Encouraging the person to cough forcefully:
    - If the person is conscious and coughing forcefully, encourage them to continue coughing to try and dislodge the object.
    - Stay calm and reassure the person, keeping a close eye on their ability to breathe.
3. Performing the Heimlich maneuver on conscious individuals:
    - Stand behind the person: Position yourself slightly to the side and behind the person who is choking.
    - Place your arms around their waist: Form a fist with one hand and place the thumb side against the middle of the person's abdomen, just above the navel.
    - Grasp your fist with the other hand: Use quick, upward thrusts to attempt to dislodge the object. Perform abdominal thrusts until the object is expelled or the person can breathe on their own.
    - Call for help if needed: If the person becomes unconscious, call emergency services (911 or your local emergency number) and initiate CPR.
4. Performing the Heimlich maneuver on unconscious individuals:
    - Lower the person to the ground: Gently lower the person to the ground while keeping their head supported.
    - Call for help: Dial emergency services and begin CPR if the person is unresponsive and not breathing normally.
    - Perform chest compressions: If trained, initiate chest compressions until professional help arrives or the person starts breathing again.

Remember, staying calm and taking immediate action is crucial when someone is choking. By learning and practicing these quick actions, you can be prepared to respond effectively and potentially save a life in a choking emergency.", "2024-01-13");

-- Article 5: Household Burns: First Aid and Prevention Tips
INSERT INTO articles (title, content, date_published) VALUES
("Household Burns: First Aid and Prevention Tips", "Introduction:

Accidents leading to burns can happen unexpectedly in our homes. Whether it's a hot surface, boiling water, or a kitchen mishap, being prepared to provide immediate first aid for burns is crucial. This article aims to guide you through the steps of administering first aid for household burns and provides essential tips for preventing burns in the home environment.

Key Points:

1. Differentiating between burn degrees:
    - First-degree burns: These are superficial burns that only affect the outer layer of the skin. They typically result in redness and mild pain.
    - Second-degree burns: These burns go deeper, causing redness, swelling, and blistering. They are more painful and may require medical attention.
    - Third-degree burns: The most severe type, these burns extend into the deeper skin layers, often causing white or charred skin. Immediate emergency medical attention is necessary for third-degree burns.
2. Immediate first aid for burns:
    - First-degree burns:
        - Hold the affected area under cool, running water for 10-20 minutes.
        - Avoid using ice, as it can damage the skin.
        - Apply a sterile, non-stick dressing if needed.
    - Second-degree burns:
        - Do not pop any blisters that form.
        - Gently clean the burn with mild soap and water.
        - Apply a sterile dressing and consider over-the-counter pain relievers.
    - Third-degree burns:
        - Call emergency services immediately.
        - Do not attempt to remove any clothing stuck to the burn.
        - Cover the burn with a clean, non-stick bandage or cloth.
3. When to seek medical attention:
    - Seek professional medical help for burns that cover a large area, are on the face, hands, feet, or genitalia, or are third-degree burns.
    - If the burn is caused by chemicals or electricity, seek immediate medical attention.
4. Preventive measures to reduce the risk of burns at home:
    - Keep hot items out of reach: Use back burners on the stove and turn pot handles away from the stove's edge.
    - Check water temperature: Set your water heater to 120°F (48°C) or lower to prevent scalds.
    - Secure electrical cords: Prevent tripping and the risk of pulling hot items off surfaces.
    - Use caution with hot liquids: Keep hot drinks away from the edges of tables and counters.

Household burns can happen to anyone, but with the right knowledge and precautions, you can minimize the risks and respond effectively when accidents occur. Remember, immediate first aid is crucial, and seeking medical attention for severe burns is paramount for the best possible outcome.", "2024-01-14");
