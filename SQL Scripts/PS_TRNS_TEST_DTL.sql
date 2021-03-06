SELECT b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , MODEL_NBR
       , ARTICULATION_TERM
       , TRNSFR_EQVLNCY_GRP
       , TRNSFR_EQVLNCY_SEQ
       , TRNSFR_STAT
       , TST_EQVLNCY
       , TRNSFR_EQVLNCY_CMP
       , TEST_ID
       , TEST_COMPONENT
       , DESCR
       , TEST_DT
       , LS_DATA_SOURCE
       , SCORE
       , PERCENTILE
       , CRSE_ID
       , CRSE_OFFER_NBR
       , UNT_TRNSFR
       , GRADING_SCHEME
       , GRADING_BASIS
       , CRSE_GRADE_OFF
       , GRD_PTS_PER_UNIT
       , EARN_CREDIT
       , INCLUDE_IN_GPA
       , UNITS_ATTEMPTED
       , REPEAT_CODE
       , RQMNT_DESIGNTN
       , REJECT_REASON
       , VALID_ATTEMPT
       , GRADE_CATEGORY

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

JOIN PS_TRNS_TEST_DTL b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, b.ARTICULATION_TERM