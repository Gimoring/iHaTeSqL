CREATE TABLE tb_client_l1 (
  id INT PRIMARY KEY,
  name VARCHAR (10)
);

DROP TABLE tb_client_l1;
DROP TABLE tb_client_l2;
DROP TABLE tb_client_l3;

CREATE TABLE tb_client_l2 (
  id INT PRIMARY KEY,
  name VARCHAR (20)
);

CREATE TABLE tb_client_l3 (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR (40)
);

INSERT INTO tb_client_l1
VALUES ('청년내일채움공제'), ('내일채움공제')


INSERT INTO tb_client_l2(id, name)
VALUES 
(1, '청약신청'), (2, '공제납입'), (3, '계약변경'), (4, '해지/취소/만기'), (5, '지급'), (6, '홈피기타'), (7, '통계 및 기타');

INSERT INTO tb_client_l3(name)
VALUES
('개인/기업 회원가입'), ('청약신청'),('청약신청 접수 및 심사'), ('납부스케쥴관리'), ('납부관리'),('계약변경사후처리(승인/거절)'),('해지/취소/만기 신청'), ('해지/취소/만기 접수'),('해지/취소/만기 처리'),('지급접수'),('지급처리(확정/승인/결의/지급')

SELECT * FROM tb_client_l2;


tb_client_l1
l1_id  NAME

tb_client_l2
l1_id  l2_id NAME

tb_client_l3
l1_id  l2_id l3_id NAME