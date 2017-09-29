* Encoding: UTF-8.
MODEL HANDLE NAME=VAR00001_model FILE='C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (исходные предикторы).xml'
  /OPTIONS MISSING=SUBSTITUTE.
COMPUTE SelectedProbability1=APPLYMODEL(VAR00001_model, 'PROBABILITY', 1).
EXECUTE.
MODEL CLOSE NAME=VAR00001_model.
MODEL HANDLE NAME=VAR00002_model FILE='C:\Trees\Конкурс ОТП Банк\Модель логистической регрессии (предикторы, преобразованные с помощью CHAID).xml'
  /OPTIONS MISSING=SUBSTITUTE. 
COMPUTE SelectedProbability2=APPLYMODEL(VAR00002_model, 'PROBABILITY', 1).
EXECUTE.
MODEL CLOSE NAME=VAR00002_model.

VARIABLE LABELS 
SelectedProbability1 ‘Модель логистической регрессии (исходные предикторы)’
SelectedProbability2 ‘Модель логистической регрессии (предикторы, преобразованные с помощью CHAID)’.

ROC SelectedProbability1 SelectedProbability2 BY TARGET (1)
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.