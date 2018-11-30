SELECT b.EMPLID
       , TEST_ID
       , TEST_COMPONENT
       , TEST_DT
       , LS_DATA_SOURCE
       , SCORE
       , SCORE_LETTER
       , EXT_ACAD_LEVEL
       , DATE_LOADED
       , PERCENTILE
       , TEST_ADMIN
       , TEST_INDEX

FROM (--IMPLICIT POPULATION FILTER 
       SELECT EMPLID 
              , MAX(a.STRM) AS STRM 
        FROM PS_STDNT_CAR_TERM a 
	    JOIN PS_TERM_TBL b 
		  ON b.STRM = a.STRM 
			 AND a.ACAD_CAREER = b.ACAD_CAREER
			 AND a.INSTITUTION = b.INSTITUTION
        WHERE 1=1
		   AND a.INSTITUTION = ''
        GROUP BY EMPLID 
        ----HISTORICAL FILTER 
        --HAVING Max(a.STRM) >= '2008'                        --Update to Fall 2003 term
        ----ROLLING FILTER, MODIFY -### for TIME WINDOW 
        HAVING MAX(b.TERM_END_DT) >= SYSDATE-365 
       ) population 	

JOIN PS_STDNT_TEST_COMP b
  ON b.EMPLID = population.EMPLID
  
WHERE 1=1

ORDER BY b.EMPLID, b.TEST_ID, b.TEST_DT