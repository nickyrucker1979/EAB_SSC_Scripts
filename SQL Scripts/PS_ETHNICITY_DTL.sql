SELECT b.EMPLID
       , REG_REGION
       , ETHNIC_GRP_CD
       , ETHNIC_PCT_NUMRATR
       , ETHNIC_PCT_DENMRTR
       , ETH_VALIDATED
       , HISP_LATINO
       , LASTUPDDTTM

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

JOIN PS_ETHNICITY_DTL b
  ON b.EMPLID = population.EMPLID

WHERE 1=1

ORDER BY b.EMPLID, ETHNIC_GRP_CD