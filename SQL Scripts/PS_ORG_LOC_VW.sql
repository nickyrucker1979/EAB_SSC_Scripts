SELECT EXT_ORG_ID
       , ORG_LOCATION
       , EFF_STATUS
       , DESCR
       , DESCRSHORT
       , COUNTRY
       , ADDRESS1
       , ADDRESS2
       , ADDRESS3
       , ADDRESS4
       , CITY
       , COUNTY
       , STATE
       , POSTAL
       , GEO_CODE
       , IN_CITY_LIMIT

FROM PS_ORG_LOC_VW

ORDER BY EXT_ORG_ID