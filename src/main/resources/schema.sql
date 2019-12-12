CREATE TABLE member(
	id VARCHAR2(40) PRIMARY KEY,
	pw VARCHAR2(40) NOT NULL,
	name VARCHAR2(40) NOT NULL,
	email VARCHAR2(40) NOT NULL,
	tel VARCHAR2(40)
);

CREATE TABLE reporter(
    member VARCHAR2(40) PRIMARY KEY,
    FOREIGN KEY (member) REFERENCES member(id)
);

CREATE TABLE enterprise(
    member VARCHAR2(40) PRIMARY KEY,
    FOREIGN KEY (member) REFERENCES member(id)
);

CREATE TABLE category(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    categoryname VARCHAR(40)
);

CREATE TABLE post(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR2(100) NOT NULL,
	writer VARCHAR2(40),
	writedate DATE default sysdate,
	modifydate DATE default sysdate,
	content VARCHAR2(1000) NOT NULL,
    category INT,
	FOREIGN KEY (writer) REFERENCES member(id) ON DELETE SET NULL,
    FOREIGN KEY (category) REFERENCES category(id)
);

CREATE TABLE comment(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    writer VARCHAR2(40),
    writedate DATE DEFAULT sysdate,
    modifydate DATE DEFAULT sysdate,
    content VARCHAR2(1000),
    post INTEGER,
    FOREIGN KEY (writer) REFERENCES member(id) ON DELETE SET NULL,
    FOREIGN KEY (post) REFERENCES post(id)
);

CREATE TABLE jobs(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR2(40),
    writer VARCHAR2(40),
    writedate DATE DEFAULT sysdate,
    modifydate DATE DEFAULT sysdate,
    salary VARCHAR2(40),
    career VARCHAR2(40),
    content VARCHAR2(1000),
    FOREIGN KEY (writer) REFERENCES member(id) ON DELETE SET NULL
);

CREATE TABLE question(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR2(40),
    writer VARCHAR2(40) DEFAULT sysdate,
    writedate DATE DEFAULT sysdate,
    modifydate DATE DEFAULT sysdate,
    content VARCHAR2(1000),
    FOREIGN KEY (writer) REFERENCES member(id) ON DELETE SET NULL
);

CREATE TABLE answer(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    writer VARCHAR2(40),
    writedate DATE DEFAULT sysdate,
    modifydate DATE DEFAULT sysdate,
    content VARCHAR2(1000),
    questionid INTEGER,
    FOREIGN KEY (writer) REFERENCES member(id) ON DELETE SET NULL,
    FOREIGN KEY (questionid) REFERENCES question(id)
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
INSERT INTO member values('user10', 'pw', 'name10', '10@a.a', '00000000000');
INSERT INTO member values('user11', 'pw', 'name11', '11@a.a', '00000000000');
INSERT INTO member values('user12', 'pw', 'name12', '12@a.a', '00000000000');
INSERT INTO member values('user13', 'pw', 'name13', '13@a.a', '00000000000');
INSERT INTO member values('user14', 'pw', 'name14', '14@a.a', '00000000000');
INSERT INTO member values('user15', 'pw', 'name15', '15@a.a', '00000000000');
INSERT INTO member values('user16', 'pw', 'name16', '16@a.a', '00000000000');
INSERT INTO member values('user17', 'pw', 'name17', '17@a.a', '00000000000');
INSERT INTO member values('user18', 'pw', 'name18', '18@a.a', '00000000000');
INSERT INTO member values('user19', 'pw', 'name19', '19@a.a', '00000000000');
INSERT INTO member values('user20', 'pw', 'name20', '20@a.a', '00000000000');
INSERT INTO member values('user21', 'pw', 'name21', '21@a.a', '00000000000');
INSERT INTO member values('user22', 'pw', 'name22', '22@a.a', '00000000000');
INSERT INTO member values('user23', 'pw', 'name23', '23@a.a', '00000000000');
INSERT INTO member values('user24', 'pw', 'name24', '24@a.a', '00000000000');
INSERT INTO member values('user25', 'pw', 'name25', '25@a.a', '00000000000');
INSERT INTO member values('user26', 'pw', 'name26', '26@a.a', '00000000000');
INSERT INTO member values('user27', 'pw', 'name27', '27@a.a', '00000000000');
INSERT INTO member values('user28', 'pw', 'name28', '28@a.a', '00000000000');
INSERT INTO member values('user29', 'pw', 'name29', '29@a.a', '00000000000');
INSERT INTO member values('user30', 'pw', 'name30', '30@a.a', '00000000000');

INSERT INTO reporter values('user21');
INSERT INTO reporter values('user22');
INSERT INTO reporter values('user23');
INSERT INTO reporter values('user24');
INSERT INTO reporter values('user25');

INSERT INTO enterprise values('user26');
INSERT INTO enterprise values('user27');
INSERT INTO enterprise values('user28');
INSERT INTO enterprise values('user29');
INSERT INTO enterprise values('user30');

INSERT INTO category(categoryname) VALUES('IT뉴스');
INSERT INTO category(categoryname) VALUES('자유게시판');

INSERT INTO post(title, writer, content , category) VALUES('Hello :)','user1','안녕하세요!', 2);
INSERT INTO post(title, writer, content , category) VALUES('Free Board','user12','It is FreeBoard', 2);
INSERT INTO post(title, writer, content , category) VALUES('Spring Boot Website','user4','Spring Boot is Awesome!!!', 2);
INSERT INTO post(title, writer, content , category) VALUES('Hello, World','user1','Hello, World', 2);
INSERT INTO post(title, writer, content , category) VALUES('Fresh Meat!!!','user13','Meat is Delicious!!!', 2);
INSERT INTO post(title, writer, content , category) VALUES('배고프다','user8','오늘 뭐먹지', 2);
INSERT INTO post(title, writer, content , category) VALUES('ㅁㄴㅇㄹㄴㅇㄻㄴㅇ','user10','ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅇㅁ?', 2);
INSERT INTO post(title, writer, content , category) VALUES('OpenAI 발표','user21','일론머스크가 오픈소스 인공지능 라이브러리인 OpenAI를 발표', 1);
INSERT INTO post(title, writer, content , category) VALUES('인텔의 하스웰 부활','user22','인텔이 22nm 공정의 하스웰 프로세서를 다시 만들기로 결정', 1);
INSERT INTO post(title, writer, content , category) VALUES('뭔가 내용은 채워야 할거 같은데','user9','채울 내용이 생각 안나네 ㅁㄴㅇㄹ', 2);
INSERT INTO post(title, writer, content , category) VALUES('스터디 모집합니다.','user11','같이 공부하실분을 모집합니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('치열한 CPU 경쟁','user21','보급현 프로세서에 대한 인텔과 AMD의 경쟁이 점점 심해짐', 1);
INSERT INTO post(title, writer, content , category) VALUES('새 저가형 GPU 출시','user25','엔비디아에서 보급형 그래픽카드인 GTX 1650 라인업 출시 발표', 1);
INSERT INTO post(title, writer, content , category) VALUES('3진법 반도체 소자','user23','삼성에서 최초로 3진법 반도체 소자를 발표. 기존 2진법 반도체에 비해 우수한 전성비가 강점', 1);
INSERT INTO post(title, writer, content , category) VALUES('USB 4.0 발표','user22','새 USB 규격인 USB 4.0발표. 4.0부터는 DP alt mode가 필수로 지원됨', 1);
INSERT INTO post(title, writer, content , category) VALUES('컴퓨터 또 뻗음','user10','내 작업물들!!!!', 2);
INSERT INTO post(title, writer, content , category) VALUES('안녕하세요!!','user25','반가워요 :)', 2);
INSERT INTO post(title, writer, content , category) VALUES('스레드리퍼 3세대 벤치마킹 결과 발표','user23','AMD의 하이엔드 CPU인 스레드리퍼 3세대의 벤치마팅 결과가 발표됨', 1);
INSERT INTO post(title, writer, content , category) VALUES('인텔, 모뎀 사업 철수 선언','user24','이익률 저조를 이유로 인텔이 모뎀 사업에서 철수하겠다고 결정', 1);
INSERT INTO post(title, writer, content , category) VALUES('인텔 X570 칩셋에 취약점 발견','user25','인텔의 x570칩셋에서 취약점 발견. 이전세대보다 더욱 심각한 취약점이라고 예상', 1);
INSERT INTO post(title, writer, content , category) VALUES('AMD와 엔비디아, 새 GPU는 삼성과 협력하여 출시','user24','경쟁력 확보를 위해 AMD와 엔비디아 모두 삼성과의 협력으로 새 GPU를 출시하겠다고 발표', 1);
INSERT INTO post(title, writer, content , category) VALUES('CPU 이거 어떤가요?','user14','라이젠 스레드리퍼 3세대 쓸만한가요?', 2);
INSERT INTO post(title, writer, content , category) VALUES('새 컴퓨터 배송준비중이네요','user24','벌써 기대됩니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('오늘 프로그램 배포하는 날입니다.','user15','첫 프로젝트가 배포까지 되는게 매우 뿌듯합니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('이번 회사 코딩테스트는 꽤 어려웠네요','user25','아무래도 좀더 공부해야 할듯 해요', 2);
INSERT INTO post(title, writer, content , category) VALUES('이번에 화면 설계하는데','user26','만들어야 할게 많군요', 2);
INSERT INTO post(title, writer, content , category) VALUES('오늘은 서버가 터져버렸습니다.','user4','이건 또 언제 고치려나', 2);
INSERT INTO post(title, writer, content , category) VALUES('DB 만지는거 재밌네요','user13','MySQL 처음인데 꽤 재밌습니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('인메모리 DB','user22','가볍지만 뎅터가 휘발성이라는 단점이 있습니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('테스트용 DB는 보통 어떤걸 쓰시나요','user23','H2랑 HyperSql중에 고민입니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('CSS는 항상 어렵네요','user5','할때마다 원하는 디자인으로 안나와요', 2);
INSERT INTO post(title, writer, content , category) VALUES('Node.js','user16','자바스크립트 기반의 서버 사이드 언어', 2);
INSERT INTO post(title, writer, content , category) VALUES('여기는 개발자 커뮤니티입니다.','user30','제목이 내용입니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('영어공부','user6','일단 인터넷에서 자료 검색 할 수 있는 정도는 해두셔야 개발할 때 편합니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('자료구조','user28','리스트, 힙, 스택, 그래프, 이진 트리 등등', 2);
INSERT INTO post(title, writer, content , category) VALUES('스프링','user27','기존 JSP에서 MVC모델을 기반으로 한 웹 프레임워크', 2);
INSERT INTO post(title, writer, content , category) VALUES('웹서버','user29','여러분들은 보통 어떤걸 주로 쓰시나요', 2);
INSERT INTO post(title, writer, content , category) VALUES('집에 가고 싶다','user2','집에 가고 싶다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('제목','user20','내용', 2);
INSERT INTO post(title, writer, content , category) VALUES('최근에 드라마 재밌게 봤네요','user21','한번 봐보시는걸 추천합니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('제목','user1','내용', 2);
INSERT INTO post(title, writer, content , category) VALUES('훈민정음','user3','나라의 말이 중국과 달라...', 2);
INSERT INTO post(title, writer, content , category) VALUES('책 추천','user6','소프트웨어 장인, 클린코드', 2);
INSERT INTO post(title, writer, content , category) VALUES('최근에 소설을 재미있게 봤어요','user19','한번쯤 읽어보는 걸 추천합니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('올바른 코드 작성법','user10','다른 사람이 읽기 편하게 짜는게 중요하다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('대학교 곧 졸업','user7','이제 취업을 준비해야 할 듯 합니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('음료수 추천','user18','데자와 맛있습니다.', 2);
INSERT INTO post(title, writer, content , category) VALUES('오늘 먹은 아이스크림','user11','민트초코', 2);
INSERT INTO post(title, writer, content , category) VALUES('펩시 VS 코카콜라','user20','전 코카콜라', 2);
INSERT INTO post(title, writer, content , category) VALUES('파이썬','user17','텐서플로우가 재미있네요', 2);

INSERT INTO comment(writer, content, post) VALUES('user1','테스트 댓글', 1);
INSERT INTO comment(writer, content, post) VALUES('user2','테스트 댓글', 12);
INSERT INTO comment(writer, content, post) VALUES('user17','테스트 댓글', 27);
INSERT INTO comment(writer, content, post) VALUES('user9','테스트 댓글', 39);
INSERT INTO comment(writer, content, post) VALUES('user23','테스트 댓글', 41);
INSERT INTO comment(writer, content, post) VALUES('user2','테스트 댓글', 28);
INSERT INTO comment(writer, content, post) VALUES('user1','테스트 댓글', 30);
INSERT INTO comment(writer, content, post) VALUES('user18','테스트 댓글', 2);
INSERT INTO comment(writer, content, post) VALUES('user24','테스트 댓글', 25);
INSERT INTO comment(writer, content, post) VALUES('user23','테스트 댓글', 11);
INSERT INTO comment(writer, content, post) VALUES('user1','테스트 댓글', 26);
INSERT INTO comment(writer, content, post) VALUES('user17','테스트 댓글', 13);
INSERT INTO comment(writer, content, post) VALUES('user9','테스트 댓글', 38);
INSERT INTO comment(writer, content, post) VALUES('user26','테스트 댓글', 45);
INSERT INTO comment(writer, content, post) VALUES('user24','테스트 댓글', 40);
INSERT INTO comment(writer, content, post) VALUES('user17','테스트 댓글', 7);
INSERT INTO comment(writer, content, post) VALUES('user5','테스트 댓글', 40);
INSERT INTO comment(writer, content, post) VALUES('user16','테스트 댓글', 8);
INSERT INTO comment(writer, content, post) VALUES('user11','테스트 댓글', 1);
INSERT INTO comment(writer, content, post) VALUES('user27','테스트 댓글', 9);
INSERT INTO comment(writer, content, post) VALUES('user28','테스트 댓글', 25);
INSERT INTO comment(writer, content, post) VALUES('user10','테스트 댓글', 37);
INSERT INTO comment(writer, content, post) VALUES('user27','테스트 댓글', 28);
INSERT INTO comment(writer, content, post) VALUES('user6','테스트 댓글', 6);
INSERT INTO comment(writer, content, post) VALUES('user21','테스트 댓글', 3);
INSERT INTO comment(writer, content, post) VALUES('user27','테스트 댓글', 5);
INSERT INTO comment(writer, content, post) VALUES('user6','테스트 댓글', 37);
INSERT INTO comment(writer, content, post) VALUES('user9','테스트 댓글', 7);
INSERT INTO comment(writer, content, post) VALUES('user4','테스트 댓글', 39);
INSERT INTO comment(writer, content, post) VALUES('user22','테스트 댓글', 1);
INSERT INTO comment(writer, content, post) VALUES('user5','테스트 댓글', 14);
INSERT INTO comment(writer, content, post) VALUES('user8','테스트 댓글', 24);
INSERT INTO comment(writer, content, post) VALUES('user16','테스트 댓글', 50);
INSERT INTO comment(writer, content, post) VALUES('user19','테스트 댓글', 10);
INSERT INTO comment(writer, content, post) VALUES('user16','테스트 댓글', 36);
INSERT INTO comment(writer, content, post) VALUES('user20','테스트 댓글', 41);
INSERT INTO comment(writer, content, post) VALUES('user22','테스트 댓글', 5);
INSERT INTO comment(writer, content, post) VALUES('user18','테스트 댓글', 29);
INSERT INTO comment(writer, content, post) VALUES('user23','테스트 댓글', 1);
INSERT INTO comment(writer, content, post) VALUES('user22','테스트 댓글', 50);
INSERT INTO comment(writer, content, post) VALUES('user19','테스트 댓글', 15);
INSERT INTO comment(writer, content, post) VALUES('user5','테스트 댓글', 49);
INSERT INTO comment(writer, content, post) VALUES('user8','테스트 댓글', 3);
INSERT INTO comment(writer, content, post) VALUES('user7','테스트 댓글', 18);
INSERT INTO comment(writer, content, post) VALUES('user25','테스트 댓글', 6);
INSERT INTO comment(writer, content, post) VALUES('user19','테스트 댓글', 23);
INSERT INTO comment(writer, content, post) VALUES('user15','테스트 댓글', 35);
INSERT INTO comment(writer, content, post) VALUES('user25','테스트 댓글', 42);
INSERT INTO comment(writer, content, post) VALUES('user7','테스트 댓글', 47);
INSERT INTO comment(writer, content, post) VALUES('user24','테스트 댓글', 17);
INSERT INTO comment(writer, content, post) VALUES('user14','테스트 댓글', 30);
INSERT INTO comment(writer, content, post) VALUES('user15','테스트 댓글', 19);
INSERT INTO comment(writer, content, post) VALUES('user14','테스트 댓글', 16);
INSERT INTO comment(writer, content, post) VALUES('user7','테스트 댓글', 23);
INSERT INTO comment(writer, content, post) VALUES('user6','테스트 댓글', 47);
INSERT INTO comment(writer, content, post) VALUES('user18','테스트 댓글', 48);
INSERT INTO comment(writer, content, post) VALUES('user25','테스트 댓글', 22);
INSERT INTO comment(writer, content, post) VALUES('user29','테스트 댓글', 1);
INSERT INTO comment(writer, content, post) VALUES('user29','테스트 댓글', 34);
INSERT INTO comment(writer, content, post) VALUES('user15','테스트 댓글', 43);
INSERT INTO comment(writer, content, post) VALUES('user28','테스트 댓글', 4);
INSERT INTO comment(writer, content, post) VALUES('user29','테스트 댓글', 17);
INSERT INTO comment(writer, content, post) VALUES('user14','테스트 댓글', 26);
INSERT INTO comment(writer, content, post) VALUES('user3','테스트 댓글', 31);
INSERT INTO comment(writer, content, post) VALUES('user4','테스트 댓글', 43);
INSERT INTO comment(writer, content, post) VALUES('user20','테스트 댓글', 5);
INSERT INTO comment(writer, content, post) VALUES('user10','테스트 댓글', 25);
INSERT INTO comment(writer, content, post) VALUES('user10','테스트 댓글', 2);
INSERT INTO comment(writer, content, post) VALUES('user3','테스트 댓글', 4);
INSERT INTO comment(writer, content, post) VALUES('user8','테스트 댓글', 21);
INSERT INTO comment(writer, content, post) VALUES('user13','테스트 댓글', 44);
INSERT INTO comment(writer, content, post) VALUES('user26','테스트 댓글', 27);
INSERT INTO comment(writer, content, post) VALUES('user30','테스트 댓글', 18);
INSERT INTO comment(writer, content, post) VALUES('user4','테스트 댓글', 47);
INSERT INTO comment(writer, content, post) VALUES('user12','테스트 댓글', 26);
INSERT INTO comment(writer, content, post) VALUES('user13','테스트 댓글', 3);
INSERT INTO comment(writer, content, post) VALUES('user13','테스트 댓글', 32);
INSERT INTO comment(writer, content, post) VALUES('user20','테스트 댓글', 36);
INSERT INTO comment(writer, content, post) VALUES('user21','테스트 댓글', 49);
INSERT INTO comment(writer, content, post) VALUES('user30','테스트 댓글', 45);
INSERT INTO comment(writer, content, post) VALUES('user12','테스트 댓글', 19);
INSERT INTO comment(writer, content, post) VALUES('user30','테스트 댓글', 13);
INSERT INTO comment(writer, content, post) VALUES('user12','테스트 댓글', 17);
INSERT INTO comment(writer, content, post) VALUES('user28','테스트 댓글', 19);
INSERT INTO comment(writer, content, post) VALUES('user26','테스트 댓글', 48);
INSERT INTO comment(writer, content, post) VALUES('user21','테스트 댓글', 3);
INSERT INTO comment(writer, content, post) VALUES('user11','테스트 댓글', 33);
INSERT INTO comment(writer, content, post) VALUES('user2','테스트 댓글', 46);
INSERT INTO comment(writer, content, post) VALUES('user3','테스트 댓글', 20);
INSERT INTO comment(writer, content, post) VALUES('user11','테스트 댓글', 2);

INSERT INTO jobs(title, writer, salary, career, content) VALUES('바른기업 신입 공개채용','user26','2400','신입','정보처리(산업)기사 우대');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('다담아이티 공개채용','user27','2400~3000','신입/경력','비전공자도 지원 가능');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('삼베이 기술직 채용','user30','2500~3200','신입/경력','2년제 이상');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('아이프로 경력직 구인','user29','3000~3600','경력','경력기술서 필수');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('바른기업 경력직 공개채용','user26','3200~3800','경력','포트폴리오 필수');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('하이텍 경력자 모집','user28','3500~4000','경력','정보처리기사 우대');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('삼베이 기술직 채용','user30','2500~3200','신입/경력','포트폴리오 필수');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('다담아이티 공개채용','user27','2400~3000','신입/경력','비전공자도 지원가능, 관련전공자 우대');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('하이텍 신입 모집','user28','2400~2600','신입','정보처리(산업)기사 우대');
INSERT INTO jobs(title, writer, salary, career, content) VALUES('아이프로 신입 구인','user29','2500~2800','신입','비전공자도 지원 가능');

INSERT INTO question(title, writer, content) VALUES('스프링 AOP','user1','스프링 AOP가 무엇인가요?');
INSERT INTO question(title, writer, content) VALUES('예외처리','user3','자바에서 예외처리는 어떻게 하나요');
INSERT INTO question(title, writer, content) VALUES('HTML','user5','HTML이 뭘하는 건가요');
INSERT INTO question(title, writer, content) VALUES('CSS','user10','초보자곧 다루기 쉬운 CSS 라이브러리 추천 부탁드립니다.');
INSERT INTO question(title, writer, content) VALUES('처음 배울만한 프로그래밍 언어 추천','user13','처음으로 프로그래밍을 배우는데 뭐부터 하면 좋을까요');
INSERT INTO question(title, writer, content) VALUES('저녁 메뉴 추천','user9','오늘 저녁 뭐먹죠?');
INSERT INTO question(title, writer, content) VALUES('공부할 때 참고할 만한 사이트','user17','웹 개발을 배우고 싶은데 어느 사이트를 가보는게 좋을까요');
INSERT INTO question(title, writer, content) VALUES('자료구조 질문','user30','선형 자료구조의 종류가 무엇이 있나요');
INSERT INTO question(title, writer, content) VALUES('PC 견적 질문','user1','서버용 컴퓨터를 장만하려는데 cpu는 어떤걸 쓰는게 좋나요');
INSERT INTO question(title, writer, content) VALUES('머신러닝 방식 종류','user4','머신러닝을 하는 방법들에 뭐가 있나요');

INSERT INTO answer(writer, content, questionid) VALUES('user4','자바에서 예외처리는 try ~ catch 문으로 처리합니다.',2);
INSERT INTO answer(writer, content, questionid) VALUES('user15','뜨끈하고 든든한 국밥 한그릇 어때요?',6);
INSERT INTO answer(writer, content, questionid) VALUES('user19','웹 개발 공부라면 W3Schools 추천합니다.',7);
INSERT INTO answer(writer, content, questionid) VALUES('user7','스택, 큐, 리스트등이 대표적인 선형 자료구조입니다.',8);
INSERT INTO answer(writer, content, questionid) VALUES('user13','Bootstrap이 다루기 편할겁니다.',4);