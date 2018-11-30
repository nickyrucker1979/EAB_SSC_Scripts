
SELECT a.EMPLID
       , INSTITUTION
       , EFFDT
       , ADVISOR_ROLE
       , STDNT_ADVISOR_NBR
       , ACAD_PROG
       , ADVISOR_ID
       , ACAD_CAREER
       , ACAD_PLAN
       , APPROVE_ENRLMT
       , APPROVE_GRAD
       , GRAD_APPROVED
       , COMMITTEE_ID
       , COMM_PERS_CD
       , SSR_ADVR_PERCNT
FROM (--IMPLICIT POPULATION FILTER 
       SELECT EMPLID 
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
JOIN PS_STDNT_ADVR_HIST a
  ON a.EMPLID = population.EMPLID
WHERE 1=1
   AND a.INSTITUTION = ''

