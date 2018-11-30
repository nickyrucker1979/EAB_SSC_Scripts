SELECT b.EMPLID
       , ACAD_CAREER
       , STDNT_CAR_NBR
       , EFFDT
       , EFFSEQ
       , INSTITUTION
       , ACAD_PROG
       , PROG_STATUS
       , PROG_ACTION
       , ACTION_DT
       , PROG_REASON
       , ADMIT_TERM
       , EXP_GRAD_TERM
       , REQ_TERM
       , ACAD_LOAD_APPR
       , CAMPUS
       , DEGR_CHKOUT_STAT
       , COMPLETION_TERM
       , ACAD_PROG_DUAL
       , JOINT_PROG_APPR
       , ADM_APPL_NBR
       , APPL_PROG_NBR
       , DATA_FROM_ADM_APPL

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

JOIN PS_ACAD_PROG b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, EFFDT, EFFSEQ