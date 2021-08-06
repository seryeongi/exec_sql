카트 조회 페이지에 출력 내용은 다음과 같다.
사용자ID가 id02인 사용자의
카트 조회 페이지에 출력 내용은 다음과 같다.
날짜, 사용자ID, 제품ID, 제품이름, 제품가격, 수량, 제품이미지이름

SELECT * FROM cart
SELECT * FROM cust
SELECT * FROM item

SELECT c.regdate, c.custid, c.itemid, i.price, c.num, i.imgname, (i.price*c.num) AS totalprice
FROM cart c
INNER JOIN item i ON c.itemid = i.id
INNER JOIN cust u ON c.custid = u.id
WHERE u.id = 'id03'