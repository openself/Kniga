* Encoding: UTF-8.

* Логистическая регрессия.
LOGISTIC REGRESSION VARIABLES churn
  /SELECT=validate EQ 1
  /METHOD=ENTER longdist internat local int_disc billtype pay age gender marital children income
  /CONTRAST (int_disc)=Indicator
  /CONTRAST (billtype)=Indicator
  /CONTRAST (pay)=Indicator
  /CONTRAST (gender)=Indicator
  /CONTRAST (marital)=Indicator
  /SAVE=PRED
  /OUTFILE= MODEL ('C:\Trees\Регрессия.xml'). 
* Дерево решений. 
TREE churn BY longdist internat local int_disc billtype pay age gender marital children income 
  /SAVE PREDPROB 
  /METHOD TYPE=CHAID
  /VALIDATION TYPE=SPLITSAMPLE(validate) OUTPUT=BOTHSAMPLES
  /OUTFILE TRAININGMODEL='C:\Trees\Дерево.xml'.
IF PredictedProbability_1=1 PredictedProbability_1=0.999.
IF PredictedProbability_2=0 PredictedProbability_2=0.001.
IF PredictedProbability_1=0 PredictedProbability_1=0.001.
IF PredictedProbability_2=1 PredictedProbability_2=0.999.
COMPUTE logit_regr=LN(PRE_1 / (1 - PRE_1)).
COMPUTE logit_tree=LN(PredictedProbability_2/PredictedProbability_1). 
COMPUTE logit_aver=(logit_regr + logit_tree) / 2.
VARIABLE LABELS 
logit_regr ‘Модель логистической регрессии’
logit_tree ‘Модель дерева решений CHAID’
logit_aver ‘Объединенная модель логистической регрессии и дерева CHAID’.
USE ALL. 
COMPUTE filter_$=(validate = 0). 
VARIABLE LABELS filter_$ 'validate = 0 (FILTER)'. 
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'. 
FORMATS filter_$ (f1.0). 
FILTER BY filter_$. 
ROC logit_regr logit_tree logit_aver BY churn (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.
FILTER OFF. 
USE ALL. 
DELETE VARIABLES filter_$.

*Открываем тестовый набор.
GET 
  FILE='C:\Trees\СhurnVer_Тестовый.sav'. 
DATASET NAME Наборданных2 WINDOW=FRONT.

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
COMPUTE Prob1=1 - SelectedProbability1.
COMPUTE Prob2=1 - SelectedProbability2.
IF SelectedProbability2=1 SelectedProbability2=0.999.
IF Prob2=0 Prob2=0.001.
IF SelectedProbability2=0 SelectedProbability2=0.001.
IF Prob2=1 Prob2=0.999.
COMPUTE logit_regr=LN(SelectedProbability1 / Prob1).
COMPUTE logit_tree=LN(SelectedProbability2 / Prob2).
COMPUTE logit_aver=(logit_regr + logit_tree) / 2.
ROC logit_regr logit_tree logit_aver BY churn (1) 
  /PLOT=CURVE(REFERENCE) 
  /PRINT=SE.




















