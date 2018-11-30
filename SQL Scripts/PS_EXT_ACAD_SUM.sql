SELECT b.EMPLID
       , EXT_ORG_ID
       , EXT_CAREER
       , EXT_DATA_NBR
       , EXT_SUMM_TYPE
       , EXT_ACAD_LEVEL
       , TERM_YEAR
       , EXT_TERM_TYPE
       , EXT_TERM
       , INSTITUTION
       , UNT_TYPE
       , UNT_ATMP_TOTAL
       , UNT_COMP_TOTAL
       , CLASS_RANK
       , CLASS_SIZE
       , GPA_TYPE
       , EXT_GPA
       , CONVERT_GPA
       , PERCENTILE
       , RANK_TYPE

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

JOIN PS_EXT_ACAD_SUM b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''  

ORDER BY b.EMPLID