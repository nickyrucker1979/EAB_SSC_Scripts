SELECT ROLEUSER
       , ROLENAME
       , DYNAMIC_SW
  
FROM PSROLEUSER

WHERE 1=1
   AND (ROLEUSER IN (SELECT DISTINCT EMPLID FROM PS_EMPLOYEES
                     WHERE BUSINESS_UNIT = '')
        OR ROLEUSER IN (SELECT DISTINCT EMPLID FROM PS_STDNT_CAR_TERM
                        WHERE INSTITUTION = ''))

ORDER BY ROLEUSER, ROLENAME