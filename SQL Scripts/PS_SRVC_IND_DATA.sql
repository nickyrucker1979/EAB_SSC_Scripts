SELECT b.EMPLID
       , SRVC_IND_DTTM
       , OPRID
       , INSTITUTION
       , SRVC_IND_CD
       , SRVC_IND_REASON
       , SRVC_IND_ACT_TERM
       , SRVC_IND_ACTIVE_DT
       , SCC_SI_END_TERM
       , SCC_SI_END_DT
       , POS_SRVC_INDICATOR
       , SRVC_IND_REFRNCE
       , DEPTID
       , POSITION_NBR
       , CONTACT
       , CONTACT_ID
       , CURRENCY_CD
       , AMOUNT
       , PLACED_METHOD

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

JOIN PS_SRVC_IND_DATA b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, SRVC_IND_DTTM