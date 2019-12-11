CREATE TABLE member(
	id VARCHAR2(40) PRIMARY KEY,
	pw VARCHAR2(40) NOT NULL,
	name VARCHAR2(40) NOT NULL,
	email VARCHAR2(40) NOT NULL,
	tel VARCHAR2(40)
);

CREATE TABLE category(
	id NUMBER PRIMARY KEY,
	categoryname VARCHAR2(40) NOT NULL
);

CREATE TABLE post(
	id NUMBER AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR2(100) NOT NULL,
	category NUMBER NOT NULL,
	writer VARCHAR2(40) NOT NULL,
	writedate DATE default sysdate,
	modifydate DATE default sysdate,
	content VARCHAR2(1000) NOT NULL,
	FOREIGN KEY (category) REFERENCES category(id),
	FOREIGN KEY (writer) REFERENCES member(id)
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

INSERT INTO category VALUES(1, '공지사항');
INSERT INTO category VALUES(2, '자유게시판');
INSERT INTO category VALUES(3, '질문과답변');

INSERT INTO post(title, category, writer, content) VALUES('title1',1,'user1','content1');
INSERT INTO post(title, category, writer, content) VALUES('title2',2,'user2','content2');
INSERT INTO post(title, category, writer, content) VALUES('title3',1,'user3','content3');
INSERT INTO post(title, category, writer, content) VALUES('title4',1,'user2','content4');
INSERT INTO post(title, category, writer, content) VALUES('title5',2,'user4','content5');
INSERT INTO post(title, category, writer, content) VALUES('title6',3,'user2','content6');
INSERT INTO post(title, category, writer, content) VALUES('title7',1,'user7','content7');
INSERT INTO post(title, category, writer, content) VALUES('title8',2,'user7','content8');
INSERT INTO post(title, category, writer, content) VALUES('title9',1,'user9','content9');