SELECT INSTITUTION
       , CAMPUS
       , EFFDT
       , EFF_STATUS
       , DESCR
       , DESCRSHORT
       , LOCATION
       , FACILITY_CONFLICT

FROM PS_CAMPUS_TBL

WHERE 1=1
   --AND INSTITUTION = ''

ORDER BY CAMPUS, EFFDT