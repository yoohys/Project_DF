CREATE TABLE member(
	id VARCHAR2(40) PRIMARY KEY,
	pw VARCHAR2(40) NOT NULL,
	name VARCHAR2(40) NOT NULL,
	email VARCHAR2(40) NOT NULL,
	tel VARCHAR2(40)
);

INSERT INTO member values('user1', 'pw', 'name1', '1@a.a', '00000000000');
INSERT INTO member values('user2', 'pw', 'name2', '2@a.a', '00000000000');
INSERT INTO member values('user3', 'pw', 'name3', '3@a.a', '00000000000');
INSERT INTO member values('user4', 'pw', 'name4', '4@a.a', '00000000000');
INSERT INTO member values('user5', 'pw', 'name5', '5@a.a', '00000000000');
INSERT INTO member values('user6', 'pw', 'name6', '6@a.a', '00000000000');
INSERT INTO member values('user7', 'pw', 'name7', '7@a.a', '00000000000');
INSERT INTO member values('user8', 'pw', 'name8', '8@a.a', '00000000000');
INSERT INTO member values('user9', 'pw', 'name9', '9@a.a', '00000000000');

CREATE TABLE role(
	role NUMBER,
	member VARCHAR2(40) NOT NULL
);



--CREATE TABLE POST(
--	ID NUMBER PRIMARY KEY,
--	WRITER VARCHAR2(40) NOT NULL,
--	CONTENT VARCHAR2(100) NOT NULL
--);