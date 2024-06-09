CREATE TABLE admin (
    professorID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL,
    mergedClassroomID VARCHAR(50) NOT NULL
);
