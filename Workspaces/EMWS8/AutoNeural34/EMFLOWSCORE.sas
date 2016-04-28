***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
      F_DepVar  $ 12
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_Recency = 'Standard: Recency' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Marital_Status ;
drop Marital_StatusDivorced Marital_StatusMarried Marital_StatusSingle
        Marital_StatusTogether ;
*** encoding is sparse, initialize to zero;
Marital_StatusDivorced = 0;
Marital_StatusMarried = 0;
Marital_StatusSingle = 0;
Marital_StatusTogether = 0;
if missing( Marital_Status ) then do;
   Marital_StatusDivorced = .;
   Marital_StatusMarried = .;
   Marital_StatusSingle = .;
   Marital_StatusTogether = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( Marital_Status , $8. );
   %DMNORMIP( _dm8 )
   _dm_find = 0; drop _dm_find;
   if _dm8 <= 'SINGLE'  then do;
      if _dm8 <= 'MARRIED'  then do;
         if _dm8 = 'DIVORCED'  then do;
            Marital_StatusDivorced = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               Marital_StatusMarried = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            Marital_StatusSingle = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         Marital_StatusTogether = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            Marital_StatusDivorced = -1;
            Marital_StatusMarried = -1;
            Marital_StatusSingle = -1;
            Marital_StatusTogether = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      Marital_StatusDivorced = .;
      Marital_StatusMarried = .;
      Marital_StatusSingle = .;
      Marital_StatusTogether = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Frq ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumWebVisitsMonth ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -1.54500197834221 * S_AcceptedCmpTotal
          +     2.13269624676531 * S_Frq  +     0.91018334305327 * S_Mnt
          +    -1.92258561684999 * S_MntMeatProducts
          +     -1.7098915194593 * S_NumCatalogPurchases
          +    -0.73092398706652 * S_NumDealsPurchases
          +    -1.52371325097768 * S_NumWebVisitsMonth
          +     2.59712285696981 * S_Recency ;
   H1x1_2  =    -0.62469573898784 * S_AcceptedCmpTotal
          +    -3.01294208996145 * S_Frq  +    -4.18014732340271 * S_Mnt
          +     3.63686708458831 * S_MntMeatProducts
          +     0.32632650897658 * S_NumCatalogPurchases
          +     1.27820262549135 * S_NumDealsPurchases
          +    -0.18941034658667 * S_NumWebVisitsMonth
          +     1.34455705644101 * S_Recency ;
   H1x1_3  =    -1.66686655426537 * S_AcceptedCmpTotal
          +     1.67787744859875 * S_Frq  +     1.97664267386501 * S_Mnt
          +    -0.10252809999866 * S_MntMeatProducts
          +    -2.01730745054613 * S_NumCatalogPurchases
          +     0.36276273056202 * S_NumDealsPurchases
          +    -2.03441379397145 * S_NumWebVisitsMonth
          +     2.93250821506079 * S_Recency ;
   H1x1_4  =     0.78243113686776 * S_AcceptedCmpTotal
          +    -1.82663131535617 * S_Frq  +      0.2881963502664 * S_Mnt
          +     8.03567059273376 * S_MntMeatProducts
          +     2.16664649845379 * S_NumCatalogPurchases
          +     0.84009978401032 * S_NumDealsPurchases
          +     0.11354933533503 * S_NumWebVisitsMonth
          +    -1.07901935721913 * S_Recency ;
   H1x1_5  =       0.520662992966 * S_AcceptedCmpTotal
          +     2.30709719298221 * S_Frq  +    -1.24685702053791 * S_Mnt
          +     1.87107978843927 * S_MntMeatProducts
          +    -0.31123291719979 * S_NumCatalogPurchases
          +    -2.80886037303887 * S_NumDealsPurchases
          +     0.08829426076164 * S_NumWebVisitsMonth
          +     0.01139960588609 * S_Recency ;
   H1x1_1  = H1x1_1  +    -0.51004374170231 * Marital_StatusDivorced
          +     0.50838467240268 * Marital_StatusMarried
          +    -0.57765911295879 * Marital_StatusSingle
          +    -0.24222335065155 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.83738211384182 * Marital_StatusDivorced
          +     0.03531168852657 * Marital_StatusMarried
          +    -0.34417109081648 * Marital_StatusSingle
          +    -0.31315325265885 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -3.70783313474848 * Marital_StatusDivorced
          +      1.9516301625913 * Marital_StatusMarried
          +    -0.24904237582097 * Marital_StatusSingle
          +     1.51668241109596 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.27676175212593 * Marital_StatusDivorced
          +     0.06718550412505 * Marital_StatusMarried
          +    -0.16735434131197 * Marital_StatusSingle
          +     1.06963270761532 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -1.40244452255328 * Marital_StatusDivorced
          +    -1.79498797741807 * Marital_StatusMarried
          +     2.86341746904333 * Marital_StatusSingle
          +    -2.44061593695879 * Marital_StatusTogether ;
   H1x1_1  =     3.20180148936403 + H1x1_1 ;
   H1x1_2  =    -3.03978470440687 + H1x1_2 ;
   H1x1_3  =    -3.39567988555284 + H1x1_3 ;
   H1x1_4  =     4.55938081817653 + H1x1_4 ;
   H1x1_5  =     -6.4669834535491 + H1x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -0.57846605291128 * S_AcceptedCmpTotal
          +     0.46127801191304 * S_Frq  +    -0.14450302472938 * S_Mnt
          +    -0.19914740985847 * S_MntMeatProducts
          +    -0.96920717464092 * S_NumCatalogPurchases
          +    -1.68508588177508 * S_NumDealsPurchases
          +     -0.9404284924488 * S_NumWebVisitsMonth
          +     1.67147332768508 * S_Recency ;
   H1x2_2  =      1.0459354572297 * S_AcceptedCmpTotal
          +     2.82350241064269 * S_Frq  +     0.87895410649025 * S_Mnt
          +    -1.60286606361912 * S_MntMeatProducts
          +    -0.05010796315816 * S_NumCatalogPurchases
          +      1.1380574488234 * S_NumDealsPurchases
          +     0.25426721345204 * S_NumWebVisitsMonth
          +    -2.73625285283256 * S_Recency ;
   H1x2_3  =     1.05785663081938 * S_AcceptedCmpTotal
          +     0.04036906636666 * S_Frq  +     1.87139195780258 * S_Mnt
          +     2.58979830897092 * S_MntMeatProducts
          +      1.2569773545009 * S_NumCatalogPurchases
          +     0.21119951191653 * S_NumDealsPurchases
          +    -0.40993456334326 * S_NumWebVisitsMonth
          +    -0.07518138333775 * S_Recency ;
   H1x2_4  =    -1.65169602183442 * S_AcceptedCmpTotal
          +     0.11259843816571 * S_Frq  +     -0.4909263110452 * S_Mnt
          +     1.58324428521578 * S_MntMeatProducts
          +    -0.64140579988939 * S_NumCatalogPurchases
          +    -0.07557073365385 * S_NumDealsPurchases
          +     0.27159109297915 * S_NumWebVisitsMonth
          +    -2.60734864081732 * S_Recency ;
   H1x2_5  =     -0.0537738178774 * S_AcceptedCmpTotal
          +     0.77977253685316 * S_Frq  +      0.8350835949372 * S_Mnt
          +     0.02133290318048 * S_MntMeatProducts
          +    -0.37682732019302 * S_NumCatalogPurchases
          +     2.57483962426003 * S_NumDealsPurchases
          +    -0.76651867011773 * S_NumWebVisitsMonth
          +     1.79269108990868 * S_Recency ;
   H1x2_1  = H1x2_1  +     -0.6785006078361 * Marital_StatusDivorced
          +     1.00798219323102 * Marital_StatusMarried
          +     -1.3878630687005 * Marital_StatusSingle
          +     0.38993646858937 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     2.09014978919778 * Marital_StatusDivorced
          +    -0.99149540204741 * Marital_StatusMarried
          +    -0.22772928542301 * Marital_StatusSingle
          +     2.92746205796719 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     -0.9762988536771 * Marital_StatusDivorced
          +     1.54170826840021 * Marital_StatusMarried
          +    -0.09937587953829 * Marital_StatusSingle
          +     0.56302999728519 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.25720612100596 * Marital_StatusDivorced
          +    -0.48775794259019 * Marital_StatusMarried
          +     0.87075561905397 * Marital_StatusSingle
          +     0.04810416118778 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.43415973497838 * Marital_StatusDivorced
          +     0.01260332236695 * Marital_StatusMarried
          +     1.18815076116703 * Marital_StatusSingle
          +     0.48437203261339 * Marital_StatusTogether ;
   H1x2_1  =     0.59373524039937 + H1x2_1 ;
   H1x2_2  =    -0.71387492444638 + H1x2_2 ;
   H1x2_3  =    -0.87122218589138 + H1x2_3 ;
   H1x2_4  =    -0.13330305074809 + H1x2_4 ;
   H1x2_5  =    -0.21968490365757 + H1x2_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
   H1x2_5  = 1.0 / (1.0 + EXP(MIN( - H1x2_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     1.45129577556868 * H1x1_1  +     -3.2081674830022 * H1x1_2
          +     3.42026207686484 * H1x1_3  +    -3.72024251386054 * H1x1_4
          +    -2.30130940015795 * H1x1_5 ;
   H2x1_2  =    -4.02910663646154 * H1x1_1  +    -1.36266586214201 * H1x1_2
          +     -2.6741103337432 * H1x1_3  +     3.30152436221712 * H1x1_4
          +     4.60157490246583 * H1x1_5 ;
   H2x1_3  =    -2.71265022944259 * H1x1_1  +     3.25833541933639 * H1x1_2
          +    -4.27328627935531 * H1x1_3  +     3.44552729303863 * H1x1_4
          +     1.98222057652994 * H1x1_5 ;
   H2x1_4  =     2.28893869996771 * H1x1_1  +    -1.88060597031882 * H1x1_2
          +     2.73897702163351 * H1x1_3  +    -1.93112188328204 * H1x1_4
          +    -2.14551123022514 * H1x1_5 ;
   H2x1_5  =     0.17403378809357 * H1x1_1  +     0.03207619288442 * H1x1_2
          +     0.88058789634283 * H1x1_3  +    -2.03707509730247 * H1x1_4
          +    -0.16844881046516 * H1x1_5 ;
   H2x1_1  = H2x1_1  +    -0.42620560083346 * H1x2_1
          +     2.61300451668579 * H1x2_2  +    -1.08729872311941 * H1x2_3
          +     0.36500562232913 * H1x2_4  +     0.78657990168531 * H1x2_5 ;
   H2x1_2  = H2x1_2  +     -3.3095282858933 * H1x2_1
          +    -1.16629762992585 * H1x2_2  +     0.33128267734744 * H1x2_3
          +     0.07369118606842 * H1x2_4  +      0.6553035374014 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     0.51835290812588 * H1x2_1
          +    -0.73350588958096 * H1x2_2  +     1.41475754999036 * H1x2_3
          +     0.14918618308538 * H1x2_4  +    -1.73283355686834 * H1x2_5 ;
   H2x1_4  = H2x1_4  +     0.98984363206925 * H1x2_1
          +     2.36687848114553 * H1x2_2  +     0.03777540439167 * H1x2_3
          +    -0.73252777784956 * H1x2_4  +    -0.04184890910757 * H1x2_5 ;
   H2x1_5  = H2x1_5  +    -2.05979445476877 * H1x2_1
          +     0.19598137322499 * H1x2_2  +    -1.96096261338489 * H1x2_3
          +    -1.87993721108869 * H1x2_4  +     1.19567303848292 * H1x2_5 ;
   H2x1_1  =     1.99856910799552 + H2x1_1 ;
   H2x1_2  =    -0.68335198868759 + H2x1_2 ;
   H2x1_3  =    -1.47801222552286 + H2x1_3 ;
   H2x1_4  =    -0.64885772031774 + H2x1_4 ;
   H2x1_5  =     1.36680339876645 + H2x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;

*** Generate dummy variables for DepVar ;
drop DepVar1 DepVar0 ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   DepVar1 = .;
   DepVar0 = .;
end;
else do;
   if F_DepVar = '0'  then do;
      DepVar1 = 0;
      DepVar0 = 1;
   end;
   else if F_DepVar = '1'  then do;
      DepVar1 = 1;
      DepVar0 = 0;
   end;
   else do;
      DepVar1 = .;
      DepVar0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -8.53264166014568 * H2x1_1  +     9.59119828234132 * H2x1_2
          +     8.22466103889512 * H2x1_3  +    -7.77899855684839 * H2x1_4
          +    -2.21335603990809 * H2x1_5 ;
   P_DepVar1  =     0.50239586442602 + P_DepVar1 ;
   P_DepVar0  = 0;
   _MAX_ = MAX (P_DepVar1 , P_DepVar0 );
   _SUM_ = 0.;
   P_DepVar1  = EXP(P_DepVar1  - _MAX_);
   _SUM_ = _SUM_ + P_DepVar1 ;
   P_DepVar0  = EXP(P_DepVar0  - _MAX_);
   _SUM_ = _SUM_ + P_DepVar0 ;
   P_DepVar1  = P_DepVar1  / _SUM_;
   P_DepVar0  = P_DepVar0  / _SUM_;
END;
ELSE DO;
   P_DepVar1  = .;
   P_DepVar0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_DepVar1  =     0.15122156697556;
   P_DepVar0  =     0.84877843302443;
END;
*** *****************************;
*** Writing the Residuals  of the Node DepVar ;
*** ******************************;
IF MISSING( DepVar1 ) THEN R_DepVar1  = . ;
ELSE R_DepVar1  = DepVar1  - P_DepVar1 ;
IF MISSING( DepVar0 ) THEN R_DepVar0  = . ;
ELSE R_DepVar0  = DepVar0  - P_DepVar0 ;
*** *************************;
*** Writing the I_DepVar  AND U_DepVar ;
*** *************************;
_MAXP_ = P_DepVar1 ;
I_DepVar  = "1           " ;
U_DepVar  =                    1;
IF( _MAXP_ LT P_DepVar0  ) THEN DO;
   _MAXP_ = P_DepVar0 ;
   I_DepVar  = "0           " ;
   U_DepVar  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop S_:;
