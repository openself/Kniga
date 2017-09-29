* Encoding: UTF-8.
* Открываем обучающий набор данных.
GET 
  FILE='C:\Trees\Конкурс ОТП Банк\Обучающий набор.sav'. 
DATASET NAME Наборданных1 WINDOW=FRONT.

* Правила ОПТИМАЛЬНОЙ КАТЕГОРИЗАЦИИ.

RECODE AGE
  (MISSING = SYSMIS)
  (58 THRU HI = 3)
  (43 THRU 58 = 2)
  (LOW THRU 43 = 1)
  INTO AGE_категория.
VARIABLE LABELS
  AGE_категория 'Категориальная входная переменная AGE, основанная на направляющей переменной TARGET'.
FORMATS
  AGE_категория (F8.0).
VARIABLE LEVEL
  AGE_категория (NOMINAL).
VALUE LABELS AGE_категория
  1 'AGE < 43'
  2 '43 <= AGE < 58'
  3 '58 <= AGE'.

RECODE SOCSTATUS_WORK_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO SOCSTATUS_WORK_FL_категория.
VARIABLE LABELS
  SOCSTATUS_WORK_FL_категория 'Категориальная входная переменная SOCSTATUS_WORK_FL, основанная на направляющей переменной TARGET'.
FORMATS
  SOCSTATUS_WORK_FL_категория (F8.0).
VARIABLE LEVEL
  SOCSTATUS_WORK_FL_категория (NOMINAL).
VALUE LABELS SOCSTATUS_WORK_FL_категория
  1 'SOCSTATUS_WORK_FL < 1'
  2 '1 <= SOCSTATUS_WORK_FL'.

RECODE SOCSTATUS_PENS_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO SOCSTATUS_PENS_FL_категория.
VARIABLE LABELS
  SOCSTATUS_PENS_FL_категория 'Категориальная входная переменная SOCSTATUS_PENS_FL, основанная на направляющей переменной TARGET'.
FORMATS
  SOCSTATUS_PENS_FL_категория (F8.0).
VARIABLE LEVEL
  SOCSTATUS_PENS_FL_категория (NOMINAL).
VALUE LABELS SOCSTATUS_PENS_FL_категория
  1 'SOCSTATUS_PENS_FL < 1'
  2 '1 <= SOCSTATUS_PENS_FL'.

RECODE GEN_INDUSTRY
  (MISSING = SYSMIS)
  (25 THRU HI = 3)
  (2 THRU 25 = 2)
  (LOW THRU 2 = 1)
  INTO GEN_INDUSTRY_категория.
VARIABLE LABELS
  GEN_INDUSTRY_категория 'Категориальная входная переменная GEN_INDUSTRY, основанная на направляющей переменной TARGET'.
FORMATS
  GEN_INDUSTRY_категория (F8.0).
VARIABLE LEVEL
  GEN_INDUSTRY_категория (NOMINAL).
VALUE LABELS GEN_INDUSTRY_категория
  1 'GEN_INDUSTRY < 2'
  2 '2 <= GEN_INDUSTRY < 25'
  3 '25 <= GEN_INDUSTRY'.

RECODE GEN_TITLE
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO GEN_TITLE_категория.
VARIABLE LABELS
  GEN_TITLE_категория 'Категориальная входная переменная GEN_TITLE, основанная на направляющей переменной TARGET'.
FORMATS
  GEN_TITLE_категория (F8.0).
VARIABLE LEVEL
  GEN_TITLE_категория (NOMINAL).
VALUE LABELS GEN_TITLE_категория
  1 'GEN_TITLE < 2'
  2 '2 <= GEN_TITLE'.

RECODE ORG_TP_STATE
  (MISSING = SYSMIS)
  (3 THRU HI = 3)
  (2 THRU 3 = 2)
  (LOW THRU 2 = 1)
  INTO ORG_TP_STATE_категория.
VARIABLE LABELS
  ORG_TP_STATE_категория 'Категориальная входная переменная ORG_TP_STATE, основанная на направляющей переменной TARGET'.
FORMATS
  ORG_TP_STATE_категория (F8.0).
VARIABLE LEVEL
  ORG_TP_STATE_категория (NOMINAL).
VALUE LABELS ORG_TP_STATE_категория
  1 'ORG_TP_STATE < 2'
  2 '2 <= ORG_TP_STATE < 3'
  3 '3 <= ORG_TP_STATE'.

RECODE ORG_TP_FCAPITAL
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO ORG_TP_FCAPITAL_категория.
VARIABLE LABELS
  ORG_TP_FCAPITAL_категория 'Категориальная входная переменная ORG_TP_FCAPITAL, основанная на направляющей переменной TARGET'.
FORMATS
  ORG_TP_FCAPITAL_категория (F8.0).
VARIABLE LEVEL
  ORG_TP_FCAPITAL_категория (NOMINAL).
VALUE LABELS ORG_TP_FCAPITAL_категория
  1 'ORG_TP_FCAPITAL < 2'
  2 '2 <= ORG_TP_FCAPITAL'.

RECODE JOB_DIR
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO JOB_DIR_категория.
VARIABLE LABELS
  JOB_DIR_категория 'Категориальная входная переменная JOB_DIR, основанная на направляющей переменной TARGET'.
FORMATS
  JOB_DIR_категория (F8.0).
VARIABLE LEVEL
  JOB_DIR_категория (NOMINAL).
VALUE LABELS JOB_DIR_категория
  1 'JOB_DIR < 2'
  2 '2 <= JOB_DIR'.

RECODE FAMILY_INCOME
  (MISSING = SYSMIS)
  (5 THRU HI = 2)
  (LOW THRU 5 = 1)
  INTO FAMILY_INCOME_категория.
VARIABLE LABELS
  FAMILY_INCOME_категория 'Категориальная входная переменная FAMILY_INCOME, основанная на направляющей переменной TARGET'.
FORMATS
  FAMILY_INCOME_категория (F8.0).
VARIABLE LEVEL
  FAMILY_INCOME_категория (NOMINAL).
VALUE LABELS FAMILY_INCOME_категория
  1 'FAMILY_INCOME < 5'
  2 '5 <= FAMILY_INCOME'.

RECODE PERSONAL_INCOME
  (MISSING = SYSMIS)
  (26500 THRU HI = 3)
  (14800 THRU 26500 = 2)
  (LOW THRU 14800 = 1)
  INTO PERSONAL_INCOME_категория.
VARIABLE LABELS
  PERSONAL_INCOME_категория 'Категориальная входная переменная PERSONAL_INCOME, основанная на направляющей переменной TARGET'.
FORMATS
  PERSONAL_INCOME_категория (F8.0).
VARIABLE LEVEL
  PERSONAL_INCOME_категория (NOMINAL).
VALUE LABELS PERSONAL_INCOME_категория
  1 'PERSONAL_INCOME < 14800'
  2 '14800 <= PERSONAL_INCOME < 26500'
  3 '26500 <= PERSONAL_INCOME'.

RECODE TP_PROVINCE
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO TP_PROVINCE_категория.
VARIABLE LABELS
  TP_PROVINCE_категория 'Категориальная входная переменная TP_PROVINCE, основанная на направляющей переменной TARGET'.
FORMATS
  TP_PROVINCE_категория (F8.0).
VARIABLE LEVEL
  TP_PROVINCE_категория (NOMINAL).
VALUE LABELS TP_PROVINCE_категория
  1 'TP_PROVINCE < 2'
  2 '2 <= TP_PROVINCE'.

RECODE REG_POST_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO REG_POST_FL_категория.
VARIABLE LABELS
  REG_POST_FL_категория 'Категориальная входная переменная REG_POST_FL, основанная на направляющей переменной TARGET'.
FORMATS
  REG_POST_FL_категория (F8.0).
VARIABLE LEVEL
  REG_POST_FL_категория (NOMINAL).
VALUE LABELS REG_POST_FL_категория
  1 'REG_POST_FL < 1'
  2 '1 <= REG_POST_FL'.

RECODE REG_FACT_POST_TP_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO REG_FACT_POST_TP_FL_категория.
VARIABLE LABELS
  REG_FACT_POST_TP_FL_категория 'Категориальная входная переменная REG_FACT_POST_TP_FL, основанная на направляющей переменной TARGET'.
FORMATS
  REG_FACT_POST_TP_FL_категория (F8.0).
VARIABLE LEVEL
  REG_FACT_POST_TP_FL_категория (NOMINAL).
VALUE LABELS REG_FACT_POST_TP_FL_категория
  1 'REG_FACT_POST_TP_FL < 1'
  2 '1 <= REG_FACT_POST_TP_FL'.

RECODE TERM
  (MISSING = SYSMIS)
  (9 THRU HI = 2)
  (LOW THRU 9 = 1)
  INTO TERM_категория.
VARIABLE LABELS
  TERM_категория 'Категориальная входная переменная TERM, основанная на направляющей переменной TARGET'.
FORMATS
  TERM_категория (F8.0).
VARIABLE LEVEL
  TERM_категория (NOMINAL).
VALUE LABELS TERM_категория
  1 'TERM < 9'
  2 '9 <= TERM'.

RECODE FST_PAYMENT
  (MISSING = SYSMIS)
  (3800 THRU HI = 2)
  (LOW THRU 3800 = 1)
  INTO FST_PAYMENT_категория.
VARIABLE LABELS
  FST_PAYMENT_категория 'Категориальная входная переменная FST_PAYMENT, основанная на направляющей переменной TARGET'.
FORMATS
  FST_PAYMENT_категория (F8.0).
VARIABLE LEVEL
  FST_PAYMENT_категория (NOMINAL).
VALUE LABELS FST_PAYMENT_категория
  1 'FST_PAYMENT < 3800,000000000000'
  2 '3800,000000000000 <= FST_PAYMENT'.

RECODE FACT_LIVING_TERM
  (MISSING = SYSMIS)
  (86 THRU HI = 2)
  (LOW THRU 86 = 1)
  INTO FACT_LIVING_TERM_категория.
VARIABLE LABELS
  FACT_LIVING_TERM_категория 'Категориальная входная переменная FACT_LIVING_TERM, основанная на направляющей переменной TARGET'.
FORMATS
  FACT_LIVING_TERM_категория (F8.0).
VARIABLE LEVEL
  FACT_LIVING_TERM_категория (NOMINAL).
VALUE LABELS FACT_LIVING_TERM_категория
  1 'FACT_LIVING_TERM < 86'
  2 '86 <= FACT_LIVING_TERM'.

RECODE WORK_TIME
  (MISSING = SYSMIS)
  (82.684458285052145 THRU HI = 3)
  (79 THRU 82.684458285052145 = 2)
  (LOW THRU 79 = 1)
  INTO WORK_TIME_категория.
VARIABLE LABELS
  WORK_TIME_категория 'Категориальная входная переменная WORK_TIME, основанная на направляющей переменной TARGET'.
FORMATS
  WORK_TIME_категория (F8.0).
VARIABLE LEVEL
  WORK_TIME_категория (NOMINAL).
VALUE LABELS WORK_TIME_категория
  1 'WORK_TIME < 79'
  2 '79 <= WORK_TIME < 83'
  3 '83 <= WORK_TIME'.

RECODE GEN_PHONE_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO GEN_PHONE_FL_категория.
VARIABLE LABELS
  GEN_PHONE_FL_категория 'Категориальная входная переменная GEN_PHONE_FL, основанная на направляющей переменной TARGET'.
FORMATS
  GEN_PHONE_FL_категория (F8.0).
VARIABLE LEVEL
  GEN_PHONE_FL_категория (NOMINAL).
VALUE LABELS GEN_PHONE_FL_категория
  1 'GEN_PHONE_FL < 1'
  2 '1 <= GEN_PHONE_FL'.

RECODE LOAN_NUM_CLOSED
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO LOAN_NUM_CLOSED_категория.
VARIABLE LABELS
  LOAN_NUM_CLOSED_категория 'Категориальная входная переменная LOAN_NUM_CLOSED, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_NUM_CLOSED_категория (F8.0).
VARIABLE LEVEL
  LOAN_NUM_CLOSED_категория (NOMINAL).
VALUE LABELS LOAN_NUM_CLOSED_категория
  1 'LOAN_NUM_CLOSED < 1'
  2 '1 <= LOAN_NUM_CLOSED'.

RECODE LOAN_NUM_PAYM
  (MISSING = SYSMIS)
  (12 THRU HI = 2)
  (LOW THRU 12 = 1)
  INTO LOAN_NUM_PAYM_категория.
VARIABLE LABELS
  LOAN_NUM_PAYM_категория 'Категориальная входная переменная LOAN_NUM_PAYM, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_NUM_PAYM_категория (F8.0).
VARIABLE LEVEL
  LOAN_NUM_PAYM_категория (NOMINAL).
VALUE LABELS LOAN_NUM_PAYM_категория
  1 'LOAN_NUM_PAYM < 12'
  2 '12 <= LOAN_NUM_PAYM'.

RECODE LOAN_DLQ_NUM
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO LOAN_DLQ_NUM_категория.
VARIABLE LABELS
  LOAN_DLQ_NUM_категория 'Категориальная входная переменная LOAN_DLQ_NUM, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_DLQ_NUM_категория (F8.0).
VARIABLE LEVEL
  LOAN_DLQ_NUM_категория (NOMINAL).
VALUE LABELS LOAN_DLQ_NUM_категория
  1 'LOAN_DLQ_NUM < 1'
  2 '1 <= LOAN_DLQ_NUM'.

RECODE LOAN_MAX_DLQ
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO LOAN_MAX_DLQ_категория.
VARIABLE LABELS
  LOAN_MAX_DLQ_категория 'Категориальная входная переменная LOAN_MAX_DLQ, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_MAX_DLQ_категория (F8.0).
VARIABLE LEVEL
  LOAN_MAX_DLQ_категория (NOMINAL).
VALUE LABELS LOAN_MAX_DLQ_категория
  1 'LOAN_MAX_DLQ < 1'
  2 '1 <= LOAN_MAX_DLQ'.

RECODE LOAN_AVG_DLQ_AMT
  (MISSING = SYSMIS)
  (455.31999999999999 THRU HI = 2)
  (LOW THRU 455.31999999999999 = 1)
  INTO LOAN_AVG_DLQ_AMT_категория.
VARIABLE LABELS
  LOAN_AVG_DLQ_AMT_категория 'Категориальная входная переменная LOAN_AVG_DLQ_AMT, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_AVG_DLQ_AMT_категория (F8.0).
VARIABLE LEVEL
  LOAN_AVG_DLQ_AMT_категория (NOMINAL).
VALUE LABELS LOAN_AVG_DLQ_AMT_категория
  1 'LOAN_AVG_DLQ_AMT < 455'
  2 '455 <= LOAN_AVG_DLQ_AMT'.

RECODE LOAN_MAX_DLQ_AMT
  (MISSING = SYSMIS)
  (497.62 THRU HI = 2)
  (LOW THRU 497.62 = 1)
  INTO LOAN_MAX_DLQ_AMT_категория.
VARIABLE LABELS
  LOAN_MAX_DLQ_AMT_категория 'Категориальная входная переменная LOAN_MAX_DLQ_AMT, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_MAX_DLQ_AMT_категория (F8.0).
VARIABLE LEVEL
  LOAN_MAX_DLQ_AMT_категория (NOMINAL).
VALUE LABELS LOAN_MAX_DLQ_AMT_категория
  1 'LOAN_MAX_DLQ_AMT < 498'
  2 '498 <= LOAN_MAX_DLQ_AMT'.

RECODE MISS_IND
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO MISS_IND_категория.
VARIABLE LABELS
  MISS_IND_категория 'Категориальная входная переменная MISS_IND, основанная на направляющей переменной TARGET'.
FORMATS
  MISS_IND_категория (F8.0).
VARIABLE LEVEL
  MISS_IND_категория (NOMINAL).
VALUE LABELS MISS_IND_категория
  1 'MISS_IND < 1'
  2 '1 <= MISS_IND'.

EXECUTE.


* Строю модели логистической регрессии.
LOGISTIC REGRESSION VARIABLES TARGET
  /METHOD=ENTER AGE_категория SOCSTATUS_WORK_FL_категория SOCSTATUS_PENS_FL_категория
    GEN_INDUSTRY_категория GEN_TITLE_категория ORG_TP_STATE_категория ORG_TP_FCAPITAL_категория
    JOB_DIR_категория FAMILY_INCOME_категория PERSONAL_INCOME_категория TP_PROVINCE_категория
    REG_POST_FL_категория REG_FACT_POST_TP_FL_категория TERM_категория FST_PAYMENT_категория
    FACT_LIVING_TERM_категория WORK_TIME_категория GEN_PHONE_FL_категория LOAN_NUM_CLOSED_категория
    LOAN_NUM_PAYM_категория LOAN_DLQ_NUM_категория LOAN_MAX_DLQ_категория LOAN_AVG_DLQ_AMT_категория
    LOAN_MAX_DLQ_AMT_категория MISS_IND_категория
  /CONTRAST (AGE_категория)=Indicator
  /CONTRAST (SOCSTATUS_WORK_FL_категория)=Indicator
  /CONTRAST (SOCSTATUS_PENS_FL_категория)=Indicator
  /CONTRAST (GEN_INDUSTRY_категория)=Indicator
  /CONTRAST (GEN_TITLE_категория)=Indicator
  /CONTRAST (ORG_TP_STATE_категория)=Indicator
  /CONTRAST (ORG_TP_FCAPITAL_категория)=Indicator
  /CONTRAST (JOB_DIR_категория)=Indicator
  /CONTRAST (FAMILY_INCOME_категория)=Indicator
  /CONTRAST (PERSONAL_INCOME_категория)=Indicator
  /CONTRAST (TP_PROVINCE_категория)=Indicator
  /CONTRAST (REG_POST_FL_категория)=Indicator
  /CONTRAST (REG_FACT_POST_TP_FL_категория)=Indicator
  /CONTRAST (TERM_категория)=Indicator
  /CONTRAST (FST_PAYMENT_категория)=Indicator
  /CONTRAST (FACT_LIVING_TERM_категория)=Indicator
  /CONTRAST (WORK_TIME_категория)=Indicator
  /CONTRAST (GEN_PHONE_FL_категория)=Indicator
  /CONTRAST (LOAN_NUM_CLOSED_категория)=Indicator
  /CONTRAST (LOAN_NUM_PAYM_категория)=Indicator
  /CONTRAST (LOAN_DLQ_NUM_категория)=Indicator
  /CONTRAST (LOAN_MAX_DLQ_категория)=Indicator
  /CONTRAST (LOAN_AVG_DLQ_AMT_категория)=Indicator
  /CONTRAST (LOAN_MAX_DLQ_AMT_категория)=Indicator
  /CONTRAST (MISS_IND_категория)=Indicator
  /SAVE=PRED
  /OUTFILE= MODEL ('C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (оптимально категоризированные предикторы).xml'). 


VARIABLE LABELS 
PRE_1 ‘Модель логистической регрессии (оптимально категоризированные предикторы)’.

* Строим ROC-кривую модели логистической регрессии для обучающего набора.
ROC PRE_1 BY TARGET (1)
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.

*Открываем тестовый набор.
GET 
  FILE='C:\Trees\Конкурс ОТП Банк\Тестовый набор.sav'. 
DATASET NAME Наборданных2 WINDOW=FRONT.

* Правила ОПТИМАЛЬНОЙ КАТЕГОРИЗАЦИИ.

RECODE AGE
  (MISSING = SYSMIS)
  (58 THRU HI = 3)
  (43 THRU 58 = 2)
  (LOW THRU 43 = 1)
  INTO AGE_категория.
VARIABLE LABELS
  AGE_категория 'Категориальная входная переменная AGE, основанная на направляющей переменной TARGET'.
FORMATS
  AGE_категория (F8.0).
VARIABLE LEVEL
  AGE_категория (NOMINAL).
VALUE LABELS AGE_категория
  1 'AGE < 43'
  2 '43 <= AGE < 58'
  3 '58 <= AGE'.

RECODE SOCSTATUS_WORK_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO SOCSTATUS_WORK_FL_категория.
VARIABLE LABELS
  SOCSTATUS_WORK_FL_категория 'Категориальная входная переменная SOCSTATUS_WORK_FL, основанная на направляющей переменной TARGET'.
FORMATS
  SOCSTATUS_WORK_FL_категория (F8.0).
VARIABLE LEVEL
  SOCSTATUS_WORK_FL_категория (NOMINAL).
VALUE LABELS SOCSTATUS_WORK_FL_категория
  1 'SOCSTATUS_WORK_FL < 1'
  2 '1 <= SOCSTATUS_WORK_FL'.

RECODE SOCSTATUS_PENS_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO SOCSTATUS_PENS_FL_категория.
VARIABLE LABELS
  SOCSTATUS_PENS_FL_категория 'Категориальная входная переменная SOCSTATUS_PENS_FL, основанная на направляющей переменной TARGET'.
FORMATS
  SOCSTATUS_PENS_FL_категория (F8.0).
VARIABLE LEVEL
  SOCSTATUS_PENS_FL_категория (NOMINAL).
VALUE LABELS SOCSTATUS_PENS_FL_категория
  1 'SOCSTATUS_PENS_FL < 1'
  2 '1 <= SOCSTATUS_PENS_FL'.

RECODE GEN_INDUSTRY
  (MISSING = SYSMIS)
  (25 THRU HI = 3)
  (2 THRU 25 = 2)
  (LOW THRU 2 = 1)
  INTO GEN_INDUSTRY_категория.
VARIABLE LABELS
  GEN_INDUSTRY_категория 'Категориальная входная переменная GEN_INDUSTRY, основанная на направляющей переменной TARGET'.
FORMATS
  GEN_INDUSTRY_категория (F8.0).
VARIABLE LEVEL
  GEN_INDUSTRY_категория (NOMINAL).
VALUE LABELS GEN_INDUSTRY_категория
  1 'GEN_INDUSTRY < 2'
  2 '2 <= GEN_INDUSTRY < 25'
  3 '25 <= GEN_INDUSTRY'.

RECODE GEN_TITLE
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO GEN_TITLE_категория.
VARIABLE LABELS
  GEN_TITLE_категория 'Категориальная входная переменная GEN_TITLE, основанная на направляющей переменной TARGET'.
FORMATS
  GEN_TITLE_категория (F8.0).
VARIABLE LEVEL
  GEN_TITLE_категория (NOMINAL).
VALUE LABELS GEN_TITLE_категория
  1 'GEN_TITLE < 2'
  2 '2 <= GEN_TITLE'.

RECODE ORG_TP_STATE
  (MISSING = SYSMIS)
  (3 THRU HI = 3)
  (2 THRU 3 = 2)
  (LOW THRU 2 = 1)
  INTO ORG_TP_STATE_категория.
VARIABLE LABELS
  ORG_TP_STATE_категория 'Категориальная входная переменная ORG_TP_STATE, основанная на направляющей переменной TARGET'.
FORMATS
  ORG_TP_STATE_категория (F8.0).
VARIABLE LEVEL
  ORG_TP_STATE_категория (NOMINAL).
VALUE LABELS ORG_TP_STATE_категория
  1 'ORG_TP_STATE < 2'
  2 '2 <= ORG_TP_STATE < 3'
  3 '3 <= ORG_TP_STATE'.

RECODE ORG_TP_FCAPITAL
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO ORG_TP_FCAPITAL_категория.
VARIABLE LABELS
  ORG_TP_FCAPITAL_категория 'Категориальная входная переменная ORG_TP_FCAPITAL, основанная на направляющей переменной TARGET'.
FORMATS
  ORG_TP_FCAPITAL_категория (F8.0).
VARIABLE LEVEL
  ORG_TP_FCAPITAL_категория (NOMINAL).
VALUE LABELS ORG_TP_FCAPITAL_категория
  1 'ORG_TP_FCAPITAL < 2'
  2 '2 <= ORG_TP_FCAPITAL'.

RECODE JOB_DIR
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO JOB_DIR_категория.
VARIABLE LABELS
  JOB_DIR_категория 'Категориальная входная переменная JOB_DIR, основанная на направляющей переменной TARGET'.
FORMATS
  JOB_DIR_категория (F8.0).
VARIABLE LEVEL
  JOB_DIR_категория (NOMINAL).
VALUE LABELS JOB_DIR_категория
  1 'JOB_DIR < 2'
  2 '2 <= JOB_DIR'.

RECODE FAMILY_INCOME
  (MISSING = SYSMIS)
  (5 THRU HI = 2)
  (LOW THRU 5 = 1)
  INTO FAMILY_INCOME_категория.
VARIABLE LABELS
  FAMILY_INCOME_категория 'Категориальная входная переменная FAMILY_INCOME, основанная на направляющей переменной TARGET'.
FORMATS
  FAMILY_INCOME_категория (F8.0).
VARIABLE LEVEL
  FAMILY_INCOME_категория (NOMINAL).
VALUE LABELS FAMILY_INCOME_категория
  1 'FAMILY_INCOME < 5'
  2 '5 <= FAMILY_INCOME'.

RECODE PERSONAL_INCOME
  (MISSING = SYSMIS)
  (26500 THRU HI = 3)
  (14800 THRU 26500 = 2)
  (LOW THRU 14800 = 1)
  INTO PERSONAL_INCOME_категория.
VARIABLE LABELS
  PERSONAL_INCOME_категория 'Категориальная входная переменная PERSONAL_INCOME, основанная на направляющей переменной TARGET'.
FORMATS
  PERSONAL_INCOME_категория (F8.0).
VARIABLE LEVEL
  PERSONAL_INCOME_категория (NOMINAL).
VALUE LABELS PERSONAL_INCOME_категория
  1 'PERSONAL_INCOME < 14800'
  2 '14800 <= PERSONAL_INCOME < 26500'
  3 '26500 <= PERSONAL_INCOME'.

RECODE TP_PROVINCE
  (MISSING = SYSMIS)
  (2 THRU HI = 2)
  (LOW THRU 2 = 1)
  INTO TP_PROVINCE_категория.
VARIABLE LABELS
  TP_PROVINCE_категория 'Категориальная входная переменная TP_PROVINCE, основанная на направляющей переменной TARGET'.
FORMATS
  TP_PROVINCE_категория (F8.0).
VARIABLE LEVEL
  TP_PROVINCE_категория (NOMINAL).
VALUE LABELS TP_PROVINCE_категория
  1 'TP_PROVINCE < 2'
  2 '2 <= TP_PROVINCE'.

RECODE REG_POST_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO REG_POST_FL_категория.
VARIABLE LABELS
  REG_POST_FL_категория 'Категориальная входная переменная REG_POST_FL, основанная на направляющей переменной TARGET'.
FORMATS
  REG_POST_FL_категория (F8.0).
VARIABLE LEVEL
  REG_POST_FL_категория (NOMINAL).
VALUE LABELS REG_POST_FL_категория
  1 'REG_POST_FL < 1'
  2 '1 <= REG_POST_FL'.

RECODE REG_FACT_POST_TP_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO REG_FACT_POST_TP_FL_категория.
VARIABLE LABELS
  REG_FACT_POST_TP_FL_категория 'Категориальная входная переменная REG_FACT_POST_TP_FL, основанная на направляющей переменной TARGET'.
FORMATS
  REG_FACT_POST_TP_FL_категория (F8.0).
VARIABLE LEVEL
  REG_FACT_POST_TP_FL_категория (NOMINAL).
VALUE LABELS REG_FACT_POST_TP_FL_категория
  1 'REG_FACT_POST_TP_FL < 1'
  2 '1 <= REG_FACT_POST_TP_FL'.

RECODE TERM
  (MISSING = SYSMIS)
  (9 THRU HI = 2)
  (LOW THRU 9 = 1)
  INTO TERM_категория.
VARIABLE LABELS
  TERM_категория 'Категориальная входная переменная TERM, основанная на направляющей переменной TARGET'.
FORMATS
  TERM_категория (F8.0).
VARIABLE LEVEL
  TERM_категория (NOMINAL).
VALUE LABELS TERM_категория
  1 'TERM < 9'
  2 '9 <= TERM'.

RECODE FST_PAYMENT
  (MISSING = SYSMIS)
  (3800 THRU HI = 2)
  (LOW THRU 3800 = 1)
  INTO FST_PAYMENT_категория.
VARIABLE LABELS
  FST_PAYMENT_категория 'Категориальная входная переменная FST_PAYMENT, основанная на направляющей переменной TARGET'.
FORMATS
  FST_PAYMENT_категория (F8.0).
VARIABLE LEVEL
  FST_PAYMENT_категория (NOMINAL).
VALUE LABELS FST_PAYMENT_категория
  1 'FST_PAYMENT < 3800,000000000000'
  2 '3800,000000000000 <= FST_PAYMENT'.

RECODE FACT_LIVING_TERM
  (MISSING = SYSMIS)
  (86 THRU HI = 2)
  (LOW THRU 86 = 1)
  INTO FACT_LIVING_TERM_категория.
VARIABLE LABELS
  FACT_LIVING_TERM_категория 'Категориальная входная переменная FACT_LIVING_TERM, основанная на направляющей переменной TARGET'.
FORMATS
  FACT_LIVING_TERM_категория (F8.0).
VARIABLE LEVEL
  FACT_LIVING_TERM_категория (NOMINAL).
VALUE LABELS FACT_LIVING_TERM_категория
  1 'FACT_LIVING_TERM < 86'
  2 '86 <= FACT_LIVING_TERM'.

RECODE WORK_TIME
  (MISSING = SYSMIS)
  (82.684458285052145 THRU HI = 3)
  (79 THRU 82.684458285052145 = 2)
  (LOW THRU 79 = 1)
  INTO WORK_TIME_категория.
VARIABLE LABELS
  WORK_TIME_категория 'Категориальная входная переменная WORK_TIME, основанная на направляющей переменной TARGET'.
FORMATS
  WORK_TIME_категория (F8.0).
VARIABLE LEVEL
  WORK_TIME_категория (NOMINAL).
VALUE LABELS WORK_TIME_категория
  1 'WORK_TIME < 79'
  2 '79 <= WORK_TIME < 83'
  3 '83 <= WORK_TIME'.

RECODE GEN_PHONE_FL
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO GEN_PHONE_FL_категория.
VARIABLE LABELS
  GEN_PHONE_FL_категория 'Категориальная входная переменная GEN_PHONE_FL, основанная на направляющей переменной TARGET'.
FORMATS
  GEN_PHONE_FL_категория (F8.0).
VARIABLE LEVEL
  GEN_PHONE_FL_категория (NOMINAL).
VALUE LABELS GEN_PHONE_FL_категория
  1 'GEN_PHONE_FL < 1'
  2 '1 <= GEN_PHONE_FL'.

RECODE LOAN_NUM_CLOSED
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO LOAN_NUM_CLOSED_категория.
VARIABLE LABELS
  LOAN_NUM_CLOSED_категория 'Категориальная входная переменная LOAN_NUM_CLOSED, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_NUM_CLOSED_категория (F8.0).
VARIABLE LEVEL
  LOAN_NUM_CLOSED_категория (NOMINAL).
VALUE LABELS LOAN_NUM_CLOSED_категория
  1 'LOAN_NUM_CLOSED < 1'
  2 '1 <= LOAN_NUM_CLOSED'.

RECODE LOAN_NUM_PAYM
  (MISSING = SYSMIS)
  (12 THRU HI = 2)
  (LOW THRU 12 = 1)
  INTO LOAN_NUM_PAYM_категория.
VARIABLE LABELS
  LOAN_NUM_PAYM_категория 'Категориальная входная переменная LOAN_NUM_PAYM, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_NUM_PAYM_категория (F8.0).
VARIABLE LEVEL
  LOAN_NUM_PAYM_категория (NOMINAL).
VALUE LABELS LOAN_NUM_PAYM_категория
  1 'LOAN_NUM_PAYM < 12'
  2 '12 <= LOAN_NUM_PAYM'.

RECODE LOAN_DLQ_NUM
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO LOAN_DLQ_NUM_категория.
VARIABLE LABELS
  LOAN_DLQ_NUM_категория 'Категориальная входная переменная LOAN_DLQ_NUM, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_DLQ_NUM_категория (F8.0).
VARIABLE LEVEL
  LOAN_DLQ_NUM_категория (NOMINAL).
VALUE LABELS LOAN_DLQ_NUM_категория
  1 'LOAN_DLQ_NUM < 1'
  2 '1 <= LOAN_DLQ_NUM'.

RECODE LOAN_MAX_DLQ
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO LOAN_MAX_DLQ_категория.
VARIABLE LABELS
  LOAN_MAX_DLQ_категория 'Категориальная входная переменная LOAN_MAX_DLQ, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_MAX_DLQ_категория (F8.0).
VARIABLE LEVEL
  LOAN_MAX_DLQ_категория (NOMINAL).
VALUE LABELS LOAN_MAX_DLQ_категория
  1 'LOAN_MAX_DLQ < 1'
  2 '1 <= LOAN_MAX_DLQ'.

RECODE LOAN_AVG_DLQ_AMT
  (MISSING = SYSMIS)
  (455.31999999999999 THRU HI = 2)
  (LOW THRU 455.31999999999999 = 1)
  INTO LOAN_AVG_DLQ_AMT_категория.
VARIABLE LABELS
  LOAN_AVG_DLQ_AMT_категория 'Категориальная входная переменная LOAN_AVG_DLQ_AMT, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_AVG_DLQ_AMT_категория (F8.0).
VARIABLE LEVEL
  LOAN_AVG_DLQ_AMT_категория (NOMINAL).
VALUE LABELS LOAN_AVG_DLQ_AMT_категория
  1 'LOAN_AVG_DLQ_AMT < 455'
  2 '455 <= LOAN_AVG_DLQ_AMT'.

RECODE LOAN_MAX_DLQ_AMT
  (MISSING = SYSMIS)
  (497.62 THRU HI = 2)
  (LOW THRU 497.62 = 1)
  INTO LOAN_MAX_DLQ_AMT_категория.
VARIABLE LABELS
  LOAN_MAX_DLQ_AMT_категория 'Категориальная входная переменная LOAN_MAX_DLQ_AMT, основанная на направляющей переменной TARGET'.
FORMATS
  LOAN_MAX_DLQ_AMT_категория (F8.0).
VARIABLE LEVEL
  LOAN_MAX_DLQ_AMT_категория (NOMINAL).
VALUE LABELS LOAN_MAX_DLQ_AMT_категория
  1 'LOAN_MAX_DLQ_AMT < 498'
  2 '498 <= LOAN_MAX_DLQ_AMT'.

RECODE MISS_IND
  (MISSING = SYSMIS)
  (1 THRU HI = 2)
  (LOW THRU 1 = 1)
  INTO MISS_IND_категория.
VARIABLE LABELS
  MISS_IND_категория 'Категориальная входная переменная MISS_IND, основанная на направляющей переменной TARGET'.
FORMATS
  MISS_IND_категория (F8.0).
VARIABLE LEVEL
  MISS_IND_категория (NOMINAL).
VALUE LABELS MISS_IND_категория
  1 'MISS_IND < 1'
  2 '1 <= MISS_IND'.

EXECUTE.


* Применяем модели логистической регрессии, построенные на обучающем наборе, к тестовому набору.
MODEL HANDLE NAME=VAR00001_model FILE='C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (оптимально категоризированные предикторы).xml'
  /OPTIONS MISSING=SUBSTITUTE.
COMPUTE SelectedProbability=APPLYMODEL(VAR00001_model, 'PROBABILITY', 1).
EXECUTE.
MODEL CLOSE NAME=VAR00001_model.

VARIABLE LABELS 
SelectedProbability ‘Модель логистической регрессии (оптимально категоризированные предикторы)’.

* Строим ROC-кривую модели логистической регрессии для тестового набора.
ROC SelectedProbability BY TARGET (1)
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.