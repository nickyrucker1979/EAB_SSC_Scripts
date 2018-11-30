SELECT b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , MODEL_NBR
       , ARTICULATION_TERM
       , TRNSFR_EQVLNCY_GRP
       , TRNSFR_EQVLNCY_SEQ
       , TRNSFR_STAT
       , TRNSFR_SRC_ID
       , TRNSFR_EQVLNCY
       , TRNSFR_EQVLNCY_CMP
       , EXT_COURSE_NBR
       , SRC_TERM
       , SRC_CLASS_NBR
       , TERM_YEAR
       , EXT_TERM
       , SCHOOL_SUBJECT
       , SCHOOL_CRSE_NBR
       , DESCR
       , SSR_UNT_TAKEN_EXT
       , UNT_TAKEN
       , CRSE_GRADE_INPUT
       , CRSE_ID
       , CRSE_OFFER_NBR
       , GRADING_SCHEME
       , GRADING_BASIS
       , UNT_TRNSFR
       , CRSE_GRADE_OFF
       , GRD_PTS_PER_UNIT
       , EARN_CREDIT
       , INCLUDE_IN_GPA
       , UNITS_ATTEMPTED
       , REPEAT_CODE
       , RQMNT_DESIGNTN
       , REJECT_REASON
       , COURSE_LEVEL
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

JOIN PS_TRNS_CRSE_DTL b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''
   
ORDER BY b.EMPLID, b.ARTICULATION_TERM