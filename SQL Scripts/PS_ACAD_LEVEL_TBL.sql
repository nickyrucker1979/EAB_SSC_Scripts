SELECT SETID
       , LEVEL_LOAD_RULE
       , EFFDT
       , UNT_CUM_TOTAL
       , ACADEMIC_LEVEL

FROM PS_ACAD_LEVEL_TBL

WHERE 1=1

ORDER BY ACADEMIC_LEVEL, EFFDT