* Encoding: UTF-8.

* Строим логистическую регрессию.
LOGISTIC REGRESSION VARIABLES open_account_flg
  /METHOD=ENTER gender age marital_status job_position credit_sum credit_month score_shk education tariff region avregzarplata monthly_income credit_count overdue_credit_count
  /CONTRAST (gender)=Indicator
  /CONTRAST (marital_status)=Indicator
  /CONTRAST (job_position)=Indicator
  /CONTRAST (education)=Indicator
  /CONTRAST (tariff)=Indicator
  /CONTRAST (region)=Indicator
  /SAVE=PRED
  /OUTFILE= MODEL ('C:\Trees\Регрессия.xml'). 

* Строим дерево решений. 
TREE open_account_flg BY gender age marital_status job_position credit_sum credit_month score_shk education tariff region avregzarplata monthly_income credit_count overdue_credit_count 
  /SAVE PREDPROB 
  /METHOD TYPE=CHAID
  /OUTFILE TRAININGMODEL='C:\Trees\Дерево.xml'.

* Вычисляем вероятность для ансамбля. 
COMPUTE PRE_3=(PRE_1 + PredictedProbability_2) / 2.

* Присваиваем метки переменным, в которых записаны вероятности. 
VARIABLE LABELS 
PRE_1 ‘Модель логистической регрессии (обучающая выборка)’
PredictedProbability_2 ‘Модель дерева решений CHAID (обучающая выборка)’
PRE_3 ‘Объединенная модель регрессии и дерева (обучающая выборка)’.

* Строим ROC-кривые и вычисляем значения AUC для всех трех моделей на обучающей выборке.
ROC PRE_1 PredictedProbability_2 PRE_3 BY open_account_flg (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.

*Открываем контрольный набор.
GET 
  FILE='C:\Trees\Конкурс Tinkoff Data Science Challenge\TinkoffCredit_Контрольный.sav'. 
DATASET NAME Наборданных2 WINDOW=FRONT.

*Применяем построенные модели к контрольному набору и вычисляем вероятности.
MODEL HANDLE NAME=Регрессия FILE='C:\Trees\Регрессия.xml'
  /OPTIONS MISSING=SUBSTITUTE. 
COMPUTE SelectedProbability1=APPLYMODEL(Регрессия, 'PROBABILITY', 1).
EXECUTE.
MODEL CLOSE NAME=Регрессия. 
MODEL HANDLE NAME=Дерево FILE='C:\Trees\Дерево.xml'
  /OPTIONS MISSING=SUBSTITUTE. 
COMPUTE SelectedProbability2=APPLYMODEL(Дерево, 'PROBABILITY', 1).
EXECUTE.
MODEL CLOSE NAME=Дерево.
COMPUTE SelectedProbability3=(SelectedProbability1 + SelectedProbability2) / 2.

* Присваиваем метки переменным, в которых записаны вероятности. 
VARIABLE LABELS 
SelectedProbability1 ‘Модель логистической регрессии (контрольная выборка)’
SelectedProbability2 ‘Модель дерева решений CHAID (контрольная выборка)’
SelectedProbability3 ‘Объединенная модель регрессии и дерева (контрольная выборка)’.

* Строим ROC-кривые и вычисляем значения AUC для всех трех моделей на контрольной выборке.
ROC SelectedProbability1 SelectedProbability2 SelectedProbability3 BY open_account_flg (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.




















