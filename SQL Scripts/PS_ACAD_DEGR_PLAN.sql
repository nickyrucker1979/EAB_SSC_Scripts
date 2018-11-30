SELECT b.EMPLID
       , STDNT_DEGR
       , ACAD_PLAN
       , ACAD_CAREER
       , STDNT_CAR_NBR
       , ACAD_DEGR_STATUS
       , DEGR_STATUS_DATE
       , DIPLOMA_DESCR
       , TRNSCR_DESCR
       , HONORS_PREFIX
       , HONORS_SUFFIX
       , PLAN_SEQUENCE

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

JOIN PS_ACAD_DEGR_PLAN b
  ON b.EMPLID = population.EMPLID

WHERE 1=1

ORDER BY b.EMPLID, STDNT_DEGR