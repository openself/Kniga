* Encoding: UTF-8.
LOGISTIC REGRESSION VARIABLES TARGET
  /METHOD=ENTER 
AGE CHILD_TOTAL EDUCATION MARITAL_STATUS GEN_INDUSTRY 
GEN_TITLE ORG_TP_STATE JOB_DIR FAMILY_INCOME PERSONAL_INCOME REGION_NM CREDIT TERM FST_PAYMENT GPF_DOCUMENT_FL FACT_LIVING_TERM WORK_TIME FACT_PHONE_FL LOAN_NUM_TOTAL 
LOAN_NUM_CLOSED LOAN_NUM_PAYM LOAN_DLQ_NUM LOAN_MAX_DLQ_AMT 
  /CONTRAST (EDUCATION)=Indicator
  /CONTRAST (MARITAL_STATUS)=Indicator
  /CONTRAST (GEN_INDUSTRY)=Indicator
  /CONTRAST (GEN_TITLE)=Indicator
  /CONTRAST (ORG_TP_STATE)=Indicator
  /CONTRAST (JOB_DIR)=Indicator
  /CONTRAST (FAMILY_INCOME)=Indicator
  /CONTRAST (REGION_NM)=Indicator
  /CONTRAST (GPF_DOCUMENT_FL)=Indicator
  /CONTRAST (FACT_PHONE_FL)=Indicator
  /SAVE=PRED
  /OUTFILE= MODEL ('C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (исходные предикторы).xml'). 

LOGISTIC REGRESSION VARIABLES TARGET
  /METHOD=ENTER 
AGEchaid CHILD_TOTALchaid EDUCATIONchaid MARITAL_STATUSchaid
GEN_INDUSTRYchaid GEN_TITLEchaid ORG_TP_STATEchaid JOB_DIRchaid 
FAMILY_INCOMEchaid PERSONAL_INCOMEchaid REGION_NMchaid CREDITchaid TERMchaid FST_PAYMENTchaid GPF_DOCUMENT_FL FACT_LIVING_TERMchaid WORK_TIMEchaid FACT_PHONE_FL LOAN_NUM_TOTALchaid LOAN_NUM_CLOSEDchaid LOAN_NUM_PAYMchaid 
LOAN_DLQ_NUMchaid LOAN_MAX_DLQ_AMTchaid 
  /CONTRAST (AGEchaid)=Indicator
  /CONTRAST (CHILD_TOTALchaid)=Indicator
  /CONTRAST (EDUCATIONchaid)=Indicator
  /CONTRAST (MARITAL_STATUSchaid)=Indicator
  /CONTRAST (GEN_INDUSTRYchaid)=Indicator
  /CONTRAST (GEN_TITLEchaid)=Indicator
  /CONTRAST (ORG_TP_STATEchaid)=Indicator
  /CONTRAST (JOB_DIRchaid)=Indicator
  /CONTRAST (FAMILY_INCOMEchaid)=Indicator
  /CONTRAST (PERSONAL_INCOMEchaid)=Indicator
  /CONTRAST (REGION_NMchaid)=Indicator
  /CONTRAST (CREDITchaid)=Indicator
  /CONTRAST (TERMchaid)=Indicator
  /CONTRAST (FST_PAYMENTchaid)=Indicator
  /CONTRAST (GPF_DOCUMENT_FL)=Indicator
  /CONTRAST (FACT_LIVING_TERMchaid)=Indicator
  /CONTRAST (WORK_TIMEchaid)=Indicator
  /CONTRAST (FACT_PHONE_FL)=Indicator
  /CONTRAST (LOAN_NUM_TOTALchaid)=Indicator
  /CONTRAST (LOAN_NUM_CLOSEDchaid)=Indicator
  /CONTRAST (LOAN_NUM_PAYMchaid)=Indicator
  /CONTRAST (LOAN_DLQ_NUMchaid)=Indicator
  /CONTRAST (LOAN_MAX_DLQ_AMTchaid)=Indicator
  /SAVE=PRED
  /OUTFILE= MODEL ('C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (предикторы, преобразованные с помощью CHAID).xml'). 

VARIABLE LABELS 
PRE_1 ‘Модель логистической регрессии (исходные предикторы)’
PRE_2 ‘Модель логистической регрессии (предикторы, преобразованные с помощью CHAID)’.

ROC PRE_1 PRE_2 BY TARGET (1)
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.

