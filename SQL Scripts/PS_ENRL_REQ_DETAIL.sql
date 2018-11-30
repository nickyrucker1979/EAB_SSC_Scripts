SELECT ENRL_REQUEST_ID
       , ENRL_REQ_DETL_SEQ
       , b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , b.STRM
       , CLASS_NBR
       , ENRL_REQ_ACTION
       , ENRL_ACTION_REASON
       , ENRL_ACTION_DT
       , UNT_TAKEN
       , UNT_EARNED
       , CRSE_COUNT
       , REPEAT_CODE
       , CRSE_GRADE_INPUT
       , GRADING_BASIS_ENRL
       , CLASS_PRMSN_NBR
       , CLASS_NBR_CHG_TO
       , DROP_CLASS_IF_ENRL
       , CHG_TO_WL_NUM
       , RELATE_CLASS_NBR_1
       , RELATE_CLASS_NBR_2
       --, OVRD_CLASS_LIMIT
       --, OVRD_GRADING_BASIS
       --, OVRD_CLASS_UNITS
       --, OVRD_UNIT_LOAD
       --, OVRD_CLASS_LINKS
       --, OVRD_CLASS_PRMSN
       --, OVRD_REQUISITES
       --, OVRD_TIME_CNFLCT
       --, OVRD_CAREER
       , WAIT_LIST_OKAY
       --, OVRD_ENRL_ACTN_DT
       --, OVRD_RQMNT_DESIG
       --, OVRD_SRVC_INDIC
       --, OVRD_APPT
       --, INSTRUCTOR_ID
       , ENRL_REQ_DETL_STAT
       , OPRID
       , DTTM_STAMP_SEC
       , ACAD_PROG

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

JOIN PS_ENRL_REQ_DETAIL b
  ON b.EMPLId = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, b.STRM, CLASS_NBR, ENRL_REQUEST_ID