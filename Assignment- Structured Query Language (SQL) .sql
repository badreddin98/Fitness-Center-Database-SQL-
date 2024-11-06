CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL);
    
    CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Inserting members into the Members table
INSERT INTO Members (id, name, age)
VALUES
(1, 'John Smith', 30),
(2, 'Jane Doe', 25),
(3, 'Alice Johnson', 35);

-- Inserting workout session data into the WorkoutSessions table
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES
(1, 1, '2022-10-10', 'Morning', 'Yoga'),
(2, 2, '2023-12-04', 'Morning', 'Cardio'),
(3, 3, '2024-08-05', 'Afternoon', 'Strength Training');

-- Updating the session time for Jane Doe
UPDATE WorkoutSessions
SET session_time = 'Evening'
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe')
  AND session_date = '2023-12-04';
  
-- Deleting the workout sessions for John Smith
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');

-- Disable safe update mode for the current session
SET SQL_SAFE_UPDATES = 0;

-- Deleting John Smith's record from the Members table
DELETE FROM Members
WHERE name = 'John Smith';

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Members;
SELECT * FROM WorkoutSessions;