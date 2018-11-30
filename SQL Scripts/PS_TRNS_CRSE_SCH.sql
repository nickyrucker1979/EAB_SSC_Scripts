SELECT b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , MODEL_NBR
       , ACAD_PROG
       , ACAD_PLAN
       , TRNSFR_SRC_TYPE
       , EXT_ORG_ID
       , LS_SCHOOL_TYPE
       , LS_DATA_SOURCE
       , SRC_CAREER
       , SRC_INSTITUTION
       , SRC_ORG_NAME
       , TRANSCRIPT_LEVEL
       , MODEL_STATUS
       , UNT_TAKEN
       , UNT_TRNSFR
       , TRF_TAKEN_GPA
       , TRF_TAKEN_NOGPA
       , TRF_PASSED_GPA
       , TRF_PASSED_NOGPA
       , TRF_GRADE_POINTS
       , TRF_GPA
       , INCLUDE_IN_GPA
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

JOIN PS_TRNS_CRSE_SCH b
  ON b.EMPLID = population.EMPLId
  
WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, b.MODEL_NBR