SELECT b.EMPLID
       , ACAD_CAREER
       , INSTITUTION
       , EFFECTIVE_TERM
       , RESIDENCY_DT
       , RESIDENCY
       , ADMISSION_RES
       , FIN_AID_FED_RES
       , FIN_AID_ST_RES
       , TUITION_RES
       , ADMISSION_EXCPT
       , FIN_AID_FED_EXCPT
       , FIN_AID_ST_EXCPT
       , TUITION_EXCPT
       , CITY
       , COUNTY
       , STATE
       , COUNTRY
       , POSTAL

FROM (--IMPLICIT POPULATION FILTER 
       SELECT EMPLID 
              , MAX(a.STRM) AS STRM 
        FROM PS_STDNT_CAR_TERM a 
	    JOIN PS_TERM_TBL b 
		  ON b.STRM = a.STRM 
			 AND a.ACAD_CAREER = b.ACAD_CAREER
			 AND a.INSTITUTION = b.INSTITUTION
        WHERE 1=1
		   AND a.INSTITUTION = ''
        GROUP BY EMPLID 
        ----HISTORICAL FILTER 
        --HAVING Max(a.STRM) >= '2008'                        --Update to Fall 2003 term
        ----ROLLING FILTER, MODIFY -### for TIME WINDOW 
        HAVING MAX(b.TERM_END_DT) >= SYSDATE-365 
       ) population 	

JOIN PS_RESIDENCY_OFF b
  ON b.EMPLID = population.EMPLID

WHERE 1=1
   AND b.INSTITUTION = ''

ORDER BY b.EMPLID, EFFECTIVE_TERM
