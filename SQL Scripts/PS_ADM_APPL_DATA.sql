SELECT b.EMPLID
       , ACAD_CAREER
       , STDNT_CAR_NBR
       , ADM_APPL_NBR
       , INSTITUTION
       , ADM_APPL_CTR
       , ADMIT_TYPE
       , FIN_AID_INTEREST
       , HOUSING_INTEREST
       , APPL_FEE_STATUS
       , APPL_FEE_DT
       , NOTIFICATION_PLAN
       , REGION
       , REGION_FROM
       , LAST_SCH_ATTEND
       , ADM_CREATION_DT
       , ADM_CREATION_BY
       , ADM_UPDATED_DT
       , ADM_UPDATED_BY
       , ADM_APPL_COMPLETE
       , ADM_APPL_DT
       , ADM_APPL_CMPLT_DT
       , GRADUATION_DT
       , PRIOR_APPL
       , APPL_FEE_TYPE
       , ADM_APPL_METHOD
       , APPL_FEE_AMT
       , APPL_FEE_PAID
       , ACADEMIC_LEVEL
       , EXT_ADM_APPL_NBR
       , APP_FEE_STATUS

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

JOIN PS_ADM_APPL_DATA b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, ADM_APPL_NBR