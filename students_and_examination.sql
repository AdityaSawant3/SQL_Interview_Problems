-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

-- Create Subjects table
CREATE TABLE Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

-- Create Examinations table
CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name)
);

-- Insert data into Students
INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

-- Insert data into Subjects
INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

-- Insert data into Examinations
INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

-- Write a solution to find the number of times each student attended each exam. (medium)
-- Return the result table ordered by student_id and subject_name.
SELECT 
	s1.student_id, 
	s1.student_name, 
	s2.subject_name,
	COUNT(e.subject_name) AS attended_exams
FROM Students s1
CROSS JOIN Subjects s2 
LEFT JOIN Examinations e ON s1.student_id = e.student_id AND s2.subject_name = e.subject_name
GROUP BY s1.student_id, s1.student_name, s2.subject_name
ORDER BY s1.student_id, s2.subject_name;

-- Release resources
DROP TABLE Students;

DROP TABLE Subjects;

DROP TABLE Examinations;