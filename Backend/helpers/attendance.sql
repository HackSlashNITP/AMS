CREATE TABLE Attendance(
    studentID VARCHAR(50),
    SubjectCode VARCHAR(50),
    AttendanceCount INT,
    TotalClasses INT,
    PRIMARY KEY (studentID, SubjectCode),
    FOREIGN KEY (studentID) REFERENCES students(studentID),
    FOREIGN KEY (SubjectCode) REFERENCES course(SubjectCode)
);