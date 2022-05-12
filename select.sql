-- 1.1 처리건수
SELECT COUNT(*) 
FROM report 
WHERE task_process_l1 = '(청년)내일체움공제' AND task_process_l2 = '청약신청' AND task_process_l3 = '개인/기업 회원가입';
-- 1.1 처리시간
SELECT SUM(soyosigan), SUM(soyoil)
FROM   report 
WHERE task_process_l1 = '(청년)내일체움공제' AND task_process_l2 = '청약신청' AND task_process_l3 = '개인/기업 회원가입';
-- 1.1 시간비중
SELECT  (
    ((SUM(soyoil) * 8) + SUM((soyosigan))) * 100.0 / ((SELECT (SUM(soyoil) * 8) + SUM(soyosigan) FROM report))
  ) AS percentage
FROM    report
GROUP BY 
task_process_l1,
task_process_l2,
task_process_l3
HAVING 
task_process_l1 = '(청년)내일체움공제' AND
task_process_l2 = '청약신청' AND
task_process_l3 = '개인/기업 회원가입';

-- 1. 처리건수 총합
SELECT COUNT(*)
FROM report
WHERE task_process_l1 = '(청년)내일체움공제';

-- 1. 처리시간 총합
SELECT SUM(soyosigan), SUM(soyoil)
FROM   report 
WHERE task_process_l1 = '(청년)내일체움공제';

-- 1.2 처리건수
-- SELECT COUNT(*) FROM report WHERE task_process_l1 = '(청년)내일체움공제' AND task_process_l2 = '청약신청' AND task_process_l3 = '청약신청';

-- 필요 데이터 뭉치
-- GROUP BY ... WITH ROLLUP -> 그룹별로 묶은 데이터의 합계를 구할 때 사용한다.
-- IFNULL(col, converted) -> NULL 데이터를 다른 값으로 치환할 때 사용한다.
-- TRUNCATE(num, num_for_throw) -> 버릴 자릿수 아래로 버린다.

SELECT
  IFNULL(task_process_l1, '총계') task_process_l1
, IFNULL(task_process_l2, '합계') task_process_l2
, IFNULL(task_process_l3, '소계') task_process_l3
, count(*)                                          AS 처리건수
, SUM(soyoil)                                       AS 소요일
, SUM(soyosigan)                                    AS 소요시간
, TRUNCATE
  (
    (((SUM(soyoil)) * 8) + SUM((soyosigan))) * 100.0 
    / ((SELECT ((SUM(soyoil)) * 8) + SUM(soyosigan) FROM report))
, 2)                                                AS Percentage
FROM  report
WHERE rqst_date LIKE '%_-03-%'
GROUP BY
    task_process_l1
  , task_process_l2
  , task_process_l3
WITH ROLLUP
ORDER BY IFNULL(task_process_l1,'힣1')
, IFNULL(task_process_l2,'힣2')
, IFNULL(task_process_l3,'힣3')
;
