SELECT FIELDNAME
       , FIELDVALUE
       , EFFDT
       , EFF_STATUS
       , XLATLONGNAME
       , XLATSHORTNAME
       , LASTUPDDTTM

FROM PSXLATITEM

WHERE 1=1

ORDER BY FIELDNAME, FIELDVALUE, EFFDT