# 1대1문의 삭제: dlt_ysno='Y' 채번 작동안하는 문제. 삭제 후 채번이 duplicated 됨. 채번이 pk 이기때문에 unique해야함.

SELECT * FROM TD_BLTN_SNTN_CSTM 
WHERE blbr_num='0000000003'
ORDER BY cret_dttm desc;
 
SELECT * FROM TD_BLTN_SNTN_RPPR_ID
WHERE blbr_num='0000000003'
ORDER BY cret_dttm DESC;
 
 
SELECT * FROM TD_BLTN_SNTN
WHERE blbr_num='0000000003'
ORDER BY cret_dttm DESC;
 
 # 데이터를 3테이블에서 모두 수동으로 삭제 쿼리 날려야 문의 게시글을 올릴 수 있는 이슈 찾음
 
DELETE FROM TD_BLTN_SNTN_RPPR_ID
WHERE blbr_num='0000000003' AND 
bltn_sntn_num='0000000420';
 
DELETE FROM TD_BLTN_SNTN_CSTM 
WHERE blbr_num='0000000003' AND 
bltn_sntn_num='0000000420';
 
DELETE FROM TD_BLTN_SNTN 
WHERE blbr_num='0000000003' AND 
bltn_sntn_num='0000000420';
