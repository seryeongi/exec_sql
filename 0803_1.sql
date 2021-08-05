DROP TABLE cust;
DROP TABLE item;

CREATE TABLE cust(
	id VARCHAR(5),
	pwd VARCHAR(10) NOT NULL,
	name VARCHAR(10) NOT NULL
);
ALTER TABLE cust ADD PRIMARY KEY (id);
ALTER TABLE cust ADD CONSTRAINT UNIQUE (name); # 중복 불가 예) 이메일, 주민번호
DELETE FROM cust;

INSERT INTO cust VALUES ('id01','pwd01','이말숙');
INSERT INTO cust VALUES ('id02','pwd02','김말숙');
INSERT INTO cust VALUES ('id03','pwd03','홍말숙');
INSERT INTO cust VALUES ('id04','pwd04','정말숙');
INSERT INTO cust VALUES ('id05','pwd05','장말숙');
SELECT * FROM cust;
#-------------------------------------

CREATE TABLE item(
	id INT,
	name VARCHAR(20) NOT NULL,
	price INT NOT NULL,
	rate FLOAT,
	regdate DATE NOT NULL
);
ALTER TABLE item ADD PRIMARY KEY (id);
ALTER TABLE item MODIFY id INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 1000;
ALTER TABLE item ALTER COLUMN rate SET DEFAULT 3.3;

INSERT INTO item (name,price,regdate) VALUES ('pants1',10000,CURDATE());

SELECT * FROM item;

# ----------------------------------------------------------------------------

DELETE FROM item WHERE id = 1001;
UPDATE item SET name = 'cap', price=20000, rate=5.5 WHERE id=1002;

# -----------------------------------------------------------------------------
# cart table
DROP TABLE cart;
CREATE TABLE cart(
	id VARCHAR(5),
	id2 INT,
	regdate DATE NOT NULL,
	qt INT NOT NULL
);
ALTER TABLE cart ADD PRIMARY KEY (id,id2);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (id) REFERENCES cust (id);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (id2) REFERENCES item (id);

INSERT INTO cart VALUES('id01',1000,CURDATE(),1);
INSERT INTO cart VALUES('id01',1002,CURDATE(),2);
INSERT INTO cart VALUES('id02',1000,CURDATE(),2);
SELECT * FROM cart;

# -------------------------------------------------------------------------
# id01의 cart 정보를 출력 하시오
# 날짜, 사용자이름, 제품이름, 금액, 수량, 총금액

SELECT ca.regdate, cu.name, i.name, i.price, ca.qt, i.price*ca.qt AS total_price
FROM cart ca INNER JOIN cust cu ON ca.id=cu.id
INNER JOIN item i ON i.id=ca.id2 
WHERE cu.id='id01';

# -------------------------------------------------------------------------

CREATE TABLE board (
	board_id INT,
	id VARCHAR(10),
	title VARCHAR(200) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	regdate DATE NOT NULL,
	cnt INT
);

ALTER TABLE board ADD PRIMARY KEY (board_id);
ALTER TABLE board MODIFY board_id INT AUTO_INCREMENT;
ALTER TABLE board AUTO_INCREMENT = 100;
ALTER TABLE board ALTER COLUMN cnt SET DEFAULT 0;
ALTER TABLE board ADD CONSTRAINT FOREIGN KEY (id) REFERENCES cust (id);

INSERT INTO board (id,title,content,regdate) VALUES ('id01','test','Hi.......',CURDATE());
SELECT * FROM board;
