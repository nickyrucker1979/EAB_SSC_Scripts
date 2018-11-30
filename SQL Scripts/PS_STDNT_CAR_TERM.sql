SELECT b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , b.STRM
       , REG_CARD_DATE
       , WITHDRAW_CODE
       , WITHDRAW_REASON
       , WITHDRAW_DATE
       , LAST_DATE_ATTENDED
       , STDNT_CAR_NBR
       , ACAD_PROG_PRIMARY
       , ACAD_LOAD_APPR
       , ACADEMIC_LOAD
       , FA_LOAD
       , ACAD_LEVEL_PROJ
       , ACAD_LEVEL_BOT
       , ACAD_LEVEL_EOT
       , ELIG_TO_ENROLL
       , MAX_TOTAL_UNIT
       , MAX_NOGPA_UNIT
       , MAX_AUDIT_UNIT
       , MAX_WAIT_UNIT
       , MIN_TOTAL_UNIT
       , UNT_TAKEN_PRGRSS
       , UNT_PASSD_PRGRSS
       , UNT_TAKEN_GPA
       , UNT_PASSD_GPA
       , UNT_TAKEN_NOGPA
       , UNT_PASSD_NOGPA
       , UNT_INPROG_GPA
       , UNT_INPROG_NOGPA
       , GRADE_POINTS
       , UNT_AUDIT
       , UNT_TRNSFR
       , TRF_TAKEN_GPA
       , TRF_TAKEN_NOGPA
       , TRF_PASSED_GPA
       , TRF_PASSED_NOGPA
       , TRF_GRADE_POINTS
       , UNT_TEST_CREDIT
       , UNT_OTHER
       , UNT_TAKEN_FA
       , UNT_PASSD_FA
       , UNT_TAKEN_FA_GPA
       , GRADE_POINTS_FA
       , UNT_TERM_TOT
       , RESET_CUM_STATS
       , TOT_TAKEN_PRGRSS
       , TOT_PASSD_PRGRSS
       , TOT_TAKEN_GPA
       , TOT_PASSD_GPA
       , TOT_TAKEN_NOGPA
       , TOT_PASSD_NOGPA
       , TOT_INPROG_GPA
       , TOT_INPROG_NOGPA
       , TOT_AUDIT
       , TOT_TRNSFR
       , TOT_TEST_CREDIT
       , TOT_OTHER
       , TOT_CUMULATIVE
       , TOT_GRADE_POINTS
       , TOT_TAKEN_FA
       , TOT_PASSD_FA
       , TOT_TAKEN_FA_GPA
       , TOT_GRD_POINTS_FA
       , FORM_OF_STUDY
       , TERM_TYPE
       , CLASS_RANK_NBR
       , CLASS_RANK_TOT
       , SEL_GROUP
       , TUIT_CALC_REQ
       , TUIT_CALC_DTTM
       , FA_STATS_CALC_REQ
       , FA_STATS_CALC_DTTM
       , FA_ELIGIBILITY
       , BILLING_CAREER
       , UNIT_MULTIPLIER
       , ACAD_YEAR
       , ACAD_GROUP_ADVIS
       , REFUND_PCT
       , REFUND_SCHEME
       , PRO_RATA_ELIGIBLE
       , FULLY_ENRL_DT
       , ENRL_ON_TRANS_DT
       , STATS_ON_TRANS_DT
       , FULLY_GRADED_DT
       , EXT_ORG_ID
       , COUNTRY
       , START_DATE
       , END_DATE
       , MAX_CRSE_COUNT
       , CUR_GPA
       , CUM_GPA
       , REGISTERED
       , TC_UNITS_ADJUST
       , ACAD_CAREER_FIRST
       , ACADEMIC_LOAD_DT
       , SSR_ACTIVATION_DT
       , SSR_TRF_CUR_GPA
       , SSR_COMB_CUR_GPA
       , SSR_CUM_EN_GPA
       , SSR_TOT_EN_GRDPTS
       , SSR_TOT_EN_TKNGPA
       , SSR_CUM_TR_GPA
       , SSR_TOT_TR_GRDPTS
       , SSR_TOT_TR_TKNGPA

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

JOIN PS_STDNT_CAR_TERM b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, b.STRM

