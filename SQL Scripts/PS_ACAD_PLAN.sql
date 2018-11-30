SELECT b.EMPLID
       , ACAD_CAREER
       , STDNT_CAR_NBR
       , EFFDT
       , EFFSEQ
       , ACAD_PLAN
       , DECLARE_DT
       , PLAN_SEQUENCE
       , REQ_TERM
       , COMPLETION_TERM
       , STDNT_DEGR
       , DEGR_CHKOUT_STAT
       , ADVIS_STATUS

FROM (--IMPLICIT POPULATION FILTER 
       SELECT EMPLID 
              , MAX(a.STRM) AS STRM 
        FROM PS_STDNT_CAR_TERM a 
	    JOIN PS_TERM_TBL b 
		  ON b.STRM = a.STRM 
			 AND a.ACAD_CAREER = b.ACAD_CAREER
			 AND a.INSTITUTION = b.INSTITUTION
        WHERE 1=1
		   AND a.INSTITUTION = ''  --Danville Only
        GROUP BY EMPLID 
        ----HISTORICAL FILTER 
        --HAVING Max(a.STRM) >= '2008'                        --Update to Fall 2003 term
        ----ROLLING FILTER, MODIFY -### for TIME WINDOW 
        HAVING MAX(b.TERM_END_DT) >= SYSDATE-365 
       ) population 	

JOIN PS_ACAD_PLAN b
  ON b.EMPLID = population.EMPLID

WHERE 1=1

ORDER BY b.EMPLID, EFFDT, EFFSEQ, PLAN_SEQUENCE