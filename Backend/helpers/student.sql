CREATE TABLE students(
    studentID VARCHAR(50)  PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(20) NOT NULL,
    section CHAR(1) NOT NULL,
    mergedClassroomId VARCHAR(30)
);