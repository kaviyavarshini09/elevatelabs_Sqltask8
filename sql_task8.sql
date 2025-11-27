create database sample;
use sample;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO Students VALUES
(1, 'Anu', 85),
(2, 'Rahul', 72),
(3, 'Sara', 90),
(4, 'Kaviya', 40);

DELIMITER $$

CREATE PROCEDURE GetStudentDetails(IN sid INT)
BEGIN
    SELECT * FROM Students WHERE student_id = sid;
END $$

DELIMITER ;

CALL GetStudentDetails(2);

DELIMITER $$

CREATE PROCEDURE CheckResult(IN sid INT)
BEGIN
    DECLARE m INT;

    SELECT marks INTO m FROM Students WHERE student_id = sid;

    IF m >= 50 THEN
        SELECT 'PASS' AS Result;
    ELSE
        SELECT 'FAIL' AS Result;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION GetGrade(m INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(10);

    IF m >= 90 THEN
        SET grade = 'A';
    ELSEIF m >= 75 THEN
        SET grade = 'B';
    ELSEIF m >= 50 THEN
        SET grade = 'C';
    ELSE
        SET grade = 'Fail';
    END IF;

    RETURN grade;
END $$

DELIMITER ;

SELECT name, marks, GetGrade(marks) AS Grade
FROM Students;






