SELECT CRSE_ID
       , EFFDT
       , EFF_STATUS
       , DESCR
       , EQUIV_CRSE_ID
       , CONSENT
       , ALLOW_MULT_ENROLL
       , UNITS_MINIMUM
       , UNITS_MAXIMUM
       , UNITS_ACAD_PROG
       , UNITS_FINAID_PROG
       , CRSE_REPEATABLE
       , UNITS_REPEAT_LIMIT
       , CRSE_REPEAT_LIMIT
       , GRADING_BASIS
       , SSR_COMPONENT
       , COURSE_TITLE_LONG
       , CRSE_COUNT
       , COMPONENT_PRIMARY
       , DESCRLONG

FROM PS_CRSE_CATALOG

WHERE 1=1

ORDER BY CRSE_ID, EFFDT