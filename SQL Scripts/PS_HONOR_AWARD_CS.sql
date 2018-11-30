SELECT b.EMPLID
       , DT_RECVD
       , INTERNAL_EXTERNAL
       , INSTITUTION
       , ACAD_CAREER
       , b.STRM
       , AWARD_CODE
       , DESCRFORMAL
       , GRANTOR
       , ACAD_PROG
       , ACAD_PLAN
       , TRANSCRIPT_LEVEL
       , AWRD_SYS_GENERATED
       , COMMENTS
 
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

JOIN PS_HONOR_AWARD_CS b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, b.STRM