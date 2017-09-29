* Encoding: UTF-8.
GET FILE='C:\Trees\Отток_Новый.sav'.
 
/* Node 9 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (SYSMIS(total_day_minutes) OR (VALUE(total_day_minutes) LE 208.8))  AND  (SYSMIS(international_plan) OR VALUE(international_plan) NE 1). 
COMPUTE nod_001 = 9. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 0.975928. 
END IF. 
 
/* Node 10 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (SYSMIS(total_day_minutes) OR (VALUE(total_day_minutes) LE 208.8))  AND  (VALUE(international_plan) EQ 1). 
COMPUTE nod_001 = 10. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 0.654412. 
END IF. 
 
/* Node 4 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (VALUE(total_day_minutes) GT 208.8  AND  VALUE(total_day_minutes) LE 225.3). 
COMPUTE nod_001 = 4. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 0.913043. 
END IF. 
 
/* Node 11 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (VALUE(total_day_minutes) GT 225.3  AND  VALUE(total_day_minutes) LE 249.5)  AND  (SYSMIS(voice_mail_plan) OR VALUE(voice_mail_plan) NE 1). 
COMPUTE nod_001 = 11. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 0.822086. 
END IF. 
 
/* Node 12 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (VALUE(total_day_minutes) GT 225.3  AND  VALUE(total_day_minutes) LE 249.5)  AND  (VALUE(voice_mail_plan) EQ 1). 
COMPUTE nod_001 = 12. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 
  0.936508. 
END IF. 
 
/* Node 13 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (VALUE(total_day_minutes) GT 249.5)  AND  (SYSMIS(voice_mail_plan) OR VALUE(voice_mail_plan) NE 1). 
COMPUTE nod_001 = 13. 
COMPUTE pre_001 = 1. 
COMPUTE prb_001 = 0.601156. 
END IF. 
 
/* Node 14 */. 
DO IF (SYSMIS(number_cs_calls) OR (VALUE(number_cs_calls) LE 3))  AND  (VALUE(total_day_minutes) GT 249.5)  AND  (VALUE(voice_mail_plan) EQ 1). 
COMPUTE nod_001 = 14. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 0.928571. 
END IF. 
 
/* Node 7 */. 
DO IF (VALUE(number_cs_calls) GT 3)  AND  (VALUE(total_day_minutes) LE 166.7). 
COMPUTE nod_001 = 7. 
COMPUTE pre_001 = 1. 
COMPUTE prb_001 = 0.850575. 
END IF. 
 
/* Node 8 */. 
DO IF (VALUE(number_cs_calls) GT 3)  AND  (SYSMIS(total_day_minutes) OR (VALUE(total_day_minutes) GT 166.7)). 
COMPUTE nod_001 = 8. 
COMPUTE pre_001 = 0. 
COMPUTE prb_001 = 0.736842. 
END IF. 
EXECUTE.
