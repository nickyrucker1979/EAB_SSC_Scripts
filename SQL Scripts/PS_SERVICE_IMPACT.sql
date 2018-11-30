SELECT INSTITUTION
       , SRVC_IND_CD
       , EFFDT
       , SERVICE_IMPACT
       , TERM_CATEGORY
       , DESCRLONG

FROM PS_SERVICE_IMPACT

WHERE 1=1
   AND INSTITUTION = ''

ORDER BY SRVC_IND_CD, EFFDT