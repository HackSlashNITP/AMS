CREATE TABLE IF NOT EXISTS Attendance (
  AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
  AttendanceDateTime DATETIME NOT NULL,
  StudentID INT NOT NULL,
  ScheduleID INT NOT NULL,
  IsPresent BOOLEAN NOT NULL,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (ScheduleID) REFERENCES ClassSchedule(ScheduleID)
);
