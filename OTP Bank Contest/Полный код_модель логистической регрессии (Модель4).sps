﻿* Encoding: UTF-8.
* Открываем обучающий набор данных.
GET 
  FILE='C:\Trees\Конкурс ОТП Банк\Обучающий набор.sav'. 
DATASET NAME Наборданных1 WINDOW=FRONT.

* Выполняем перегруппировку категориальных переменных.
/* Node 1 */.
DO IF (SYSMIS(EDUCATION) OR (VALUE(EDUCATION) LE 3)).
COMPUTE EDUCATIONchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(EDUCATION) GT 3  AND  VALUE(EDUCATION) LE 4).
COMPUTE EDUCATIONchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(EDUCATION) GT 4).
COMPUTE EDUCATIONchaid = 3.
END IF.

/* Node 1 */.
DO IF (SYSMIS(GEN_INDUSTRY) OR VALUE(GEN_INDUSTRY) NE 18  AND  VALUE(GEN_INDUSTRY) NE 4  AND  VALUE(GEN_INDUSTRY) NE 1  AND  VALUE(GEN_INDUSTRY) NE 17  AND  VALUE(GEN_INDUSTRY) NE 25  AND  VALUE(GEN_INDUSTRY) NE 26  AND  VALUE(GEN_INDUSTRY) NE 2  AND
  VALUE(GEN_INDUSTRY) NE 30  AND  VALUE(GEN_INDUSTRY) NE 14  AND  VALUE(GEN_INDUSTRY) NE 12  AND  VALUE(GEN_INDUSTRY) NE 8  AND  VALUE(GEN_INDUSTRY) NE 31  AND  VALUE(GEN_INDUSTRY) NE 16  AND  VALUE(GEN_INDUSTRY) NE 23  AND  VALUE(GEN_INDUSTRY) NE 32
  AND  VALUE(GEN_INDUSTRY) NE 29  AND  VALUE(GEN_INDUSTRY) NE 20  AND  VALUE(GEN_INDUSTRY) NE 7  AND  VALUE(GEN_INDUSTRY) NE 6  AND  VALUE(GEN_INDUSTRY) NE 13  AND  VALUE(GEN_INDUSTRY) NE 28  AND  VALUE(GEN_INDUSTRY) NE 10).
COMPUTE GEN_INDUSTRYchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 18 OR VALUE(GEN_INDUSTRY) EQ 17 OR VALUE(GEN_INDUSTRY) EQ 25 OR VALUE(GEN_INDUSTRY) EQ 26 OR VALUE(GEN_INDUSTRY) EQ 30 OR VALUE(GEN_INDUSTRY) EQ 20 OR VALUE(GEN_INDUSTRY) EQ 13 OR VALUE(GEN_INDUSTRY) EQ 28).
COMPUTE GEN_INDUSTRYchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 4 OR VALUE(GEN_INDUSTRY) EQ 2 OR VALUE(GEN_INDUSTRY) EQ 14 OR VALUE(GEN_INDUSTRY) EQ 8 OR VALUE(GEN_INDUSTRY) EQ 29 OR VALUE(GEN_INDUSTRY) EQ 7 OR VALUE(GEN_INDUSTRY) EQ 6).
COMPUTE GEN_INDUSTRYchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 1 OR VALUE(GEN_INDUSTRY) EQ 16 OR VALUE(GEN_INDUSTRY) EQ 23 OR VALUE(GEN_INDUSTRY) EQ 32 OR VALUE(GEN_INDUSTRY) EQ 10).
COMPUTE GEN_INDUSTRYchaid = 4.
END IF.

/* Node 5 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 12 OR VALUE(GEN_INDUSTRY) EQ 31).
COMPUTE GEN_INDUSTRYchaid = 5.
END IF.

/* Node 1 */.
DO IF (VALUE(GEN_TITLE) EQ 8 OR VALUE(GEN_TITLE) EQ 12 OR VALUE(GEN_TITLE) EQ 7 OR VALUE(GEN_TITLE) EQ 3).
COMPUTE GEN_TITLEchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(GEN_TITLE) OR VALUE(GEN_TITLE) NE 8  AND  VALUE(GEN_TITLE) NE 12  AND  VALUE(GEN_TITLE) NE 1  AND  VALUE(GEN_TITLE) NE 2  AND  VALUE(GEN_TITLE) NE 5  AND  VALUE(GEN_TITLE) NE 7  AND  VALUE(GEN_TITLE) NE 3  AND  VALUE(GEN_TITLE) NE 9  AND
  VALUE(GEN_TITLE) NE 10  AND  VALUE(GEN_TITLE) NE 6).
COMPUTE GEN_TITLEchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(GEN_TITLE) EQ 1).
COMPUTE GEN_TITLEchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(GEN_TITLE) EQ 2 OR VALUE(GEN_TITLE) EQ 5 OR VALUE(GEN_TITLE) EQ 9 OR VALUE(GEN_TITLE) EQ 10 OR VALUE(GEN_TITLE) EQ 6).
COMPUTE GEN_TITLEchaid = 4.
END IF.

/* Node 1 */.
DO IF (SYSMIS(JOB_DIR) OR VALUE(JOB_DIR) NE 9  AND  VALUE(JOB_DIR) NE 1  AND  VALUE(JOB_DIR) NE 11  AND  VALUE(JOB_DIR) NE 7).
COMPUTE JOB_DIRchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(JOB_DIR) EQ 9 OR VALUE(JOB_DIR) EQ 11 OR VALUE(JOB_DIR) EQ 7).
COMPUTE JOB_DIRchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(JOB_DIR) EQ 1).
COMPUTE JOB_DIRchaid = 3.
END IF.

/* Node 1 */.
DO IF (VALUE(FAMILY_INCOME) LE 2).
COMPUTE FAMILY_INCOMEchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(FAMILY_INCOME) OR (VALUE(FAMILY_INCOME) GT 2  AND  VALUE(FAMILY_INCOME) LE 3)).
COMPUTE FAMILY_INCOMEchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(FAMILY_INCOME) GT 3  AND  VALUE(FAMILY_INCOME) LE 4).
COMPUTE FAMILY_INCOMEchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(FAMILY_INCOME) GT 4).
COMPUTE FAMILY_INCOMEchaid = 4.
END IF.

/* Node 1 */.
DO IF (VALUE(REGION_NM) EQ 3 OR VALUE(REGION_NM) EQ 4 OR VALUE(REGION_NM) EQ 7 OR VALUE(REGION_NM) EQ 2 OR VALUE(REGION_NM) EQ 8).
COMPUTE REGION_NMchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(REGION_NM) OR VALUE(REGION_NM) NE 3  AND  VALUE(REGION_NM) NE 11  AND  VALUE(REGION_NM) NE 4  AND  VALUE(REGION_NM) NE 7  AND  VALUE(REGION_NM) NE 6  AND  VALUE(REGION_NM) NE 2  AND  VALUE(REGION_NM) NE 8).
COMPUTE REGION_NMchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(REGION_NM) EQ 11).
COMPUTE REGION_NMchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(REGION_NM) EQ 6).
COMPUTE REGION_NMchaid = 4.
END IF.

/* Node 1 */.
DO IF (VALUE(MARITAL_STATUS) EQ 3).
COMPUTE MARITAL_STATUSchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(MARITAL_STATUS) OR VALUE(MARITAL_STATUS) NE 3  AND  VALUE(MARITAL_STATUS) NE 4  AND  VALUE(MARITAL_STATUS) NE 2).
COMPUTE MARITAL_STATUSchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(MARITAL_STATUS) EQ 4 OR VALUE(MARITAL_STATUS) EQ 2).
COMPUTE MARITAL_STATUSchaid = 3.
END IF.

/* Node 1 */.
DO IF (VALUE(ORG_TP_STATE) EQ 2).
COMPUTE ORG_TP_STATEchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(ORG_TP_STATE) EQ 3 OR VALUE(ORG_TP_STATE) EQ 5).
COMPUTE ORG_TP_STATEchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(ORG_TP_STATE) EQ 1).
COMPUTE ORG_TP_STATEchaid = 3.
END IF.

/* Node 4 */.
DO IF (SYSMIS(ORG_TP_STATE) OR VALUE(ORG_TP_STATE) NE 2  AND  VALUE(ORG_TP_STATE) NE 3  AND  VALUE(ORG_TP_STATE) NE 1  AND  VALUE(ORG_TP_STATE) NE 5).
COMPUTE ORG_TP_STATEchaid = 4.
END IF.

COMPUTE CHILD_TOTALroot = CHILD_TOTAL**(1/3).
COMPUTE PERSONAL_INCOMEroot = PERSONAL_INCOME**(1/3).
COMPUTE TERMroot = TERM**(1/3).
COMPUTE FST_PAYMENTroot = FST_PAYMENT**(1/3).
COMPUTE FACT_LIVING_TERMroot = FACT_LIVING_TERM**(1/3).
COMPUTE WORK_TIMEroot = WORK_TIME**(1/3).
COMPUTE LOAN_NUM_TOTALroot = LOAN_NUM_TOTAL**(1/3).
COMPUTE LOAN_NUM_CLOSEDroot = LOAN_NUM_CLOSED**(1/3).
COMPUTE LOAN_NUM_PAYMroot = LOAN_NUM_PAYM**(1/3).
COMPUTE LOAN_DLQ_NUMroot = LOAN_DLQ_NUM**(1/3).

* Задаем уровень измерения переменных.
VARIABLE LEVEL 
EDUCATIONchaid (NOMINAL)
GEN_INDUSTRYchaid (NOMINAL)
GEN_TITLEchaid (NOMINAL)
JOB_DIRchaid (NOMINAL)
FAMILY_INCOMEchaid (NOMINAL)
REGION_NMchaid (NOMINAL)
MARITAL_STATUSchaid (NOMINAL)
ORG_TP_STATEchaid (NOMINAL).

* Задаем метки переменных.
VARIABLE LABELS 
EDUCATIONchaid ‘Образование (CHAID 3, 500, 250)’
GEN_INDUSTRYchaid ‘Отрасль работы клиента (CHAID 3, 500, 250)’
GEN_TITLEchaid ‘Должность (CHAID 3, 500, 250)’
JOB_DIRchaid ‘Направление деятельности внутри компании (CHAID 3, 500, 250)’
FAMILY_INCOMEchaid ‘Семейный доход (CHAID 3, 500, 250)’
REGION_NMchaid ‘Регион РФ (CHAID 3, 500, 250)’
MARITAL_STATUSchaid ‘Семейное положение (CHAID 3, 500, 250)’
ORG_TP_STATEchaid ‘Форма собственности компании (CHAID 3, 500, 250)’.

* Задаем метки значений переменных.
VALUE LABELS  
EDUCATIONchaid
1 'неполн среднее, среднее, среднее спец' 
2 'неоконч высшее'
3 'высшее или несколько высших'.

VALUE LABELS  
GEN_INDUSTRYchaid
1 'обр-ние, металлургия, госслужба, здравоохр, строит-во,с/х,СМИ, тур' 
2 'рестораны/питан, развлеч, торг, трансп-т, недвиж-ть, упр. компания'
3 'банки, финансы, нефтегаз пром-ть, комм. хоз-во, химия/фарм, IT'
4 'HR, страхован, юр. услуги, маркетинг, пропуск'
5 'наука, энергетика'.

VALUE LABELS  
GEN_TITLEchaid
1 'рабочий, служащий, работник сферы услуг, высоквалиф. спец-т' 
2 'специалист, рук-ль средн. звена, другое'
3 'пропуск'
4 'военнослуж, ИП, рук-ль высш. звена, рук-ль низш. звена, партнер'.

VALUE LABELS  
JOB_DIRchaid
1 'участие в осн. деят-ти, СБ, бух, финансы, кадры, секрет, тех перс' 
2 'снабжен и сбыт, юр. служба, реклама и маркетинг'
3 'пропуск'.

VALUE LABELS  
FAMILY_INCOMEchaid
1 'до 10000 рублей' 
2 'от 10000 до 20000 рублей'
3 'от 20000 до 50000 рублей'
4 'свыше 50000 рублей'.

VALUE LABELS  
REGION_NMchaid
1 'Дальневост, Зап-Сиб, Сев-Зап, Вост-Сиб, Урал' 
2 'Поволжский, Центральный 2, Центральный 1, Южный'
3 'Центральный'
4 'Приволжский'.

VALUE LABELS  
MARITAL_STATUSchaid
1 'не состоял в браке' 
2 'состою в браке, вдовец/вдова'
3 'разведен, гражданский брак'.

VALUE LABELS  
ORG_TP_STATEchaid
1 'гос. комп./учреж.' 
2 'ИП, частн. компания с иностр. капиталом'
3 'пропуск'
4 'частн. компания, некомм. орг-ция'.
EXECUTE.

* Строю модели логистической регрессии.
LOGISTIC REGRESSION VARIABLES TARGET
  /METHOD=ENTER 
AGE CHILD_TOTALroot EDUCATIONchaid MARITAL_STATUSchaid GEN_INDUSTRYchaid 
GEN_TITLEchaid ORG_TP_STATEchaid JOB_DIRchaid FAMILY_INCOMEchaid PERSONAL_INCOMEroot REGION_NMchaid CREDIT TERMroot FST_PAYMENTroot GPF_DOCUMENT_FL FACT_LIVING_TERMroot WORK_TIMEroot FACT_PHONE_FL LOAN_NUM_TOTALroot 
LOAN_NUM_CLOSEDroot LOAN_NUM_PAYMroot LOAN_DLQ_NUMroot LOAN_MAX_DLQ_AMT
  /CONTRAST (EDUCATIONchaid)=Indicator
  /CONTRAST (MARITAL_STATUSchaid)=Indicator
  /CONTRAST (GEN_INDUSTRYchaid)=Indicator
  /CONTRAST (GEN_TITLEchaid)=Indicator
  /CONTRAST (ORG_TP_STATEchaid)=Indicator
  /CONTRAST (JOB_DIRchaid)=Indicator
  /CONTRAST (FAMILY_INCOMEchaid)=Indicator
  /CONTRAST (REGION_NMchaid)=Indicator
  /CONTRAST (GPF_DOCUMENT_FL)=Indicator
  /CONTRAST (FACT_PHONE_FL)=Indicator
  /SAVE=PRED
  /OUTFILE= MODEL ('C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (CHAID и преобразование корня третьей степени).xml'). 

VARIABLE LABELS 
PRE_1 ‘Модель логистической регрессии (CHAID и преобразование корнем третьей степени)’.

* Строим ROC-кривую модели логистической регрессии для обучающего набора.
ROC PRE_1 BY TARGET (1)
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.

*Открываем тестовый набор.
GET 
  FILE='C:\Trees\Конкурс ОТП Банк\Тестовый набор.sav'. 
DATASET NAME Наборданных2 WINDOW=FRONT.

* Выполняем перегруппировку категориальных переменных.
/* Node 1 */.
DO IF (SYSMIS(EDUCATION) OR (VALUE(EDUCATION) LE 3)).
COMPUTE EDUCATIONchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(EDUCATION) GT 3  AND  VALUE(EDUCATION) LE 4).
COMPUTE EDUCATIONchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(EDUCATION) GT 4).
COMPUTE EDUCATIONchaid = 3.
END IF.

/* Node 1 */.
DO IF (SYSMIS(GEN_INDUSTRY) OR VALUE(GEN_INDUSTRY) NE 18  AND  VALUE(GEN_INDUSTRY) NE 4  AND  VALUE(GEN_INDUSTRY) NE 1  AND  VALUE(GEN_INDUSTRY) NE 17  AND  VALUE(GEN_INDUSTRY) NE 25  AND  VALUE(GEN_INDUSTRY) NE 26  AND  VALUE(GEN_INDUSTRY) NE 2  AND
  VALUE(GEN_INDUSTRY) NE 30  AND  VALUE(GEN_INDUSTRY) NE 14  AND  VALUE(GEN_INDUSTRY) NE 12  AND  VALUE(GEN_INDUSTRY) NE 8  AND  VALUE(GEN_INDUSTRY) NE 31  AND  VALUE(GEN_INDUSTRY) NE 16  AND  VALUE(GEN_INDUSTRY) NE 23  AND  VALUE(GEN_INDUSTRY) NE 32
  AND  VALUE(GEN_INDUSTRY) NE 29  AND  VALUE(GEN_INDUSTRY) NE 20  AND  VALUE(GEN_INDUSTRY) NE 7  AND  VALUE(GEN_INDUSTRY) NE 6  AND  VALUE(GEN_INDUSTRY) NE 13  AND  VALUE(GEN_INDUSTRY) NE 28  AND  VALUE(GEN_INDUSTRY) NE 10).
COMPUTE GEN_INDUSTRYchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 18 OR VALUE(GEN_INDUSTRY) EQ 17 OR VALUE(GEN_INDUSTRY) EQ 25 OR VALUE(GEN_INDUSTRY) EQ 26 OR VALUE(GEN_INDUSTRY) EQ 30 OR VALUE(GEN_INDUSTRY) EQ 20 OR VALUE(GEN_INDUSTRY) EQ 13 OR VALUE(GEN_INDUSTRY) EQ 28).
COMPUTE GEN_INDUSTRYchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 4 OR VALUE(GEN_INDUSTRY) EQ 2 OR VALUE(GEN_INDUSTRY) EQ 14 OR VALUE(GEN_INDUSTRY) EQ 8 OR VALUE(GEN_INDUSTRY) EQ 29 OR VALUE(GEN_INDUSTRY) EQ 7 OR VALUE(GEN_INDUSTRY) EQ 6).
COMPUTE GEN_INDUSTRYchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 1 OR VALUE(GEN_INDUSTRY) EQ 16 OR VALUE(GEN_INDUSTRY) EQ 23 OR VALUE(GEN_INDUSTRY) EQ 32 OR VALUE(GEN_INDUSTRY) EQ 10).
COMPUTE GEN_INDUSTRYchaid = 4.
END IF.

/* Node 5 */.
DO IF (VALUE(GEN_INDUSTRY) EQ 12 OR VALUE(GEN_INDUSTRY) EQ 31).
COMPUTE GEN_INDUSTRYchaid = 5.
END IF.

/* Node 1 */.
DO IF (VALUE(GEN_TITLE) EQ 8 OR VALUE(GEN_TITLE) EQ 12 OR VALUE(GEN_TITLE) EQ 7 OR VALUE(GEN_TITLE) EQ 3).
COMPUTE GEN_TITLEchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(GEN_TITLE) OR VALUE(GEN_TITLE) NE 8  AND  VALUE(GEN_TITLE) NE 12  AND  VALUE(GEN_TITLE) NE 1  AND  VALUE(GEN_TITLE) NE 2  AND  VALUE(GEN_TITLE) NE 5  AND  VALUE(GEN_TITLE) NE 7  AND  VALUE(GEN_TITLE) NE 3  AND  VALUE(GEN_TITLE) NE 9  AND
  VALUE(GEN_TITLE) NE 10  AND  VALUE(GEN_TITLE) NE 6).
COMPUTE GEN_TITLEchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(GEN_TITLE) EQ 1).
COMPUTE GEN_TITLEchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(GEN_TITLE) EQ 2 OR VALUE(GEN_TITLE) EQ 5 OR VALUE(GEN_TITLE) EQ 9 OR VALUE(GEN_TITLE) EQ 10 OR VALUE(GEN_TITLE) EQ 6).
COMPUTE GEN_TITLEchaid = 4.
END IF.

/* Node 1 */.
DO IF (SYSMIS(JOB_DIR) OR VALUE(JOB_DIR) NE 9  AND  VALUE(JOB_DIR) NE 1  AND  VALUE(JOB_DIR) NE 11  AND  VALUE(JOB_DIR) NE 7).
COMPUTE JOB_DIRchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(JOB_DIR) EQ 9 OR VALUE(JOB_DIR) EQ 11 OR VALUE(JOB_DIR) EQ 7).
COMPUTE JOB_DIRchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(JOB_DIR) EQ 1).
COMPUTE JOB_DIRchaid = 3.
END IF.

/* Node 1 */.
DO IF (VALUE(FAMILY_INCOME) LE 2).
COMPUTE FAMILY_INCOMEchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(FAMILY_INCOME) OR (VALUE(FAMILY_INCOME) GT 2  AND  VALUE(FAMILY_INCOME) LE 3)).
COMPUTE FAMILY_INCOMEchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(FAMILY_INCOME) GT 3  AND  VALUE(FAMILY_INCOME) LE 4).
COMPUTE FAMILY_INCOMEchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(FAMILY_INCOME) GT 4).
COMPUTE FAMILY_INCOMEchaid = 4.
END IF.

/* Node 1 */.
DO IF (VALUE(REGION_NM) EQ 3 OR VALUE(REGION_NM) EQ 4 OR VALUE(REGION_NM) EQ 7 OR VALUE(REGION_NM) EQ 2 OR VALUE(REGION_NM) EQ 8).
COMPUTE REGION_NMchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(REGION_NM) OR VALUE(REGION_NM) NE 3  AND  VALUE(REGION_NM) NE 11  AND  VALUE(REGION_NM) NE 4  AND  VALUE(REGION_NM) NE 7  AND  VALUE(REGION_NM) NE 6  AND  VALUE(REGION_NM) NE 2  AND  VALUE(REGION_NM) NE 8).
COMPUTE REGION_NMchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(REGION_NM) EQ 11).
COMPUTE REGION_NMchaid = 3.
END IF.

/* Node 4 */.
DO IF (VALUE(REGION_NM) EQ 6).
COMPUTE REGION_NMchaid = 4.
END IF.

/* Node 1 */.
DO IF (VALUE(MARITAL_STATUS) EQ 3).
COMPUTE MARITAL_STATUSchaid = 1.
END IF.

/* Node 2 */.
DO IF (SYSMIS(MARITAL_STATUS) OR VALUE(MARITAL_STATUS) NE 3  AND  VALUE(MARITAL_STATUS) NE 4  AND  VALUE(MARITAL_STATUS) NE 2).
COMPUTE MARITAL_STATUSchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(MARITAL_STATUS) EQ 4 OR VALUE(MARITAL_STATUS) EQ 2).
COMPUTE MARITAL_STATUSchaid = 3.
END IF.

/* Node 1 */.
DO IF (VALUE(ORG_TP_STATE) EQ 2).
COMPUTE ORG_TP_STATEchaid = 1.
END IF.

/* Node 2 */.
DO IF (VALUE(ORG_TP_STATE) EQ 3 OR VALUE(ORG_TP_STATE) EQ 5).
COMPUTE ORG_TP_STATEchaid = 2.
END IF.

/* Node 3 */.
DO IF (VALUE(ORG_TP_STATE) EQ 1).
COMPUTE ORG_TP_STATEchaid = 3.
END IF.

/* Node 4 */.
DO IF (SYSMIS(ORG_TP_STATE) OR VALUE(ORG_TP_STATE) NE 2  AND  VALUE(ORG_TP_STATE) NE 3  AND  VALUE(ORG_TP_STATE) NE 1  AND  VALUE(ORG_TP_STATE) NE 5).
COMPUTE ORG_TP_STATEchaid = 4.
END IF.

COMPUTE CHILD_TOTALroot = CHILD_TOTAL**(1/3).
COMPUTE PERSONAL_INCOMEroot = PERSONAL_INCOME**(1/3).
COMPUTE TERMroot = TERM**(1/3).
COMPUTE FST_PAYMENTroot = FST_PAYMENT**(1/3).
COMPUTE FACT_LIVING_TERMroot = FACT_LIVING_TERM**(1/3).
COMPUTE WORK_TIMEroot = WORK_TIME**(1/3).
COMPUTE LOAN_NUM_TOTALroot = LOAN_NUM_TOTAL**(1/3).
COMPUTE LOAN_NUM_CLOSEDroot = LOAN_NUM_CLOSED**(1/3).
COMPUTE LOAN_NUM_PAYMroot = LOAN_NUM_PAYM**(1/3).
COMPUTE LOAN_DLQ_NUMroot = LOAN_DLQ_NUM**(1/3).

* Задаем уровень измерения переменных.
VARIABLE LEVEL 
EDUCATIONchaid (NOMINAL)
GEN_INDUSTRYchaid (NOMINAL)
GEN_TITLEchaid (NOMINAL)
JOB_DIRchaid (NOMINAL)
FAMILY_INCOMEchaid (NOMINAL)
REGION_NMchaid (NOMINAL)
MARITAL_STATUSchaid (NOMINAL)
ORG_TP_STATEchaid (NOMINAL).

* Задаем метки переменных.
VARIABLE LABELS 
EDUCATIONchaid ‘Образование (CHAID 3, 500, 250)’
GEN_INDUSTRYchaid ‘Отрасль работы клиента (CHAID 3, 500, 250)’
GEN_TITLEchaid ‘Должность (CHAID 3, 500, 250)’
JOB_DIRchaid ‘Направление деятельности внутри компании (CHAID 3, 500, 250)’
FAMILY_INCOMEchaid ‘Семейный доход (CHAID 3, 500, 250)’
REGION_NMchaid ‘Регион РФ (CHAID 3, 500, 250)’
MARITAL_STATUSchaid ‘Семейное положение (CHAID 3, 500, 250)’
ORG_TP_STATEchaid ‘Форма собственности компании (CHAID 3, 500, 250)’.

* Задаем метки значений переменных.
VALUE LABELS  
EDUCATIONchaid
1 'неполн среднее, среднее, среднее спец' 
2 'неоконч высшее'
3 'высшее или несколько высших'.

VALUE LABELS  
GEN_INDUSTRYchaid
1 'обр-ние, металлургия, госслужба, здравоохр, строит-во,с/х,СМИ, тур' 
2 'рестораны/питан, развлеч, торг, трансп-т, недвиж-ть, упр. компания'
3 'банки, финансы, нефтегаз пром-ть, комм. хоз-во, химия/фарм, IT'
4 'HR, страхован, юр. услуги, маркетинг, пропуск'
5 'наука, энергетика'.

VALUE LABELS  
GEN_TITLEchaid
1 'рабочий, служащий, работник сферы услуг, высоквалиф. спец-т' 
2 'специалист, рук-ль средн. звена, другое'
3 'пропуск'
4 'военнослуж, ИП, рук-ль высш. звена, рук-ль низш. звена, партнер'.

VALUE LABELS  
JOB_DIRchaid
1 'участие в осн. деят-ти, СБ, бух, финансы, кадры, секрет, тех перс' 
2 'снабжен и сбыт, юр. служба, реклама и маркетинг'
3 'пропуск'.

VALUE LABELS  
FAMILY_INCOMEchaid
1 'до 10000 рублей' 
2 'от 10000 до 20000 рублей'
3 'от 20000 до 50000 рублей'
4 'свыше 50000 рублей'.

VALUE LABELS  
REGION_NMchaid
1 'Дальневост, Зап-Сиб, Сев-Зап, Вост-Сиб, Урал' 
2 'Поволжский, Центральный 2, Центральный 1, Южный'
3 'Центральный'
4 'Приволжский'.

VALUE LABELS  
MARITAL_STATUSchaid
1 'не состоял в браке' 
2 'состою в браке, вдовец/вдова'
3 'разведен, гражданский брак'.

VALUE LABELS  
ORG_TP_STATEchaid
1 'гос. комп./учреж.' 
2 'ИП, частн. компания с иностр. капиталом'
3 'пропуск'
4 'частн. компания, некомм. орг-ция'.

EXECUTE.

* Применяем модели логистической регрессии, построенные на обучающем наборе, к тестовому набору.
MODEL HANDLE NAME=VAR00001_model FILE='C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (CHAID и преобразование корня третьей степени).xml'
  /OPTIONS MISSING=SUBSTITUTE.
COMPUTE SelectedProbability=APPLYMODEL(VAR00001_model, 'PROBABILITY', 1).
EXECUTE.
MODEL CLOSE NAME=VAR00001_model.

VARIABLE LABELS 
SelectedProbability ‘Модель логистической регрессии (CHAID и преобразование корнем третьей степени)’.

* Строим ROC-кривую модели логистической регрессии для тестового набора.
ROC SelectedProbability BY TARGET (1)
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.