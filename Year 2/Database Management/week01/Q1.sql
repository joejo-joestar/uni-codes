USE 20220019db;

CREATE TABLE
    department (
        dept_name VARCHAR(32),
        building VARCHAR(32),
        budget DOUBLE
    );

CREATE TABLE
    student (
        `SID` VARCHAR(32) PRIMARY KEY,
        `name` VARCHAR(32),
        dept_name VARCHAR(32),
        total_credit INT,
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL
    );

CREATE TABLE
    course (
        course_id VARCHAR(32) PRIMARY KEY,
        title VARCHAR(32),
        dept_name VARCHAR(32),
        credits INT,
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL
    );

CREATE TABLE
    instructor (
        IID VARCHAR(32) PRIMARY KEY,
        `name` VARCHAR(32),
        dept_name VARCHAR(32),
        salary DOUBLE,
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL
    );

CREATE TABLE
    teaches (
        IID VARCHAR(32) PRIMARY KEY,
        course_id VARCHAR(32),
        sec_id VARCHAR(16),
        semester INT,
        YEAR INT,
        FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE SET NULL,
        FOREIGN KEY (IID) REFERENCES instructor (IID) ON DELETE CASCADE
    );

CREATE TABLE
    takes (
        `SID` VARCHAR(32) PRIMARY KEY,
        course_id VARCHAR(32),
        sec_id VARCHAR(16),
        semester INT,
        YEAR INT,
        grade CHAR(2)
    );

CREATE TABLE
    advisor (
        `SID` VARCHAR(32) PRIMARY KEY,
        IID VARCHAR(32),
        FOREIGN KEY (IID) REFERENCES instructor (IID) ON DELETE SET NULL,
        FOREIGN KEY (`SID`) REFERENCES student (`SID`) ON DELETE CASCADE
    );

CREATE TABLE
    prereq (
        course_id VARCHAR(32) PRIMARY KEY,
        prereq_id VARCHAR(32),
        FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
        FOREIGN KEY (prereq_id) REFERENCES course (course_id) ON DELETE SET NULL
    );

ALTER TABLE instructor
MODIFY salary INT DEFAULT 100000;

INSERT INTO
    department (dept_name, building, budget);

VALUES
    (
        "Computer Science",
        "Main Block",
        100000
    );