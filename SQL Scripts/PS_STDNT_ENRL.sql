SELECT b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , b.STRM
       , CLASS_NBR
       , CRSE_CAREER
       , SESSION_CODE
       , SESSN_ENRL_CNTL
       , STDNT_ENRL_STATUS
       , ENRL_STATUS_REASON
       , ENRL_ACTION_LAST
       , ENRL_ACTN_RSN_LAST
       , ENRL_ACTN_PRC_LAST
       , STATUS_DT
       , ENRL_ADD_DT
       , ENRL_DROP_DT
       , UNT_TAKEN
       , UNT_PRGRSS
       , UNT_PRGRSS_FA
       , UNT_BILLING
       , CRSE_COUNT
       , GRADING_BASIS_ENRL
       , GRADING_BASIS_DT
       , OVRD_GRADING_BASIS
       , CRSE_GRADE_OFF
       , CRSE_GRADE_INPUT
       , GRADE_DT
       , REPEAT_CODE
       , REPEAT_DT
       , CLASS_PRMSN_NBR
       , ASSOCIATED_CLASS
       , STDNT_POSITIN
       , AUDIT_GRADE_BASIS
       , EARN_CREDIT
       , INCLUDE_IN_GPA
       , UNITS_ATTEMPTED
       , GRADE_POINTS
       , GRADE_POINTS_FA
       , GRD_PTS_PER_UNIT
       , MANDATORY_GRD_BAS
       , RSRV_CAP_NBR
       , INSTRUCTOR_ID
       , DROP_CLASS_IF_ENRL
       , OPRID
       , NOTIFY_STDNT_CHNG
       , REPEAT_CANDIDATE
       , VALID_ATTEMPT
       , GRADE_CATEGORY
       , SEL_GROUP
       , UNT_EARNED
       , LAST_UPD_DT_STMP
       , LAST_UPD_TM_STMP
       , LAST_ENRL_DT_STMP
       , LAST_ENRL_TM_STMP
       , LAST_DROP_DT_STMP
       , LAST_DROP_TM_STMP
       , ENRL_REQ_SOURCE
       , LAST_UPD_ENREQ_SRC
       , GRADING_SCHEME_ENR
       , RELATE_CLASS_NBR_1
       , RELATE_CLASS_NBR_2
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
		   AND a.INSTITUTION = ''
        GROUP BY EMPLID 
        ----HISTORICAL FILTER 
        --HAVING Max(a.STRM) >= '2008'                        --Update to Fall 2003 term
        ----ROLLING FILTER, MODIFY -### for TIME WINDOW 
        HAVING MAX(b.TERM_END_DT) >= SYSDATE-365 
       ) population 	

JOIN PS_STDNT_ENRL b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, b.STRM