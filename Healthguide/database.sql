CREATE DATABASE IF NOT EXISTS healthguide;

USE healthguide;

DROP TABLE IF EXISTS health_information;
DROP TABLE IF EXISTS symptoms;

CREATE TABLE symptoms (
    symptom_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    keywords TEXT
);

CREATE TABLE health_information (
    info_id INT PRIMARY KEY,
    symptom_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    self_care TEXT NOT NULL,
    warning TEXT NOT NULL,
    source_name VARCHAR(255) NOT NULL,
    source_url TEXT NOT NULL,
    last_verified DATE,
    FOREIGN KEY (symptom_id) REFERENCES symptoms(symptom_id)
);

INSERT INTO symptoms (symptom_id, name, keywords) VALUES
(1, 'Headache', 'headache,head pain,pain in head'),
(2, 'Common Cold', 'cold,common cold,runny nose,sneezing,nasal congestion,blocked nose'),
(3, 'Cough', 'cough,coughing'),
(4, 'Sore Throat', 'sore throat,throat pain,painful throat'),
(5, 'Fever', 'fever,high temperature,temperature'),
(6, 'Back Pain', 'back pain,backache,pain in back'),
(7, 'Stomach Pain', 'stomach pain,abdominal pain,belly pain'),
(8, 'Nausea', 'nausea,feeling sick,sick feeling'),
(9, 'Diarrhea', 'diarrhea,diarrhoea,loose motion,loose stools'),
(10, 'Fatigue', 'fatigue,tiredness,tired,low energy');

INSERT INTO health_information
(
    info_id,
    symptom_id,
    title,
    description,
    self_care,
    warning,
    source_name,
    source_url,
    last_verified
)
VALUES
(
    1, 1,
    'Headache - General Information',
    'Headaches are a common health complaint. Different types of headache can have different causes and patterns.',
    'Maintain regular sleep, stay hydrated, eat regular meals and take appropriate rest.',
    'Seek medical attention for a sudden or extremely severe headache, confusion, weakness, difficulty speaking, loss of consciousness, or other serious symptoms.',
    'World Health Organization',
    'https://www.who.int/news-room/fact-sheets/detail/headache-disorders',
    '2026-08-30'
),
(
    2, 2,
    'Common Cold - General Information',
    'The common cold is a common respiratory illness. Symptoms can include a runny or blocked nose, sneezing, sore throat and cough.',
    'Get adequate rest, drink fluids and maintain good hygiene. Cover coughs and sneezes and wash your hands regularly.',
    'Seek medical advice if symptoms become severe, do not improve, or are accompanied by difficulty breathing or other concerning symptoms.',
    'World Health Organization',
    'https://www.who.int/news-room/questions-and-answers/item/how-can-i-avoid-getting-the-flu',
    '2026-08-30'
),
(
    3, 3,
    'Cough - General Information',
    'Coughing can occur with several respiratory illnesses. A cough may occur with a common cold, influenza and other respiratory infections.',
    'Rest, drink adequate fluids and follow good respiratory hygiene. Cover your mouth and nose when coughing or sneezing.',
    'Seek medical attention if coughing is associated with difficulty breathing, chest pain, coughing blood, severe weakness, or symptoms that are getting worse.',
    'World Health Organization',
    'https://www.who.int/health-topics/coronavirus/coronavirus',
    '2026-08-30'
),
(
    4, 4,
    'Sore Throat - General Information',
    'A sore throat can occur with respiratory infections such as colds and influenza. It may occur together with cough, runny nose or fever.',
    'Stay hydrated, get adequate rest and maintain good hand and respiratory hygiene.',
    'Seek medical advice if the sore throat is severe, persistent, or associated with difficulty breathing or difficulty swallowing.',
    'World Health Organization',
    'https://www.who.int/news-room/questions-and-answers/item/how-can-i-avoid-getting-the-flu',
    '2026-08-30'
),
(
    5, 5,
    'Fever - General Information',
    'Fever can occur as part of infections and other illnesses. Fever may occur together with symptoms such as cough, headache, sore throat or body aches.',
    'Rest, maintain adequate fluid intake and monitor how symptoms change.',
    'Seek medical attention for severe or persistent fever, difficulty breathing, confusion, severe weakness, dehydration, or other concerning symptoms.',
    'World Health Organization',
    'https://www.who.int/news-room/questions-and-answers/item/how-can-i-avoid-getting-the-flu',
    '2026-08-30'
),
(
    6, 6,
    'Back Pain - General Information',
    'Low back pain is very common and can affect people of different ages. Many cases are non-specific.',
    'Stay reasonably active, maintain good sleep habits and support regular physical activity.',
    'Seek medical attention if back pain is severe, persistent, associated with weakness or numbness, or accompanied by other concerning symptoms.',
    'World Health Organization',
    'https://www.who.int/news-room/fact-sheets/detail/low-back-pain',
    '2026-08-30'
),
(
    7, 7,
    'Stomach Pain - General Information',
    'Stomach or abdominal pain can have many possible causes. Its significance can depend on location, severity, duration and other symptoms.',
    'Rest and monitor how the symptoms change. Maintain adequate fluid intake and avoid activities or foods that appear to make symptoms worse.',
    'Seek medical attention for severe or rapidly worsening abdominal pain, persistent vomiting, blood in vomit or stool, fainting, or severe weakness.',
    'MedlinePlus',
    'https://medlineplus.gov/abdominalpain.html',
    '2026-08-30'
),
(
    8, 8,
    'Nausea - General Information',
    'Nausea is an unpleasant feeling that may occur before vomiting. It can have many possible causes.',
    'Rest and maintain adequate fluid intake. If symptoms continue or repeatedly occur, consult a healthcare professional.',
    'Seek medical attention if nausea is severe or persistent, if you cannot keep fluids down, or if it occurs with severe pain, confusion or fainting.',
    'MedlinePlus',
    'https://medlineplus.gov/nauseaandvomiting.html',
    '2026-08-30'
),
(
    9, 9,
    'Diarrhea - General Information',
    'Diarrhoea is the passage of three or more loose or liquid stools per day, or more frequently than is normal for an individual.',
    'Maintain adequate fluid intake and pay attention to signs of dehydration. Good hand hygiene, safe drinking water and food hygiene can help reduce risk.',
    'Seek medical attention if there is blood in the stool, persistent diarrhoea, severe dehydration, inability to drink, or other serious symptoms.',
    'World Health Organization',
    'https://www.who.int/news-room/fact-sheets/detail/diarrhoeal-disease',
    '2026-08-30'
),
(
    10, 10,
    'Fatigue - General Information',
    'Fatigue is a feeling of tiredness or lack of energy. It can occur for many different reasons, including insufficient sleep, illness, stress and other health conditions.',
    'Maintain regular sleep habits, eat balanced meals, stay adequately hydrated and allow time for appropriate rest.',
    'Consult a healthcare professional if fatigue is severe, persistent, unexplained, or occurs with difficulty breathing, chest pain, fainting or significant weakness.',
    'MedlinePlus',
    'https://medlineplus.gov/fatigue.html',
    '2026-08-30'
);