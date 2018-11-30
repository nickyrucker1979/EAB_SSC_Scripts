SELECT CRSE_ID
       , CRSE_OFFER_NBR
       , STRM
       , SESSION_CODE
       , CLASS_SECTION
       , CLASS_MTG_NBR
       , FACILITY_ID
       , MEETING_TIME_START
       , MEETING_TIME_END
       , MON
       , TUES
       , WED
       , THURS
       , FRI
       , SAT
       , SUN
       , START_DT
       , END_DT
       , CRS_TOPIC_ID
       , STND_MTG_PAT

FROM PS_CLASS_MTG_PAT

WHERE 1=1

ORDER BY CRSE_ID, STRM, CLASS_SECTION