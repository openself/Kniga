* Encoding: UTF-8.
*Строим модели деревьев решений с проверкой.
TREE Дефолт BY Возраст Образование Доход Работа Адрес Процент Кредит 
  /SAVE PREDPROB
  /METHOD TYPE=CHAID
  /VALIDATION TYPE=SPLITSAMPLE(validate).
TREE Дефолт BY Возраст Образование Доход Работа Адрес Процент Кредит 
  /SAVE PREDPROB
  /METHOD TYPE=EXHAUSTIVECHAID
  /VALIDATION TYPE=SPLITSAMPLE(validate).
TREE Дефолт BY Возраст Образование Доход Работа Адрес Процент Кредит
  /SAVE PREDPROB
  /METHOD TYPE=CRT
  /VALIDATION TYPE=SPLITSAMPLE(validate).
TREE Дефолт BY Возраст Образование Доход Работа Адрес Процент Кредит
  /SAVE PREDPROB
  /METHOD TYPE=QUEST
  /VALIDATION TYPE=SPLITSAMPLE(validate).
*Присваиваем метки переменным-спрогнозированным вероятностям дефолта.
VARIABLE LABELS 
PredictedProbability_2 ‘Модель CHAID’
PredictedProbability_2_1 ‘Модель Исчерпывающий CHAID’
PredictedProbability_2_2 ‘Модель CRT’
PredictedProbability_2_3 ‘Модель QUEST’.
*Отбираем наблюдения, относящиеся к обучающей выборке.
USE ALL. 
COMPUTE filter_$=(validate = 1). 
FILTER BY filter_$.
*Строим ROC-кривые по обучающей выборке.
ROC PredictedProbability_2 PredictedProbability_2_1 PredictedProbability_2_2 
    PredictedProbability_2_3 BY Дефолт (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.
*Отбираем наблюдения, относящиеся к контрольной выборке.
COMPUTE filter_$=(validate = 0). 
FILTER BY filter_$.
*Строим ROC-кривые по контрольной выборке.
ROC PredictedProbability_2 PredictedProbability_2_1 PredictedProbability_2_2 
    PredictedProbability_2_3 BY Дефолт (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.
FILTER OFF. 
USE ALL. 
DELETE VARIABLES filter_$.
