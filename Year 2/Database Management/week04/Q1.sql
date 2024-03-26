USE       20220019db;

CREATE    TABLE Classroom (
          building CHAR(16),
          room_number INT,
          capacity INT,
          PRIMARY KEY (building, room_number)
          );

CREATE    TABLE Time_slot (
          time_slot_id INT,
          `day` CHAR(16),
          start_time TIME,
          end_time TIME,
          PRIMARY KEY (
          time_slot_id,
          `day`,
          start_time
          )
          );

CREATE    TABLE Department (
          dept_name CHAR(16),
          building CHAR(16),
          budget INT
          );

CREATE    TABLE Section (
          course_id INT,
          sec_id INT,
          semester INT,
          `year` INT,
          building CHAR(16),
          room_number INT,
          time_slot_id INT,
          PRIMARY KEY (
          time_slot_id,
          course_id,
          building,
          room_number
          ),
          FOREIGN KEY (building) REFERENCES Classroom (building) ON DELETE CASCADE,
          FOREIGN KEY (room_number) REFERENCES Classroom (room_number) ON DELETE CASCADE,
          FOREIGN KEY (time_slot_id) REFERENCES Time_slot (time_slot_id) ON DELETE CASCADE
          );

CREATE    TABLE Student (
          id INT,
          `name` CHAR(16),
          dept_name CHAR(16),
          tot_cred INT,
          PRIMARY KEY (id, dept_name),
          FOREIGN KEY (dept_name) REFERENCES Department (dept_name) ON DELETE CASCADE
          );

CREATE    TABLE Takes (
          id INT,
          course_id INT,
          sec_id INT,
          semester INT,
          `year` INT,
          grade CHAR(2),
          PRIMARY KEY (
          id,
          course_id,
          sec_id,
          semester,
          `year`
          ),
          FOREIGN KEY (id) REFERENCES Student (id) ON DELETE CASCADE,
          FOREIGN KEY (course_id) REFERENCES Section (course_id) ON DELETE CASCADE,
          FOREIGN KEY (sec_id) REFERENCES Section (sec_id) ON DELETE CASCADE,
          FOREIGN KEY (semester) REFERENCES Section (semester) ON DELETE CASCADE,
          FOREIGN KEY (`year`) REFERENCES Section (`year`) ON DELETE CASCADE
          );

CREATE    TABLE Course (
          course_id INT,
          title CHAR(16),
          dept_name CHAR(16),
          credits INT,
          FOREIGN KEY (dept_name) REFERENCES Department (dept_name) ON DELETE CASCADE
          );

CREATE    TABLE Instructor (
          id INT PRIMARY KEY,
          `name` CHAR(16),
          dept_name CHAR(16),
          salary INT,
          FOREIGN KEY (dept_name) REFERENCES Department (dept_name) ON DELETE CASCADE
          );

CREATE    TABLE Advisor (
          s_id INT,
          i_id INT,
          FOREIGN KEY (s_id) REFERENCES Student (id) ON DELETE CASCADE,
          FOREIGN KEY (i_id) REFERENCES Instructor (id) ON DELETE CASCADE
          );

CREATE    TABLE Teaches (
          id INT PRIMARY KEY,
          course_id INT,
          sec_id INT,
          semester INT,
          `year` INT,
          PRIMARY KEY (
          id,
          course_id,
          sec_id,
          semester,
          `year`
          ),
          FOREIGN KEY (course_id) REFERENCES Section (course_id) ON DELETE CASCADE,
          FOREIGN KEY (sec_id) REFERENCES Section (sec_id) ON DELETE CASCADE,
          FOREIGN KEY (semester) REFERENCES Section (semester) ON DELETE CASCADE,
          FOREIGN KEY (`year`) REFERENCES Section (`year`) ON DELETE CASCADE
          );

CREATE    TABLE Prereq (
          course_id INT,
          prereq_id INT,
          PRIMARY KEY (course_id, prereq_id),
          FOREIGN KEY (course_id) REFERENCES Course (course_id) ON DELETE CASCADE,
          FOREIGN KEY (prereq_id) REFERENCES Course (course_id) ON DELETE CASCADE
          );