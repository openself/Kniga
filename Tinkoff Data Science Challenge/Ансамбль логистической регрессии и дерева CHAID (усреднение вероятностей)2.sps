* Encoding: UTF-8.

* Строим логистическую регрессию.
LOGISTIC REGRESSION VARIABLES open_account_flg
  /SELECT=validate EQ 1
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
  /VALIDATION TYPE=SPLITSAMPLE(validate) OUTPUT=BOTHSAMPLES
  /OUTFILE TRAININGMODEL='C:\Trees\Дерево.xml'.

* Вычисляем вероятность для ансамбля. 
COMPUTE PRE_3=(PRE_1 + PredictedProbability_2) / 2.

* Присваиваем метки переменным, в которых записаны вероятности. 
VARIABLE LABELS 
PRE_1 ‘Модель логистической регрессии’
PredictedProbability_2 ‘Модель дерева решений CHAID’
PRE_3 ‘Объединенная модель регрессии и дерева’.

* Оставляем для анализа только наблюдения обучающей выборки. 

USE ALL.
COMPUTE flter_$=(validate = 1).
FILTER BY flter_$.

* Строим ROC-кривые и вычисляем значения AUC для всех трех моделей на обучающей выборке.
ROC PRE_1 PredictedProbability_2 PRE_3 BY open_account_flg (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.

* Оставляем для анализа только наблюдения контрольной выборки. 

COMPUTE flter_$=(validate = 0).
FILTER BY flter_$.

* Строим ROC-кривые и вычисляем значения AUC для всех трех моделей на контрольной выборке.
ROC PRE_1 PredictedProbability_2 PRE_3 BY open_account_flg (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.

* Отключаем фильтрацию наблюдений. 
FILTER OFF.
USE ALL.

* Удаляем переменную фильтра. 
DELETE VARIABLES flter_$.
EXECUTE.



















