SELECT INSTITUTION
       , SUBJECT
       , EFFDT
       , EFF_STATUS
       , DESCR
       , DESCRSHORT
       , ACAD_ORG
       , CIP_CODE
       , HEGIS_CODE
       , DESCRFORMAL

FROM PS_SUBJECT_TBL

WHERE 1=1
   AND INSTITUTION = ''

ORDER BY SUBJECT, EFFDT