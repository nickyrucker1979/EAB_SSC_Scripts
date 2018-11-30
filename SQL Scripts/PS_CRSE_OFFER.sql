SELECT CRSE_ID
       , EFFDT
       , CRSE_OFFER_NBR
       , INSTITUTION
       , ACAD_GROUP
       , SUBJECT
       , CATALOG_NBR
       , COURSE_APPROVED
       , CAMPUS
       , ACAD_ORG
       , ACAD_CAREER
       , CIP_CODE
       , HEGIS_CODE
       , SCHEDULE_COURSE

FROM PS_CRSE_OFFER

WHERE 1=1
   AND INSTITUTION = ''

ORDER BY CRSE_ID, EFFDT