SELECT SETID
       , REPEAT_SCHEME
       , EFFDT
       , REPEAT_CODE
       , DESCR
       , DESCRSHORT
       , EARN_CREDIT
       , UNITS_ATTEMPTED
       , INCLUDE_IN_GPA
       , DESCRFORMAL

FROM PS_REPEAT_CODE_TBL

WHERE 1=1

ORDER BY REPEAT_CODE, EFFDT