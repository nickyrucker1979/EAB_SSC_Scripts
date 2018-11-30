SELECT EMPLID
       , NAME_TYPE
       , EFFDT
       , EFF_STATUS
       , COUNTRY_NM_FORMAT
       , NAME
       , NAME_PREFIX
       , NAME_SUFFIX
       , NAME_ROYAL_PREFIX
       , NAME_ROYAL_SUFFIX
       , NAME_TITLE
       , LAST_NAME
       , FIRST_NAME
       , MIDDLE_NAME
       , SECOND_LAST_NAME
       , PREF_FIRST_NAME
       , NAME_FORMAL
  
FROM PS_NAMES

WHERE 1=1
   AND (EMPLID IN (SELECT DISTINCT EMPLID FROM PS_EMPLOYEES
                     WHERE BUSINESS_UNIT = '')
        OR EMPLID IN (SELECT DISTINCT EMPLID FROM PS_STDNT_CAR_TERM
                        WHERE INSTITUTION = ''))

--ORDER BY EMPLID, EFFDT