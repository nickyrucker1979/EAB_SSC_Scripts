SELECT EMPLID
       , INSTITUTION
       , EFFDT
       , EFF_STATUS
       , ACAD_ORG
       , ADVISOR
       , INSTR_TYPE
       , INSTR_AVAILABLE

FROM PS_INSTR_ADVISOR

WHERE 1=1
   AND INSTITUTION = ''

ORDER BY EMPLID, EFFDT