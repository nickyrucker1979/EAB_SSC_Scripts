SELECT EMPLID
       , EMPL_RCD
       , BIRTHDATE
       , BIRTHPLACE
       , DT_OF_DEATH
       , COUNTRY_NM_FORMAT
       , NAME
       , NAME_PREFIX
       , NAME_SUFFIX
       , NAME_TITLE
       , LAST_NAME
       , FIRST_NAME
       , MIDDLE_NAME
       , SECOND_LAST_NAME
       , PREF_FIRST_NAME
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
       , HOME_PHONE
       , SEX
       , FT_STUDENT
       , MILITARY_STATUS
       , PER_ORG
       , BUSINESS_TITLE
       , PROBATION_DT
       , EFFDT
       , EFFSEQ
       , HIRE_DT
       , EXPECTED_RETURN_DT
       , TERMINATION_DT
       , BUSINESS_UNIT
       , DEPTID
       , JOBCODE
       , POSITION_NBR
       , EMPL_STATUS
       , ACTION
       , ACTION_DT
       , ACTION_REASON
       , LOCATION
       , FULL_PART_TIME
       , EMPL_TYPE
       , REG_REGION
       , JOBTITLE

FROM PS_EMPLOYEES

WHERE 1=1
   AND BUSINESS_UNIT = ''

--ORDER BY EMPLID