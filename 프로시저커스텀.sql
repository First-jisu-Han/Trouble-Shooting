CREATE PROCEDURE dbo.지금 만든 한달 프로시저명 (@p_stnrStrDate CHAR(8),@p_stnrEndDate CHAR(8))
AS              
/*=============================================================================================

파라 미터 - 시작일자(@p_stnrStrDate),종료일자(@p_stnrEndDate)
리     턴 - NONE
작 성  자 - 한지수
-----------------------------------------------------------------------------------------------
변경자   변경일자    변경사유

-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- 변수 선언
-----------------------------------------------------------------------------------------------
DECLARE @v_stnr_date       CHAR(8)		   -- 기준일자


set transaction isolation level 0

BEGIN

    DECLARE cur_Rdp_Date CURSOR FOR
	    
	  SELECT DISTINCT(t1.stnr_date)
	   FROM TM_STNR_DATE t1
	   WHERE t1.stnr_date BETWEEN @p_stnrStrDate AND @p_stnrEndDate
	
	  ORDER BY t1.stnr_date
	  
	  OPEN cur_Rdp_Date
	  FETCH NEXT FROM cur_R_Date INTO @p_stnrStrDate     -- 기준시작일자
	  					 						
	  WHILE @@FETCH_STATUS =0 BEGIN	
	  
	  EXECUTE 하루 집계 프로시저명 @p_stnrStrDate
		
	  FETCH NEXT FROM cur_Rdp_Date INTO @p_stnrStrDate
	      							 	    							  	    							        
	  END                                              
	  
	  COMMIT
	  CLOSE cur_Rdp_Date
	  
	  DEALLOCATE CURSOR cur_Rdp_Date  
  END
GO

sp_procxmode 지금 만든 한달집계 프로시저명, anymode
GO

