SELECT INSTITUTION
       , ACAD_GROUP
       , EFFDT
       , EFF_STATUS
       , DESCR
       , DESCRSHORT
       , STDNT_SPEC_PERM
       , AUTO_ENRL_WAITLIST

FROM PS_ACAD_GROUP_TBL

WHERE 1=1
   AND INSTITUTION = ''

ORDER BY ACAD_GROUP, EFFDT