CREATE PROCEDURE dbo.PR_SS_DY_VNDR_SLS_DSM_TERM (@p_stnrStrDate CHAR(8),@p_stnrEndDate CHAR(8))
AS              
/*=============================================================================================
함수 원형 - KHPL..PR_SS_DY_VNDR_SLS_DSM_TERM
설     명  - 파트너 포탈 내 매출조회 집계를 한달단위로 하기위함.
파라 미터 - 시작일자(@p_stnrStrDate),종료일자(@p_stnrEndDate)
리     턴 - NONE
작성 일자 -2022.11.24
작 성  자 - 한지수
테 스  트 -
-----------------------------------------------------------------------------------------------
변경자   변경일자    변경사유

-----------------------------------------------------------------------------------------------
테스트 기간   수불처    테스트 시간

================================================================================================*/

-----------------------------------------------------------------------------------------------
-- 변수 선언
-----------------------------------------------------------------------------------------------
DECLARE @v_clsgRsltCode    NUMERIC(1)      -- 마감 진행여부  성공 = 1 ,실패  = 0  
DECLARE @v_execRsltMsg     VARCHAR(1000)   -- 실행 결과 메세지
DECLARE @v_errCode         VARCHAR(10)     -- 에러코드
DECLARE @v_stnr_date       CHAR(8)		   -- 기준일자
DECLARE @v_emplId          VARCHAR(20)

set transaction isolation level 0
SET @v_emplId='11405'

BEGIN

    DECLARE cur_Rdp_Date CURSOR FOR
	    
	  SELECT DISTINCT(t1.stnr_date)
	   FROM KHCM..TM_STNR_DATE t1
	   WHERE t1.stnr_date BETWEEN @p_stnrStrDate AND @p_stnrEndDate
	
	  ORDER BY t1.stnr_date
	  
	  OPEN cur_Rdp_Date
	  FETCH NEXT FROM cur_Rdp_Date INTO @p_stnrStrDate     -- 기준시작일자
	  					 						
	  WHILE @@FETCH_STATUS =0 BEGIN	
	  
	  EXECUTE KHPL..PR_SS_DY_VNDR_SLS_DSM @p_stnrStrDate
		
	  FETCH NEXT FROM cur_Rdp_Date INTO @p_stnrStrDate
	      							 	    							  	    							        
	  END                                              
	  
	  COMMIT
	  CLOSE cur_Rdp_Date
	  
	  DEALLOCATE CURSOR cur_Rdp_Date  
  END
GO

sp_procxmode PR_SS_DY_VNDR_SLS_DSM_TERM, anymode
GO