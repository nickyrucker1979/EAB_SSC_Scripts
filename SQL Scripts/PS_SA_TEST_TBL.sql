SELECT TEST_ID
       , EFFDT
       , EFF_STATUS
       , DESCR
       , DESCRSHORT
       , TESTING_AGENCY

FROM PS_SA_TEST_TBL

WHERE 1=1

ORDER BY TEST_ID, EFFDT