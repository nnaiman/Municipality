CREATE TABLE schoolEmp
(
    ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES profEmp (ID)
);

CREATE TABLE admin
(
    role INT NOT NULL,
    ID   INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES schoolEmp (ID)
);

CREATE TABLE teacher
(
    ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES schoolEmp (ID)
);

CREATE TABLE course
(
    gradeYear INT         NOT NULL,
    courseID  INT         NOT NULL check (courseID > 0),
    name      VARCHAR(10) NOT NULL,
    ID        INT         NOT NULL,
    PRIMARY KEY (courseID),
    FOREIGN KEY (ID) REFERENCES teacher (ID)
);

CREATE TABLE school
(
    name    VARCHAR(20) NOT NULL,
    address varchar(30) NOT NULL,
    PRIMARY KEY (address),
    FOREIGN KEY (address) REFERENCES INSTITUTION (address)
);

CREATE TABLE building
(
    name    VARCHAR(15) NOT NULL,
    bID     INT         NOT NULL,
    address varchar(30) NOT NULL,
    PRIMARY KEY (bID),
    FOREIGN KEY (address) REFERENCES school (address)
);

CREATE TABLE class
(
    cID      INT NOT NULL,
    capacity INT NOT NULL,
    bID      INT NOT NULL,
    PRIMARY KEY (cID),
    FOREIGN KEY (bID) REFERENCES building (bID)
);

CREATE TABLE student
(
    gradeYear INT         NOT NULL,
    birDay    DATE        NOT NULL,
    ID        INT         NOT NULL,
    address   varchar(30) NOT NULL,
    fatherID  INT         NOT NULL,
    motherID  INT         NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Resident (ID),
    FOREIGN KEY (address) REFERENCES school (address),
    FOREIGN KEY (fatherID) REFERENCES Resident (ID),
    FOREIGN KEY (motherID) REFERENCES Resident (ID),
    CONSTRAINT stud check (fatherID!=motherID),
    CONSTRAINT stud1 check (ID!=fatherID and ID!=motherID)
);

CREATE TABLE test
(
    tDate      DATE        NOT NULL,
    tName      VARCHAR(15) NOT NULL,
    timePeriod INT         NOT NULL check (timePeriod > 30),
    courseID   INT         NOT NULL,
    PRIMARY KEY (tDate, courseID),
    FOREIGN KEY (courseID) REFERENCES course (courseID)
);

CREATE TABLE machine
(
    mID  INT         NOT NULL,
    type VARCHAR(10) NOT NULL,
    cID  INT         NOT NULL,
    PRIMARY KEY (mID),
    FOREIGN KEY (cID) REFERENCES class (cID)
);

CREATE TABLE workAt
(
    ID      INT         NOT NULL,
    address varchar(30) NOT NULL,
    PRIMARY KEY (ID, address),
    FOREIGN KEY (ID) REFERENCES schoolEmp (ID),
    FOREIGN KEY (address) REFERENCES school (address)
);

CREATE TABLE learnAt
(
    day       INT  NOT NULL check(day>0 and day<7),
    timeStart TIMESTAMP NOT NULL,
    timeStop  TIMESTAMP NOT NULL,
    year      INT  NOT NULL,
    courseID  INT  NOT NULL,
    cID       INT  NOT NULL,
    PRIMARY KEY (day,timeStart, year, cID),
    FOREIGN KEY (courseID) REFERENCES course (courseID),
    FOREIGN KEY (cID) REFERENCES class (cID)
);

/*CREATE trigger checkLearnAt
    on learnAt instead of
insert
    AS
    IF NOT EXISTS (select count(*) from laernAt
    where timeStart>: new.timeStart and timeStart<: new.timeStop or timeStop>: new.timeStart and timeStop<: new.timeStop
    or timeStart<: new.timeStart and timeStop>: new.timeStop)
insert into learnAt
values : (:new.day,:new.timeStart,:new.timeStop,:new.year,:new.courseID,:new.cID)
    ELSE return;*/

CREATE TABLE learn
(
    ID       INT NOT NULL,
    courseID INT NOT NULL,
    PRIMARY KEY (ID, courseID),
    FOREIGN KEY (ID) REFERENCES student (ID),
    FOREIGN KEY (courseID) REFERENCES course (courseID)
);

CREATE TABLE grade
(
    ID       INT   NOT NULL,
    tDate    DATE  NOT NULL,
    courseID INT   NOT NULL,
    grade    FLOAT NOT NULL,
    PRIMARY KEY (ID, tDate, courseID),
    FOREIGN KEY (tDate, courseID) REFERENCES test (tDate, courseID),
    FOREIGN KEY (ID) REFERENCES student (ID)
);