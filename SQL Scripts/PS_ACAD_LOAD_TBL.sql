SELECT SETID
       , LEVEL_LOAD_RULE
       , EFFDT
       , TERM_CATEGORY
       , SESSION_CODE
       , UNT_TRM_TOTAL
       , ACADEMIC_LOAD
       , FA_LOAD
       , ACADEMIC_LOAD_NSLC
       , COURSE_LD_PCT
       , RES_TERMS_ADJ

FROM PS_ACAD_LOAD_TBL

WHERE 1=1

ORDER BY ACADEMIC_LOAD, EFFDT