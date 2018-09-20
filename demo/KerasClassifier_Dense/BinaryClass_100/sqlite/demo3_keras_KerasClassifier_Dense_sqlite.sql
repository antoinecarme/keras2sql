-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_Dense
-- Dataset : BinaryClass_100
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9", "ADS"."Feature_10" AS "Feature_10", "ADS"."Feature_11" AS "Feature_11", "ADS"."Feature_12" AS "Feature_12", "ADS"."Feature_13" AS "Feature_13", "ADS"."Feature_14" AS "Feature_14", "ADS"."Feature_15" AS "Feature_15", "ADS"."Feature_16" AS "Feature_16", "ADS"."Feature_17" AS "Feature_17", "ADS"."Feature_18" AS "Feature_18", "ADS"."Feature_19" AS "Feature_19", "ADS"."Feature_20" AS "Feature_20", "ADS"."Feature_21" AS "Feature_21", "ADS"."Feature_22" AS "Feature_22", "ADS"."Feature_23" AS "Feature_23", "ADS"."Feature_24" AS "Feature_24", "ADS"."Feature_25" AS "Feature_25", "ADS"."Feature_26" AS "Feature_26", "ADS"."Feature_27" AS "Feature_27", "ADS"."Feature_28" AS "Feature_28", "ADS"."Feature_29" AS "Feature_29", "ADS"."Feature_30" AS "Feature_30", "ADS"."Feature_31" AS "Feature_31", "ADS"."Feature_32" AS "Feature_32", "ADS"."Feature_33" AS "Feature_33", "ADS"."Feature_34" AS "Feature_34", "ADS"."Feature_35" AS "Feature_35", "ADS"."Feature_36" AS "Feature_36", "ADS"."Feature_37" AS "Feature_37", "ADS"."Feature_38" AS "Feature_38", "ADS"."Feature_39" AS "Feature_39", "ADS"."Feature_40" AS "Feature_40", "ADS"."Feature_41" AS "Feature_41", "ADS"."Feature_42" AS "Feature_42", "ADS"."Feature_43" AS "Feature_43", "ADS"."Feature_44" AS "Feature_44", "ADS"."Feature_45" AS "Feature_45", "ADS"."Feature_46" AS "Feature_46", "ADS"."Feature_47" AS "Feature_47", "ADS"."Feature_48" AS "Feature_48", "ADS"."Feature_49" AS "Feature_49", "ADS"."Feature_50" AS "Feature_50", "ADS"."Feature_51" AS "Feature_51", "ADS"."Feature_52" AS "Feature_52", "ADS"."Feature_53" AS "Feature_53", "ADS"."Feature_54" AS "Feature_54", "ADS"."Feature_55" AS "Feature_55", "ADS"."Feature_56" AS "Feature_56", "ADS"."Feature_57" AS "Feature_57", "ADS"."Feature_58" AS "Feature_58", "ADS"."Feature_59" AS "Feature_59", "ADS"."Feature_60" AS "Feature_60", "ADS"."Feature_61" AS "Feature_61", "ADS"."Feature_62" AS "Feature_62", "ADS"."Feature_63" AS "Feature_63", "ADS"."Feature_64" AS "Feature_64", "ADS"."Feature_65" AS "Feature_65", "ADS"."Feature_66" AS "Feature_66", "ADS"."Feature_67" AS "Feature_67", "ADS"."Feature_68" AS "Feature_68", "ADS"."Feature_69" AS "Feature_69", "ADS"."Feature_70" AS "Feature_70", "ADS"."Feature_71" AS "Feature_71", "ADS"."Feature_72" AS "Feature_72", "ADS"."Feature_73" AS "Feature_73", "ADS"."Feature_74" AS "Feature_74", "ADS"."Feature_75" AS "Feature_75", "ADS"."Feature_76" AS "Feature_76", "ADS"."Feature_77" AS "Feature_77", "ADS"."Feature_78" AS "Feature_78", "ADS"."Feature_79" AS "Feature_79", "ADS"."Feature_80" AS "Feature_80", "ADS"."Feature_81" AS "Feature_81", "ADS"."Feature_82" AS "Feature_82", "ADS"."Feature_83" AS "Feature_83", "ADS"."Feature_84" AS "Feature_84", "ADS"."Feature_85" AS "Feature_85", "ADS"."Feature_86" AS "Feature_86", "ADS"."Feature_87" AS "Feature_87", "ADS"."Feature_88" AS "Feature_88", "ADS"."Feature_89" AS "Feature_89", "ADS"."Feature_90" AS "Feature_90", "ADS"."Feature_91" AS "Feature_91", "ADS"."Feature_92" AS "Feature_92", "ADS"."Feature_93" AS "Feature_93", "ADS"."Feature_94" AS "Feature_94", "ADS"."Feature_95" AS "Feature_95", "ADS"."Feature_96" AS "Feature_96", "ADS"."Feature_97" AS "Feature_97", "ADS"."Feature_98" AS "Feature_98", "ADS"."Feature_99" AS "Feature_99" 
FROM "BinaryClass_100" AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9", keras_input."Feature_10" AS "Feature_10", keras_input."Feature_11" AS "Feature_11", keras_input."Feature_12" AS "Feature_12", keras_input."Feature_13" AS "Feature_13", keras_input."Feature_14" AS "Feature_14", keras_input."Feature_15" AS "Feature_15", keras_input."Feature_16" AS "Feature_16", keras_input."Feature_17" AS "Feature_17", keras_input."Feature_18" AS "Feature_18", keras_input."Feature_19" AS "Feature_19", keras_input."Feature_20" AS "Feature_20", keras_input."Feature_21" AS "Feature_21", keras_input."Feature_22" AS "Feature_22", keras_input."Feature_23" AS "Feature_23", keras_input."Feature_24" AS "Feature_24", keras_input."Feature_25" AS "Feature_25", keras_input."Feature_26" AS "Feature_26", keras_input."Feature_27" AS "Feature_27", keras_input."Feature_28" AS "Feature_28", keras_input."Feature_29" AS "Feature_29", keras_input."Feature_30" AS "Feature_30", keras_input."Feature_31" AS "Feature_31", keras_input."Feature_32" AS "Feature_32", keras_input."Feature_33" AS "Feature_33", keras_input."Feature_34" AS "Feature_34", keras_input."Feature_35" AS "Feature_35", keras_input."Feature_36" AS "Feature_36", keras_input."Feature_37" AS "Feature_37", keras_input."Feature_38" AS "Feature_38", keras_input."Feature_39" AS "Feature_39", keras_input."Feature_40" AS "Feature_40", keras_input."Feature_41" AS "Feature_41", keras_input."Feature_42" AS "Feature_42", keras_input."Feature_43" AS "Feature_43", keras_input."Feature_44" AS "Feature_44", keras_input."Feature_45" AS "Feature_45", keras_input."Feature_46" AS "Feature_46", keras_input."Feature_47" AS "Feature_47", keras_input."Feature_48" AS "Feature_48", keras_input."Feature_49" AS "Feature_49", keras_input."Feature_50" AS "Feature_50", keras_input."Feature_51" AS "Feature_51", keras_input."Feature_52" AS "Feature_52", keras_input."Feature_53" AS "Feature_53", keras_input."Feature_54" AS "Feature_54", keras_input."Feature_55" AS "Feature_55", keras_input."Feature_56" AS "Feature_56", keras_input."Feature_57" AS "Feature_57", keras_input."Feature_58" AS "Feature_58", keras_input."Feature_59" AS "Feature_59", keras_input."Feature_60" AS "Feature_60", keras_input."Feature_61" AS "Feature_61", keras_input."Feature_62" AS "Feature_62", keras_input."Feature_63" AS "Feature_63", keras_input."Feature_64" AS "Feature_64", keras_input."Feature_65" AS "Feature_65", keras_input."Feature_66" AS "Feature_66", keras_input."Feature_67" AS "Feature_67", keras_input."Feature_68" AS "Feature_68", keras_input."Feature_69" AS "Feature_69", keras_input."Feature_70" AS "Feature_70", keras_input."Feature_71" AS "Feature_71", keras_input."Feature_72" AS "Feature_72", keras_input."Feature_73" AS "Feature_73", keras_input."Feature_74" AS "Feature_74", keras_input."Feature_75" AS "Feature_75", keras_input."Feature_76" AS "Feature_76", keras_input."Feature_77" AS "Feature_77", keras_input."Feature_78" AS "Feature_78", keras_input."Feature_79" AS "Feature_79", keras_input."Feature_80" AS "Feature_80", keras_input."Feature_81" AS "Feature_81", keras_input."Feature_82" AS "Feature_82", keras_input."Feature_83" AS "Feature_83", keras_input."Feature_84" AS "Feature_84", keras_input."Feature_85" AS "Feature_85", keras_input."Feature_86" AS "Feature_86", keras_input."Feature_87" AS "Feature_87", keras_input."Feature_88" AS "Feature_88", keras_input."Feature_89" AS "Feature_89", keras_input."Feature_90" AS "Feature_90", keras_input."Feature_91" AS "Feature_91", keras_input."Feature_92" AS "Feature_92", keras_input."Feature_93" AS "Feature_93", keras_input."Feature_94" AS "Feature_94", keras_input."Feature_95" AS "Feature_95", keras_input."Feature_96" AS "Feature_96", keras_input."Feature_97" AS "Feature_97", keras_input."Feature_98" AS "Feature_98", keras_input."Feature_99" AS "Feature_99" 
FROM keras_input), 
layer_dense_1 AS 
(SELECT keras_input_1."KEY" AS "KEY", -0.0979265482713089 + -0.08828730859159105 * keras_input_1."Feature_0" + -0.13778846491314523 * keras_input_1."Feature_1" + -0.24638045873653483 * keras_input_1."Feature_2" + 0.039493014957310564 * keras_input_1."Feature_3" + -0.029467832516076896 * keras_input_1."Feature_4" + -0.2582286223562999 * keras_input_1."Feature_5" + -0.0019750211283869395 * keras_input_1."Feature_6" + -0.19653574570406726 * keras_input_1."Feature_7" + 0.08329051793151579 * keras_input_1."Feature_8" + -0.018935625584785287 * keras_input_1."Feature_9" + -0.12895344140072626 * keras_input_1."Feature_10" + -0.16222674946463012 * keras_input_1."Feature_11" + 0.21172443251403508 * keras_input_1."Feature_12" + -0.09786515219502899 * keras_input_1."Feature_13" + 0.04152666094636009 * keras_input_1."Feature_14" + -0.03371378789460487 * keras_input_1."Feature_15" + 0.13314292584170637 * keras_input_1."Feature_16" + 0.12551600045779499 * keras_input_1."Feature_17" + -0.05537728995200136 * keras_input_1."Feature_18" + -0.04148712286979826 * keras_input_1."Feature_19" + -0.049262567614574586 * keras_input_1."Feature_20" + 0.10048830599192156 * keras_input_1."Feature_21" + -0.060978508052152235 * keras_input_1."Feature_22" + -0.17520093736761122 * keras_input_1."Feature_23" + 0.1057896688568864 * keras_input_1."Feature_24" + -0.058055582827513275 * keras_input_1."Feature_25" + 0.1188493858530525 * keras_input_1."Feature_26" + -0.02645714018078347 * keras_input_1."Feature_27" + 0.10561769011573247 * keras_input_1."Feature_28" + 0.07552228030701928 * keras_input_1."Feature_29" + 0.032020865688448655 * keras_input_1."Feature_30" + 0.06378990372222772 * keras_input_1."Feature_31" + 0.19173531407621128 * keras_input_1."Feature_32" + 0.09572350704482856 * keras_input_1."Feature_33" + 0.17119330273381922 * keras_input_1."Feature_34" + 0.03753601433215274 * keras_input_1."Feature_35" + 0.09461140692989901 * keras_input_1."Feature_36" + 0.1563965751899153 * keras_input_1."Feature_37" + 0.02602161737452034 * keras_input_1."Feature_38" + 0.12701480150181524 * keras_input_1."Feature_39" + 0.08722927175283689 * keras_input_1."Feature_40" + -0.128333735444248 * keras_input_1."Feature_41" + -0.17342843451459422 * keras_input_1."Feature_42" + 0.05888739059024448 * keras_input_1."Feature_43" + -0.13377525155854667 * keras_input_1."Feature_44" + -0.02005052106536002 * keras_input_1."Feature_45" + 0.07160392678908636 * keras_input_1."Feature_46" + -0.00923027943172263 * keras_input_1."Feature_47" + 0.2391678377349525 * keras_input_1."Feature_48" + 0.11560371483127763 * keras_input_1."Feature_49" + -0.11217062767474709 * keras_input_1."Feature_50" + 0.127382036646825 * keras_input_1."Feature_51" + -0.13451517246931727 * keras_input_1."Feature_52" + 0.03464494394258329 * keras_input_1."Feature_53" + -0.17355355043429793 * keras_input_1."Feature_54" + 0.217528736256228 * keras_input_1."Feature_55" + -0.0996507917594869 * keras_input_1."Feature_56" + -0.21848097044891976 * keras_input_1."Feature_57" + -0.07744551008582785 * keras_input_1."Feature_58" + -0.15000941911972523 * keras_input_1."Feature_59" + -0.016397240600660494 * keras_input_1."Feature_60" + 0.009541997245799233 * keras_input_1."Feature_61" + 0.08065545528104197 * keras_input_1."Feature_62" + -0.18342893695569118 * keras_input_1."Feature_63" + 0.1536381946853831 * keras_input_1."Feature_64" + -0.1950255560506814 * keras_input_1."Feature_65" + -0.21009513023852092 * keras_input_1."Feature_66" + 0.06836837470119211 * keras_input_1."Feature_67" + 0.18745994170917488 * keras_input_1."Feature_68" + 0.2510868351140825 * keras_input_1."Feature_69" + -0.11438749705358331 * keras_input_1."Feature_70" + 0.020991937058229694 * keras_input_1."Feature_71" + 0.18554068805388188 * keras_input_1."Feature_72" + 0.18252923962981493 * keras_input_1."Feature_73" + 0.16964049152744504 * keras_input_1."Feature_74" + 0.12303908256205864 * keras_input_1."Feature_75" + 0.004870852923971179 * keras_input_1."Feature_76" + 0.011087624304311589 * keras_input_1."Feature_77" + -0.06747667691928304 * keras_input_1."Feature_78" + -0.16111872945576886 * keras_input_1."Feature_79" + 0.1148276542872133 * keras_input_1."Feature_80" + -0.16357223354556755 * keras_input_1."Feature_81" + 0.0452367378076284 * keras_input_1."Feature_82" + -0.23168382311858401 * keras_input_1."Feature_83" + 0.1104570818349898 * keras_input_1."Feature_84" + -0.023178725707217306 * keras_input_1."Feature_85" + -0.11342674612348883 * keras_input_1."Feature_86" + -0.004018216630801359 * keras_input_1."Feature_87" + 0.12703144808516648 * keras_input_1."Feature_88" + 0.12505881543070588 * keras_input_1."Feature_89" + -0.07222513338979665 * keras_input_1."Feature_90" + -0.13873804250380056 * keras_input_1."Feature_91" + 0.0500121861070411 * keras_input_1."Feature_92" + 0.012694336695148365 * keras_input_1."Feature_93" + 0.22676905464306174 * keras_input_1."Feature_94" + 0.08038974899226517 * keras_input_1."Feature_95" + -0.04917336668373293 * keras_input_1."Feature_96" + -0.17415111850290166 * keras_input_1."Feature_97" + 0.15761009551515567 * keras_input_1."Feature_98" + 0.16020869161920434 * keras_input_1."Feature_99" AS output_1, 0.13479118112534366 + 0.07201981460319448 * keras_input_1."Feature_0" + 0.19279620203743822 * keras_input_1."Feature_1" + 0.15234479910741067 * keras_input_1."Feature_2" + 0.19794702746109566 * keras_input_1."Feature_3" + 0.49154520381732897 * keras_input_1."Feature_4" + -0.14905625534779673 * keras_input_1."Feature_5" + 0.08811284779577616 * keras_input_1."Feature_6" + 0.2934955842476643 * keras_input_1."Feature_7" + -0.1655080396743574 * keras_input_1."Feature_8" + -0.07538473891151695 * keras_input_1."Feature_9" + 0.1274001252856735 * keras_input_1."Feature_10" + 0.0630095071706498 * keras_input_1."Feature_11" + -0.10491562677108841 * keras_input_1."Feature_12" + 0.044895260340090976 * keras_input_1."Feature_13" + 0.19934597873263868 * keras_input_1."Feature_14" + 0.3112158453717577 * keras_input_1."Feature_15" + 0.12601763591333295 * keras_input_1."Feature_16" + 0.2083222318399546 * keras_input_1."Feature_17" + 0.09959366120513634 * keras_input_1."Feature_18" + -0.27291734201040757 * keras_input_1."Feature_19" + -0.010444413549676937 * keras_input_1."Feature_20" + -0.11005840368544219 * keras_input_1."Feature_21" + 0.049170096654446604 * keras_input_1."Feature_22" + -0.12839500035157062 * keras_input_1."Feature_23" + -0.015439335777550675 * keras_input_1."Feature_24" + 0.014387157228855588 * keras_input_1."Feature_25" + 0.19414170498465094 * keras_input_1."Feature_26" + 0.06257301380781893 * keras_input_1."Feature_27" + -0.025333833110093008 * keras_input_1."Feature_28" + -0.187821040808702 * keras_input_1."Feature_29" + -0.25764907648009255 * keras_input_1."Feature_30" + 0.052130782550758537 * keras_input_1."Feature_31" + -0.18672335355118577 * keras_input_1."Feature_32" + 0.35683188744641964 * keras_input_1."Feature_33" + 0.2902457428460994 * keras_input_1."Feature_34" + -0.051854351709816636 * keras_input_1."Feature_35" + -0.2057879530280667 * keras_input_1."Feature_36" + -0.1341308817913077 * keras_input_1."Feature_37" + -0.15223512895162372 * keras_input_1."Feature_38" + 0.030339158441274685 * keras_input_1."Feature_39" + -0.07234630119251038 * keras_input_1."Feature_40" + 0.2141279689499294 * keras_input_1."Feature_41" + -0.06156158774286687 * keras_input_1."Feature_42" + 0.03277249047110067 * keras_input_1."Feature_43" + 0.16576341073286363 * keras_input_1."Feature_44" + 0.055256828250254734 * keras_input_1."Feature_45" + -0.03151371317291523 * keras_input_1."Feature_46" + 0.12551464025524417 * keras_input_1."Feature_47" + 0.35706920583438895 * keras_input_1."Feature_48" + 0.25796862880999943 * keras_input_1."Feature_49" + 0.030621803939160395 * keras_input_1."Feature_50" + -0.14689521332613498 * keras_input_1."Feature_51" + 0.05204538498874936 * keras_input_1."Feature_52" + 0.10884999345079185 * keras_input_1."Feature_53" + 0.06185684258245261 * keras_input_1."Feature_54" + -0.018263736814925012 * keras_input_1."Feature_55" + 0.06482657188299133 * keras_input_1."Feature_56" + -0.3404072403155031 * keras_input_1."Feature_57" + -0.025554044180358938 * keras_input_1."Feature_58" + 0.027753803328677464 * keras_input_1."Feature_59" + 0.07335641521289368 * keras_input_1."Feature_60" + 0.13575633344384772 * keras_input_1."Feature_61" + 0.01638081556360511 * keras_input_1."Feature_62" + -0.20533689385244708 * keras_input_1."Feature_63" + 0.09260191257214374 * keras_input_1."Feature_64" + -0.06590802012575038 * keras_input_1."Feature_65" + -0.05462929026289463 * keras_input_1."Feature_66" + -0.16560286071211608 * keras_input_1."Feature_67" + -0.271084548677703 * keras_input_1."Feature_68" + 0.03546218530390979 * keras_input_1."Feature_69" + -0.15765908024892714 * keras_input_1."Feature_70" + -0.09324022591061974 * keras_input_1."Feature_71" + -0.1763961268402935 * keras_input_1."Feature_72" + -0.014278258523184009 * keras_input_1."Feature_73" + -0.02822305713135196 * keras_input_1."Feature_74" + -0.022856460346415294 * keras_input_1."Feature_75" + -0.0254527563305671 * keras_input_1."Feature_76" + 0.5775412162994172 * keras_input_1."Feature_77" + 0.2153967394426759 * keras_input_1."Feature_78" + -0.017538262687750727 * keras_input_1."Feature_79" + -0.08190039987206293 * keras_input_1."Feature_80" + 0.09907099590330534 * keras_input_1."Feature_81" + 0.09234539119193602 * keras_input_1."Feature_82" + -0.3127288589080238 * keras_input_1."Feature_83" + 0.047340220025913725 * keras_input_1."Feature_84" + 0.2674292313045201 * keras_input_1."Feature_85" + -0.004184149615550451 * keras_input_1."Feature_86" + -0.3125911105340726 * keras_input_1."Feature_87" + -0.020536238199064014 * keras_input_1."Feature_88" + 0.19226329753599325 * keras_input_1."Feature_89" + 0.06791006429472043 * keras_input_1."Feature_90" + -0.23436428340310964 * keras_input_1."Feature_91" + 0.18465698105766698 * keras_input_1."Feature_92" + 0.2001050447792587 * keras_input_1."Feature_93" + -0.022165949334677144 * keras_input_1."Feature_94" + 0.3743822456034591 * keras_input_1."Feature_95" + -0.03637179272400893 * keras_input_1."Feature_96" + 0.11536505769714532 * keras_input_1."Feature_97" + 0.15959974238931454 * keras_input_1."Feature_98" + 0.05562165345203545 * keras_input_1."Feature_99" AS output_2, -0.009406487058779878 + -0.04723446811295121 * keras_input_1."Feature_0" + 0.10031257477165108 * keras_input_1."Feature_1" + -0.201310066875197 * keras_input_1."Feature_2" + -0.21714751895938633 * keras_input_1."Feature_3" + -0.07809015342477699 * keras_input_1."Feature_4" + 0.1178868112562736 * keras_input_1."Feature_5" + -0.11105762680874157 * keras_input_1."Feature_6" + 0.03705830070501803 * keras_input_1."Feature_7" + 0.0011694789765825805 * keras_input_1."Feature_8" + 0.031752624835874405 * keras_input_1."Feature_9" + 0.19496958919988921 * keras_input_1."Feature_10" + -0.16536930443244016 * keras_input_1."Feature_11" + 0.10143329372268962 * keras_input_1."Feature_12" + -0.0231691211769941 * keras_input_1."Feature_13" + -0.11118691290262837 * keras_input_1."Feature_14" + -0.004654165140151418 * keras_input_1."Feature_15" + 0.0034540458021870154 * keras_input_1."Feature_16" + -0.16322347598622455 * keras_input_1."Feature_17" + 0.02277495082535037 * keras_input_1."Feature_18" + -0.15193959882362232 * keras_input_1."Feature_19" + 0.2292717988252878 * keras_input_1."Feature_20" + -0.24497824059374823 * keras_input_1."Feature_21" + -0.019775492363594778 * keras_input_1."Feature_22" + -0.21795384521368372 * keras_input_1."Feature_23" + -0.07765055392622193 * keras_input_1."Feature_24" + -0.04821274919219225 * keras_input_1."Feature_25" + 0.028703443394579184 * keras_input_1."Feature_26" + 0.01109450891828413 * keras_input_1."Feature_27" + 0.16294879388151892 * keras_input_1."Feature_28" + 0.10617754444146302 * keras_input_1."Feature_29" + -0.0035045661882565685 * keras_input_1."Feature_30" + -0.20088434852045114 * keras_input_1."Feature_31" + 0.12770212939524603 * keras_input_1."Feature_32" + -0.09963005392170149 * keras_input_1."Feature_33" + -0.19568296758669804 * keras_input_1."Feature_34" + -0.1270417552941609 * keras_input_1."Feature_35" + 0.07549056762698267 * keras_input_1."Feature_36" + 0.07335241809948473 * keras_input_1."Feature_37" + -0.02171400564890277 * keras_input_1."Feature_38" + -0.07043771205876431 * keras_input_1."Feature_39" + -0.009061309906501235 * keras_input_1."Feature_40" + -0.08555643057976248 * keras_input_1."Feature_41" + 0.04883598401115924 * keras_input_1."Feature_42" + -0.1852667832778563 * keras_input_1."Feature_43" + -0.2556719777608526 * keras_input_1."Feature_44" + 0.1991553192885336 * keras_input_1."Feature_45" + 0.2202815564034439 * keras_input_1."Feature_46" + 0.1230247029242056 * keras_input_1."Feature_47" + 0.1434515379574277 * keras_input_1."Feature_48" + 0.1390814187343737 * keras_input_1."Feature_49" + -0.16378444501923173 * keras_input_1."Feature_50" + 0.1196589859210289 * keras_input_1."Feature_51" + 0.14452230920579956 * keras_input_1."Feature_52" + 0.07783189245274545 * keras_input_1."Feature_53" + -0.043715904390582 * keras_input_1."Feature_54" + 0.09086952634093089 * keras_input_1."Feature_55" + 0.17616789475105352 * keras_input_1."Feature_56" + 0.312901655360007 * keras_input_1."Feature_57" + 0.24670151346091412 * keras_input_1."Feature_58" + 0.15182371183089985 * keras_input_1."Feature_59" + -0.1641548029054386 * keras_input_1."Feature_60" + 0.052579891491584374 * keras_input_1."Feature_61" + 0.09550151081235936 * keras_input_1."Feature_62" + 0.09884666802591471 * keras_input_1."Feature_63" + 0.03894521172976749 * keras_input_1."Feature_64" + -0.16642522497611173 * keras_input_1."Feature_65" + 0.235631842501722 * keras_input_1."Feature_66" + 0.24717640174909405 * keras_input_1."Feature_67" + 0.05932434299405518 * keras_input_1."Feature_68" + -0.15630024000040957 * keras_input_1."Feature_69" + 0.18313228248448002 * keras_input_1."Feature_70" + -0.22404389266385083 * keras_input_1."Feature_71" + 0.18980488757998706 * keras_input_1."Feature_72" + -0.054181313935293525 * keras_input_1."Feature_73" + 0.13159461154518576 * keras_input_1."Feature_74" + 0.10994772648543336 * keras_input_1."Feature_75" + 0.2346073602576713 * keras_input_1."Feature_76" + -0.09095345378082685 * keras_input_1."Feature_77" + -0.014532178860990822 * keras_input_1."Feature_78" + -0.040429022204129986 * keras_input_1."Feature_79" + -0.1869772032746958 * keras_input_1."Feature_80" + 0.1125353374139901 * keras_input_1."Feature_81" + 0.21260358538266796 * keras_input_1."Feature_82" + -0.18809058485019184 * keras_input_1."Feature_83" + 0.11115529561048793 * keras_input_1."Feature_84" + 0.08544115933404063 * keras_input_1."Feature_85" + -0.04176102202773575 * keras_input_1."Feature_86" + 0.10610638679020164 * keras_input_1."Feature_87" + 0.061021152624367664 * keras_input_1."Feature_88" + 0.2253378826674849 * keras_input_1."Feature_89" + -0.0219587849932473 * keras_input_1."Feature_90" + 0.09292712749600064 * keras_input_1."Feature_91" + 0.207332422994341 * keras_input_1."Feature_92" + -0.041618132442625536 * keras_input_1."Feature_93" + 0.11759440886879145 * keras_input_1."Feature_94" + -0.0857679171308415 * keras_input_1."Feature_95" + -0.11048958818116193 * keras_input_1."Feature_96" + -0.20092770416254507 * keras_input_1."Feature_97" + 0.2682694143730387 * keras_input_1."Feature_98" + -0.037743811370434796 * keras_input_1."Feature_99" AS output_3, 0.1416877329037282 + -0.11666138422107836 * keras_input_1."Feature_0" + 0.01518576762869794 * keras_input_1."Feature_1" + -0.10556838305320208 * keras_input_1."Feature_2" + -0.1371117296143526 * keras_input_1."Feature_3" + 0.612157269851292 * keras_input_1."Feature_4" + -0.11654677000335835 * keras_input_1."Feature_5" + 0.20740631586265482 * keras_input_1."Feature_6" + 0.18674467648917317 * keras_input_1."Feature_7" + 0.05238288062921506 * keras_input_1."Feature_8" + -0.15910562621305777 * keras_input_1."Feature_9" + 0.10289129974211918 * keras_input_1."Feature_10" + 0.2083874435217199 * keras_input_1."Feature_11" + -0.10463401843293567 * keras_input_1."Feature_12" + 0.04712576161623209 * keras_input_1."Feature_13" + 0.18679549020440306 * keras_input_1."Feature_14" + 0.2152880476369186 * keras_input_1."Feature_15" + 0.12378394884718874 * keras_input_1."Feature_16" + -0.2889604126558946 * keras_input_1."Feature_17" + 0.25017245014877243 * keras_input_1."Feature_18" + 0.1667481188906703 * keras_input_1."Feature_19" + -0.1621581474783198 * keras_input_1."Feature_20" + 0.20792124735406856 * keras_input_1."Feature_21" + -0.10965156504022104 * keras_input_1."Feature_22" + 0.11452242575190966 * keras_input_1."Feature_23" + -0.010885897271424538 * keras_input_1."Feature_24" + -0.049963453886442716 * keras_input_1."Feature_25" + 0.2995370009711365 * keras_input_1."Feature_26" + 0.2253331410990531 * keras_input_1."Feature_27" + 0.01118421958534053 * keras_input_1."Feature_28" + -0.2456914596484767 * keras_input_1."Feature_29" + -0.23284152027573582 * keras_input_1."Feature_30" + 0.23303959395317905 * keras_input_1."Feature_31" + 0.1265578204264231 * keras_input_1."Feature_32" + 0.0953112129521479 * keras_input_1."Feature_33" + 0.07695376306568091 * keras_input_1."Feature_34" + 0.03741093919252787 * keras_input_1."Feature_35" + 0.09366471306940516 * keras_input_1."Feature_36" + 0.06663573379135468 * keras_input_1."Feature_37" + 0.3229130453898707 * keras_input_1."Feature_38" + 0.2702469149714271 * keras_input_1."Feature_39" + 0.03306727645929034 * keras_input_1."Feature_40" + 0.19049755969106688 * keras_input_1."Feature_41" + 0.13996932259189945 * keras_input_1."Feature_42" + 0.05005306786085429 * keras_input_1."Feature_43" + 0.27342248393732194 * keras_input_1."Feature_44" + 0.13663821466343298 * keras_input_1."Feature_45" + -0.11955989027134849 * keras_input_1."Feature_46" + -0.05939268017850056 * keras_input_1."Feature_47" + 0.26082972901994617 * keras_input_1."Feature_48" + -0.04908633820393594 * keras_input_1."Feature_49" + 0.0991514273307885 * keras_input_1."Feature_50" + -0.017724760785199238 * keras_input_1."Feature_51" + -0.05744829493464676 * keras_input_1."Feature_52" + -0.29708970365958737 * keras_input_1."Feature_53" + 0.16724591951176046 * keras_input_1."Feature_54" + 0.25706615748281225 * keras_input_1."Feature_55" + -0.20747195800481205 * keras_input_1."Feature_56" + -0.612822547596337 * keras_input_1."Feature_57" + 0.05817611536404657 * keras_input_1."Feature_58" + -0.04341729390852159 * keras_input_1."Feature_59" + -0.03794964434930549 * keras_input_1."Feature_60" + 0.019290551870900872 * keras_input_1."Feature_61" + -0.018243314297446387 * keras_input_1."Feature_62" + -0.23462578369044762 * keras_input_1."Feature_63" + 0.13628307257248942 * keras_input_1."Feature_64" + -0.20983264436436086 * keras_input_1."Feature_65" + 0.2614131772714239 * keras_input_1."Feature_66" + 0.1290388710343544 * keras_input_1."Feature_67" + 0.06952895903132812 * keras_input_1."Feature_68" + 0.11917348481141464 * keras_input_1."Feature_69" + -0.044593344565270594 * keras_input_1."Feature_70" + -0.045151361890485575 * keras_input_1."Feature_71" + 0.21294814490815772 * keras_input_1."Feature_72" + 0.12199452364274976 * keras_input_1."Feature_73" + 0.1796673493103774 * keras_input_1."Feature_74" + -0.058671034725829664 * keras_input_1."Feature_75" + 0.02250965882840278 * keras_input_1."Feature_76" + 0.4678174085983243 * keras_input_1."Feature_77" + -0.23082324573413435 * keras_input_1."Feature_78" + 0.04238033474553313 * keras_input_1."Feature_79" + -0.08422281908820181 * keras_input_1."Feature_80" + -0.03070828710937498 * keras_input_1."Feature_81" + 0.019091304948923637 * keras_input_1."Feature_82" + 0.09640543170755422 * keras_input_1."Feature_83" + 0.2541912212551621 * keras_input_1."Feature_84" + 0.15706103024781837 * keras_input_1."Feature_85" + -0.09161297357557949 * keras_input_1."Feature_86" + -0.20035640009334899 * keras_input_1."Feature_87" + 0.07336355354007287 * keras_input_1."Feature_88" + 0.010035790174971401 * keras_input_1."Feature_89" + 0.2606157359645231 * keras_input_1."Feature_90" + -0.03687134826560974 * keras_input_1."Feature_91" + -0.002647311681046578 * keras_input_1."Feature_92" + 0.03683776565235584 * keras_input_1."Feature_93" + 0.17567937784626486 * keras_input_1."Feature_94" + 0.023811003290525566 * keras_input_1."Feature_95" + 0.1404919771406454 * keras_input_1."Feature_96" + 0.20268140604809115 * keras_input_1."Feature_97" + 0.012445048566778317 * keras_input_1."Feature_98" + -0.1211678683803383 * keras_input_1."Feature_99" AS output_4 
FROM keras_input_1), 
activation_relu AS 
(SELECT layer_dense_1."KEY" AS "KEY", max(layer_dense_1.output_1, 0) AS output_1, max(layer_dense_1.output_2, 0) AS output_2, max(layer_dense_1.output_3, 0) AS output_3, max(layer_dense_1.output_4, 0) AS output_4 
FROM layer_dense_1), 
activation_relu_1 AS 
(SELECT activation_relu."KEY" AS "KEY", activation_relu.output_1 AS output_1, activation_relu.output_2 AS output_2, activation_relu.output_3 AS output_3, activation_relu.output_4 AS output_4 
FROM activation_relu), 
activation_relu_1_1 AS 
(SELECT activation_relu_1."KEY" AS "KEY", activation_relu_1.output_1 AS output_1, activation_relu_1.output_2 AS output_2, activation_relu_1.output_3 AS output_3, activation_relu_1.output_4 AS output_4 
FROM activation_relu_1), 
layer_dense_2 AS 
(SELECT activation_relu_1_1."KEY" AS "KEY", -0.010968237888542814 + 0.5665721509746032 * activation_relu_1_1.output_1 + -0.39564631747672097 * activation_relu_1_1.output_2 + -0.3713089240897452 * activation_relu_1_1.output_3 + 0.8010147631344616 * activation_relu_1_1.output_4 AS output_1, 0.010968237888542827 + -0.7027744585468486 * activation_relu_1_1.output_1 + -0.7739851429952218 * activation_relu_1_1.output_2 + 0.9256590301406804 * activation_relu_1_1.output_3 + 0.4765286323924847 * activation_relu_1_1.output_4 AS output_2 
FROM activation_relu_1_1), 
layer_dense_2_1 AS 
(SELECT layer_dense_2."KEY" AS "KEY", layer_dense_2.output_1 AS output_1, layer_dense_2.output_2 AS output_2 
FROM layer_dense_2), 
score_soft_max_step1 AS 
(SELECT layer_dense_2_1."KEY" AS "KEY", layer_dense_2_1.output_1 AS "Score_0", exp(min(100.0, max(-100.0, layer_dense_2_1.output_1))) AS "exp_Score_0", layer_dense_2_1.output_2 AS "Score_1", exp(min(100.0, max(-100.0, layer_dense_2_1.output_2))) AS "exp_Score_1" 
FROM layer_dense_2_1), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_Score" AS "exp_Score" 
FROM (SELECT score_soft_max_step1."KEY" AS "KEY", 0 AS class, score_soft_max_step1."exp_Score_0" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 1 AS class, score_soft_max_step1."exp_Score_1" AS "exp_Score" 
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1."KEY" AS "KEY", score_soft_max_step1."Score_0" AS "Score_0", score_soft_max_step1."exp_Score_0" AS "exp_Score_0", score_soft_max_step1."Score_1" AS "Score_1", score_soft_max_step1."exp_Score_1" AS "exp_Score_1", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpScore" AS "sum_ExpScore" 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_Score") AS "sum_ExpScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_step1."KEY" = sum_exp_t."KEY_sum"), 
layer_softmax AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."exp_Score_0" / score_soft_max."sum_ExpScore" AS output_1, score_soft_max."exp_Score_1" / score_soft_max."sum_ExpScore" AS output_2 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", layer_softmax.output_1 AS "Proba_0", layer_softmax.output_2 AS "Proba_1", CAST(NULL AS FLOAT) AS "LogProba_0", CAST(NULL AS FLOAT) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte