SELECT CRSE_ID
       , CRSE_OFFER_NBR
       , STRM
       , SESSION_CODE
       , CLASS_SECTION
       , CRSE_ATTR
       , CRSE_ATTR_VALUE

FROM PS_CLASS_ATTRIBUTE

WHERE 1=1

ORDER BY CRSE_ID, STRM