**********************************************************;
**** Begin scoring code for principal components analysis;
**********************************************************;
LENGTH _FORMAT $200;
LENGTH _NORMFMT $%DMNORLEN;
;
/************************************************/
* Create dummy variables for Dependents;
/************************************************/
;
_FORMAT =PUT(Dependents,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN Dependents_1_=1.57120916085916;
ELSE Dependents_1_=-0.63606227872851;
IF _NORMFMT ="1" THEN Dependents_2_=0.63606227872851;
ELSE Dependents_2_=-1.57120916085916;
;
/************************************************/
* Create dummy variables for Education;
/************************************************/
;
_FORMAT =PUT(Education,$10.0);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="2N CYCLE" THEN Education_1_=2.2054302240839;
ELSE Education_1_=-0.45314826481546;
IF _NORMFMT ="BASIC" THEN Education_2_=2.91159016807505;
ELSE Education_2_=-0.34324435154825;
IF _NORMFMT ="GRADUATION" THEN Education_3_=0.97248162931379;
ELSE Education_3_=-1.02766658936312;
IF _NORMFMT ="MASTER" THEN Education_4_=2.42451031170966;
ELSE Education_4_=-0.41220153793055;
IF _NORMFMT ="PHD" THEN Education_5_=3.79182958627505;
ELSE Education_5_=-0.26356323681649;
;
/************************************************/
* Create dummy variables for Gender;
/************************************************/
;
_FORMAT =PUT(Gender,$1.0);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="F" THEN Gender_1_=0.54246097964331;
ELSE Gender_1_=-1.84232030822258;
IF _NORMFMT ="M" THEN Gender_2_=1.84232030822259;
ELSE Gender_2_=-0.54246097964331;
;
/************************************************/
* Create dummy variables for Marital_Status;
/************************************************/
;
_FORMAT =PUT(Marital_Status,$12.0);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="DIVORCED" THEN Marital_Status_1_=3.11838056229689;
ELSE Marital_Status_1_=-0.32048265413734;
IF _NORMFMT ="MARRIED" THEN Marital_Status_2_=1.25525002101396;
ELSE Marital_Status_2_=-0.79616559449082;
IF _NORMFMT ="SINGLE" THEN Marital_Status_3_=1.84554017192533;
ELSE Marital_Status_3_=-0.5415145627378;
IF _NORMFMT ="TOGETHER" THEN Marital_Status_4_=1.73081228329373;
ELSE Marital_Status_4_=-0.57740916728033;
IF _NORMFMT ="WIDOW" THEN Marital_Status_5_=4.79282811668423;
ELSE Marital_Status_5_=-0.20851715414877;
;
/************************************************/
* Impute missing values for interval variables;
/************************************************/
;
if Age=. then _D1 = 0;
else _D1=(Age-49.6100551808706)/16.7649941146922;
if Age_Exmpl2=. then _D2 = 0;
else _D2=(Age_Exmpl2-49.6100551808706)/16.7649941146922;
if CatPurchase=. then _D3 = 0;
else _D3=(CatPurchase-57.8258736971183)/18.2057522786251;
if Clothes=. then _D4 = 0;
else _D4=(Clothes-52.0919681177192)/22.5372793386683;
if Frq=. then _D5 = 0;
else _D5=(Frq-20.2618025751072)/11.1021804717477;
if HigherEducation=. then _D6 = 0;
else _D6=(HigherEducation-0.72409564684242)/0.44710592277836;
if HouseKeeping=. then _D7 = 0;
else _D7=(HouseKeeping-6.47332924586143)/6.92752090600866;
if Income=. then _D8 = 0;
else _D8=(Income-74652.6366952789)/28338.2761207796;
if Kitchen=. then _D9 = 0;
else _D9=(Kitchen-6.5334150827713)/7.04350760002782;
if Mnt=. then _D10 = 0;
else _D10=(Mnt-668.500012262416)/682.865486365329;
if MonthsAsCustomer=. then _D11 = 0;
else _D11=(MonthsAsCustomer-80.7657878602084)/16.5932673715258;
if NetPurchase=. then _D12 = 0;
else _D12=(NetPurchase-42.1741263028816)/18.2057522786251;
if RMntFrq=. then _D13 = 0;
else _D13=(RMntFrq-24.4483013550012)/16.8773857832219;
if RMntFrq_Exmpl2=. then _D14 = 0;
else _D14=(RMntFrq_Exmpl2-24.4483013550012)/16.8773857832219;
if Rcn=. then _D15 = 0;
else _D15=(Rcn-64.3280196198651)/72.7615548958443;
if Recomendation=. then _D16 = 0;
else _D16=(Recomendation-3.97118332311465)/1.14571637947628;
if SmallAppliances=. then _D17 = 0;
else _D17=(SmallAppliances-28.4077253218884)/12.5327512699014;
if Toys=. then _D18 = 0;
else _D18=(Toys-6.47578172900061)/6.78336079444886;
;
DROP _FORMAT _NORMFMT
Dependents_1_
Dependents_2_
Education_1_
Education_2_
Education_3_
Education_4_
Education_5_
Gender_1_
Gender_2_
Marital_Status_1_
Marital_Status_2_
Marital_Status_3_
Marital_Status_4_
Marital_Status_5_
_D1
_D2
_D3
_D4
_D5
_D6
_D7
_D8
_D9
_D10
_D11
_D12
_D13
_D14
_D15
_D16
_D17
_D18
;
