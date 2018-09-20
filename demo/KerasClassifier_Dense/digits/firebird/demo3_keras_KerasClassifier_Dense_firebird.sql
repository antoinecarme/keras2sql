-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_Dense
-- Dataset : digits
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9", "ADS"."Feature_10" AS "Feature_10", "ADS"."Feature_11" AS "Feature_11", "ADS"."Feature_12" AS "Feature_12", "ADS"."Feature_13" AS "Feature_13", "ADS"."Feature_14" AS "Feature_14", "ADS"."Feature_15" AS "Feature_15", "ADS"."Feature_16" AS "Feature_16", "ADS"."Feature_17" AS "Feature_17", "ADS"."Feature_18" AS "Feature_18", "ADS"."Feature_19" AS "Feature_19", "ADS"."Feature_20" AS "Feature_20", "ADS"."Feature_21" AS "Feature_21", "ADS"."Feature_22" AS "Feature_22", "ADS"."Feature_23" AS "Feature_23", "ADS"."Feature_24" AS "Feature_24", "ADS"."Feature_25" AS "Feature_25", "ADS"."Feature_26" AS "Feature_26", "ADS"."Feature_27" AS "Feature_27", "ADS"."Feature_28" AS "Feature_28", "ADS"."Feature_29" AS "Feature_29", "ADS"."Feature_30" AS "Feature_30", "ADS"."Feature_31" AS "Feature_31", "ADS"."Feature_32" AS "Feature_32", "ADS"."Feature_33" AS "Feature_33", "ADS"."Feature_34" AS "Feature_34", "ADS"."Feature_35" AS "Feature_35", "ADS"."Feature_36" AS "Feature_36", "ADS"."Feature_37" AS "Feature_37", "ADS"."Feature_38" AS "Feature_38", "ADS"."Feature_39" AS "Feature_39", "ADS"."Feature_40" AS "Feature_40", "ADS"."Feature_41" AS "Feature_41", "ADS"."Feature_42" AS "Feature_42", "ADS"."Feature_43" AS "Feature_43", "ADS"."Feature_44" AS "Feature_44", "ADS"."Feature_45" AS "Feature_45", "ADS"."Feature_46" AS "Feature_46", "ADS"."Feature_47" AS "Feature_47", "ADS"."Feature_48" AS "Feature_48", "ADS"."Feature_49" AS "Feature_49", "ADS"."Feature_50" AS "Feature_50", "ADS"."Feature_51" AS "Feature_51", "ADS"."Feature_52" AS "Feature_52", "ADS"."Feature_53" AS "Feature_53", "ADS"."Feature_54" AS "Feature_54", "ADS"."Feature_55" AS "Feature_55", "ADS"."Feature_56" AS "Feature_56", "ADS"."Feature_57" AS "Feature_57", "ADS"."Feature_58" AS "Feature_58", "ADS"."Feature_59" AS "Feature_59", "ADS"."Feature_60" AS "Feature_60", "ADS"."Feature_61" AS "Feature_61", "ADS"."Feature_62" AS "Feature_62", "ADS"."Feature_63" AS "Feature_63" 
FROM digits AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9", keras_input."Feature_10" AS "Feature_10", keras_input."Feature_11" AS "Feature_11", keras_input."Feature_12" AS "Feature_12", keras_input."Feature_13" AS "Feature_13", keras_input."Feature_14" AS "Feature_14", keras_input."Feature_15" AS "Feature_15", keras_input."Feature_16" AS "Feature_16", keras_input."Feature_17" AS "Feature_17", keras_input."Feature_18" AS "Feature_18", keras_input."Feature_19" AS "Feature_19", keras_input."Feature_20" AS "Feature_20", keras_input."Feature_21" AS "Feature_21", keras_input."Feature_22" AS "Feature_22", keras_input."Feature_23" AS "Feature_23", keras_input."Feature_24" AS "Feature_24", keras_input."Feature_25" AS "Feature_25", keras_input."Feature_26" AS "Feature_26", keras_input."Feature_27" AS "Feature_27", keras_input."Feature_28" AS "Feature_28", keras_input."Feature_29" AS "Feature_29", keras_input."Feature_30" AS "Feature_30", keras_input."Feature_31" AS "Feature_31", keras_input."Feature_32" AS "Feature_32", keras_input."Feature_33" AS "Feature_33", keras_input."Feature_34" AS "Feature_34", keras_input."Feature_35" AS "Feature_35", keras_input."Feature_36" AS "Feature_36", keras_input."Feature_37" AS "Feature_37", keras_input."Feature_38" AS "Feature_38", keras_input."Feature_39" AS "Feature_39", keras_input."Feature_40" AS "Feature_40", keras_input."Feature_41" AS "Feature_41", keras_input."Feature_42" AS "Feature_42", keras_input."Feature_43" AS "Feature_43", keras_input."Feature_44" AS "Feature_44", keras_input."Feature_45" AS "Feature_45", keras_input."Feature_46" AS "Feature_46", keras_input."Feature_47" AS "Feature_47", keras_input."Feature_48" AS "Feature_48", keras_input."Feature_49" AS "Feature_49", keras_input."Feature_50" AS "Feature_50", keras_input."Feature_51" AS "Feature_51", keras_input."Feature_52" AS "Feature_52", keras_input."Feature_53" AS "Feature_53", keras_input."Feature_54" AS "Feature_54", keras_input."Feature_55" AS "Feature_55", keras_input."Feature_56" AS "Feature_56", keras_input."Feature_57" AS "Feature_57", keras_input."Feature_58" AS "Feature_58", keras_input."Feature_59" AS "Feature_59", keras_input."Feature_60" AS "Feature_60", keras_input."Feature_61" AS "Feature_61", keras_input."Feature_62" AS "Feature_62", keras_input."Feature_63" AS "Feature_63" 
FROM keras_input), 
layer_dense_1 AS 
(SELECT keras_input_1."KEY" AS "KEY", -0.025431171425767507 + -0.03869503695492704 * keras_input_1."Feature_0" + -0.30855157728452787 * keras_input_1."Feature_1" + -0.3770954040335961 * keras_input_1."Feature_2" + -0.046365164169682456 * keras_input_1."Feature_3" + -0.10145892248975913 * keras_input_1."Feature_4" + -0.21701184024867456 * keras_input_1."Feature_5" + -0.1848113578232122 * keras_input_1."Feature_6" + -0.2043906202304861 * keras_input_1."Feature_7" + 0.13048432446643554 * keras_input_1."Feature_8" + -0.2876621526530844 * keras_input_1."Feature_9" + -0.24656191957919654 * keras_input_1."Feature_10" + -0.15476785324986025 * keras_input_1."Feature_11" + 0.09935943411128155 * keras_input_1."Feature_12" + -0.41844483726490783 * keras_input_1."Feature_13" + -0.0003898895102811497 * keras_input_1."Feature_14" + -0.08255251348751032 * keras_input_1."Feature_15" + 0.23461398453788546 * keras_input_1."Feature_16" + -0.08187450225001114 * keras_input_1."Feature_17" + 0.09849106369092361 * keras_input_1."Feature_18" + -0.11915728922469394 * keras_input_1."Feature_19" + -0.3987145328172845 * keras_input_1."Feature_20" + -0.1204785878746041 * keras_input_1."Feature_21" + 0.034100939886894666 * keras_input_1."Feature_22" + 0.0650806261618958 * keras_input_1."Feature_23" + 0.08141154419395796 * keras_input_1."Feature_24" + 0.05124006044002384 * keras_input_1."Feature_25" + 0.2256466740731009 * keras_input_1."Feature_26" + -0.09691322323454471 * keras_input_1."Feature_27" + -0.07974645773034961 * keras_input_1."Feature_28" + -0.05647862668146358 * keras_input_1."Feature_29" + 0.033299702128349117 * keras_input_1."Feature_30" + 0.1582297382967491 * keras_input_1."Feature_31" + 0.272423538905545 * keras_input_1."Feature_32" + 0.2546098385464246 * keras_input_1."Feature_33" + 0.3545841118612154 * keras_input_1."Feature_34" + 0.0774518654644799 * keras_input_1."Feature_35" + 0.19409352925028225 * keras_input_1."Feature_36" + 0.31774491844060937 * keras_input_1."Feature_37" + 0.1611302070423931 * keras_input_1."Feature_38" + 0.06590344869580672 * keras_input_1."Feature_39" + 0.05283979999661958 * keras_input_1."Feature_40" + 0.0016490623411787983 * keras_input_1."Feature_41" + 0.11842825027372932 * keras_input_1."Feature_42" + 0.22189671039416287 * keras_input_1."Feature_43" + 0.007595124062702367 * keras_input_1."Feature_44" + 0.09897725683019866 * keras_input_1."Feature_45" + 0.34468745022855063 * keras_input_1."Feature_46" + 0.32704086763607604 * keras_input_1."Feature_47" + 0.12056015925184443 * keras_input_1."Feature_48" + 0.18207931306533778 * keras_input_1."Feature_49" + -0.06669161044627618 * keras_input_1."Feature_50" + 0.3217052125754739 * keras_input_1."Feature_51" + -0.31931361017802534 * keras_input_1."Feature_52" + 0.022481555106714762 * keras_input_1."Feature_53" + -0.06127891381167373 * keras_input_1."Feature_54" + 0.1869266071515878 * keras_input_1."Feature_55" + -0.08311502036743523 * keras_input_1."Feature_56" + -0.1536482255677249 * keras_input_1."Feature_57" + -0.16540247840800312 * keras_input_1."Feature_58" + -0.08614971391338105 * keras_input_1."Feature_59" + -0.034775239039802036 * keras_input_1."Feature_60" + 0.06835027006789988 * keras_input_1."Feature_61" + 0.07987716564710998 * keras_input_1."Feature_62" + -0.36803826098904907 * keras_input_1."Feature_63" AS output_1, -0.10507234146807032 + 0.2172339928441171 * keras_input_1."Feature_0" + 0.045584774085514854 * keras_input_1."Feature_1" + 0.01182201372986345 * keras_input_1."Feature_2" + 0.1358546422619162 * keras_input_1."Feature_3" + -0.014558806961368857 * keras_input_1."Feature_4" + -0.010260986631396837 * keras_input_1."Feature_5" + -0.07330555051243495 * keras_input_1."Feature_6" + 0.04584013571333082 * keras_input_1."Feature_7" + -0.2979796874448466 * keras_input_1."Feature_8" + -0.16652700256679537 * keras_input_1."Feature_9" + -0.08065208923629157 * keras_input_1."Feature_10" + 0.0364676077387072 * keras_input_1."Feature_11" + -0.043311002323334014 * keras_input_1."Feature_12" + -0.019280882857466396 * keras_input_1."Feature_13" + -0.001467125010281608 * keras_input_1."Feature_14" + 0.10236248293727944 * keras_input_1."Feature_15" + -0.073474514688955 * keras_input_1."Feature_16" + 0.022870880763024223 * keras_input_1."Feature_17" + 0.09800590402427573 * keras_input_1."Feature_18" + -0.13446216630601573 * keras_input_1."Feature_19" + -0.04775722453986799 * keras_input_1."Feature_20" + -0.24739958251006547 * keras_input_1."Feature_21" + -0.005071860303297718 * keras_input_1."Feature_22" + -0.23532766733928304 * keras_input_1."Feature_23" + 0.03786426992628389 * keras_input_1."Feature_24" + -0.18834064144383875 * keras_input_1."Feature_25" + -0.2065987321868519 * keras_input_1."Feature_26" + 0.12122688372934293 * keras_input_1."Feature_27" + -0.013776948568365236 * keras_input_1."Feature_28" + -0.1192102669764981 * keras_input_1."Feature_29" + -0.5313479691174633 * keras_input_1."Feature_30" + 0.01158141282229569 * keras_input_1."Feature_31" + -0.175989860914556 * keras_input_1."Feature_32" + -0.0007695896695513495 * keras_input_1."Feature_33" + 0.13668617835410915 * keras_input_1."Feature_34" + -0.020328702732536605 * keras_input_1."Feature_35" + 0.1283464911289836 * keras_input_1."Feature_36" + -0.23359778283875565 * keras_input_1."Feature_37" + -0.5306673803679995 * keras_input_1."Feature_38" + 0.10927241729181453 * keras_input_1."Feature_39" + -0.1971172356602569 * keras_input_1."Feature_40" + -0.3652123465937594 * keras_input_1."Feature_41" + 0.07406238594993113 * keras_input_1."Feature_42" + 0.2190074093334511 * keras_input_1."Feature_43" + 0.029045310163083246 * keras_input_1."Feature_44" + -0.28101193268853325 * keras_input_1."Feature_45" + -0.13760280279661197 * keras_input_1."Feature_46" + 0.4855617192226785 * keras_input_1."Feature_47" + 0.19694422713373072 * keras_input_1."Feature_48" + -0.018035297258859006 * keras_input_1."Feature_49" + 0.1745908747709951 * keras_input_1."Feature_50" + 0.0910286527391753 * keras_input_1."Feature_51" + 0.21543548417860559 * keras_input_1."Feature_52" + 0.31478182697106694 * keras_input_1."Feature_53" + -0.010677491597429912 * keras_input_1."Feature_54" + 0.020077904291750263 * keras_input_1."Feature_55" + 0.14536709612009346 * keras_input_1."Feature_56" + 0.18818575865050108 * keras_input_1."Feature_57" + -0.2841528753210216 * keras_input_1."Feature_58" + 0.012660494139775057 * keras_input_1."Feature_59" + -0.031317460327061786 * keras_input_1."Feature_60" + 0.25502954510906556 * keras_input_1."Feature_61" + 0.2787510750717283 * keras_input_1."Feature_62" + 0.09171218595281234 * keras_input_1."Feature_63" AS output_2, -0.08148230059328812 + -0.18376161258498097 * keras_input_1."Feature_0" + 0.2693868063377563 * keras_input_1."Feature_1" + -0.1964509957861873 * keras_input_1."Feature_2" + -0.16545611292143442 * keras_input_1."Feature_3" + 0.1085442272313188 * keras_input_1."Feature_4" + -0.1351418644598256 * keras_input_1."Feature_5" + -0.26954987576996153 * keras_input_1."Feature_6" + 0.0697937750312244 * keras_input_1."Feature_7" + -0.11930313739500531 * keras_input_1."Feature_8" + 0.0378274817681884 * keras_input_1."Feature_9" + 0.22776051346312348 * keras_input_1."Feature_10" + -0.1682126886739038 * keras_input_1."Feature_11" + 0.05602097154143909 * keras_input_1."Feature_12" + 0.1876880172531832 * keras_input_1."Feature_13" + 0.14056126578032538 * keras_input_1."Feature_14" + 0.22060931026517078 * keras_input_1."Feature_15" + 0.29907388870999174 * keras_input_1."Feature_16" + -0.10221191826274328 * keras_input_1."Feature_17" + -0.2509438846426219 * keras_input_1."Feature_18" + -0.36506944480842035 * keras_input_1."Feature_19" + 0.37689305832621317 * keras_input_1."Feature_20" + 0.031348227785451675 * keras_input_1."Feature_21" + 0.16059271586227247 * keras_input_1."Feature_22" + -0.26491539007380677 * keras_input_1."Feature_23" + -0.2627898465730655 * keras_input_1."Feature_24" + -0.09736041923954492 * keras_input_1."Feature_25" + -0.3086607704389651 * keras_input_1."Feature_26" + -0.20991158965489404 * keras_input_1."Feature_27" + 0.257059347150948 * keras_input_1."Feature_28" + -0.1165578040997855 * keras_input_1."Feature_29" + -0.18015309002648694 * keras_input_1."Feature_30" + -0.2321367510256513 * keras_input_1."Feature_31" + 0.19070745707708198 * keras_input_1."Feature_32" + -0.42941395480503297 * keras_input_1."Feature_33" + -0.28841795254345054 * keras_input_1."Feature_34" + -0.02094506309383228 * keras_input_1."Feature_35" + 0.2104256739715851 * keras_input_1."Feature_36" + -0.17994687254043984 * keras_input_1."Feature_37" + -0.14938318603259135 * keras_input_1."Feature_38" + -0.009998455846972842 * keras_input_1."Feature_39" + -0.12206101370409903 * keras_input_1."Feature_40" + -0.025996509806937098 * keras_input_1."Feature_41" + -0.29989572319000174 * keras_input_1."Feature_42" + -0.6123017245903264 * keras_input_1."Feature_43" + -0.3843650531584677 * keras_input_1."Feature_44" + 0.1612754744643257 * keras_input_1."Feature_45" + 0.27427033056628586 * keras_input_1."Feature_46" + 0.17852775645657615 * keras_input_1."Feature_47" + 0.2774833909580044 * keras_input_1."Feature_48" + 0.3405688714493026 * keras_input_1."Feature_49" + -0.004052578889133278 * keras_input_1."Feature_50" + 0.04676700588948042 * keras_input_1."Feature_51" + 0.19528704317958565 * keras_input_1."Feature_52" + -0.0016558389893762211 * keras_input_1."Feature_53" + 0.1421623667242636 * keras_input_1."Feature_54" + 0.06645049058967058 * keras_input_1."Feature_55" + 0.10012743069649521 * keras_input_1."Feature_56" + 0.20208088564675317 * keras_input_1."Feature_57" + 0.3278679223399858 * keras_input_1."Feature_58" + 0.1923975453715008 * keras_input_1."Feature_59" + 0.017352860994873542 * keras_input_1."Feature_60" + 0.1613167627563444 * keras_input_1."Feature_61" + 0.05871733395670841 * keras_input_1."Feature_62" + -0.11279520870481083 * keras_input_1."Feature_63" AS output_3, -0.08184129907397807 + -0.11074688200707336 * keras_input_1."Feature_0" + 0.2020114513385397 * keras_input_1."Feature_1" + 0.19542140530432042 * keras_input_1."Feature_2" + -0.03708893223538418 * keras_input_1."Feature_3" + 0.32587150743338694 * keras_input_1."Feature_4" + 0.201809835713726 * keras_input_1."Feature_5" + 0.47271599490396543 * keras_input_1."Feature_6" + 0.1483466672530707 * keras_input_1."Feature_7" + 0.12691263603907935 * keras_input_1."Feature_8" + 0.014501566169664786 * keras_input_1."Feature_9" + 0.05492198032472493 * keras_input_1."Feature_10" + 0.16671159325897789 * keras_input_1."Feature_11" + 0.18222620816778332 * keras_input_1."Feature_12" + -0.03483625685493158 * keras_input_1."Feature_13" + -0.038380800184243606 * keras_input_1."Feature_14" + 0.20217001768005627 * keras_input_1."Feature_15" + 0.3715443735244631 * keras_input_1."Feature_16" + -0.13844986589883973 * keras_input_1."Feature_17" + -0.08798646088218366 * keras_input_1."Feature_18" + -0.1680552870471892 * keras_input_1."Feature_19" + -0.39214599362180336 * keras_input_1."Feature_20" + -0.26297865648779495 * keras_input_1."Feature_21" + -0.4973856092272289 * keras_input_1."Feature_22" + 0.11798966204007019 * keras_input_1."Feature_23" + -0.05036443383540501 * keras_input_1."Feature_24" + 0.08060024853588792 * keras_input_1."Feature_25" + -0.04220283009152759 * keras_input_1."Feature_26" + 0.09778720567751485 * keras_input_1."Feature_27" + 0.07490001203771696 * keras_input_1."Feature_28" + -0.077585368977685 * keras_input_1."Feature_29" + -0.18367375345588233 * keras_input_1."Feature_30" + 0.03706144973937384 * keras_input_1."Feature_31" + 0.2597564917766703 * keras_input_1."Feature_32" + -0.1890649001528768 * keras_input_1."Feature_33" + 0.12335502019482997 * keras_input_1."Feature_34" + -0.02680902303101739 * keras_input_1."Feature_35" + 0.025046284507968065 * keras_input_1."Feature_36" + 0.2896394363927229 * keras_input_1."Feature_37" + 0.36890298904155006 * keras_input_1."Feature_38" + 0.22926433233239402 * keras_input_1."Feature_39" + 0.08686349354949918 * keras_input_1."Feature_40" + -0.2664372121869311 * keras_input_1."Feature_41" + -0.26633685045217526 * keras_input_1."Feature_42" + -0.08908918278393438 * keras_input_1."Feature_43" + 0.07502603729447432 * keras_input_1."Feature_44" + 0.07251193894259178 * keras_input_1."Feature_45" + -0.10632399511461087 * keras_input_1."Feature_46" + -0.23991577294678698 * keras_input_1."Feature_47" + 0.18179260388508361 * keras_input_1."Feature_48" + -0.1754494435207677 * keras_input_1."Feature_49" + -0.11601179867035778 * keras_input_1."Feature_50" + -0.015179095318091373 * keras_input_1."Feature_51" + -0.20502717126713002 * keras_input_1."Feature_52" + -0.11589855645510388 * keras_input_1."Feature_53" + -0.011532517627842664 * keras_input_1."Feature_54" + 0.0006613775582770785 * keras_input_1."Feature_55" + -0.22527862140392452 * keras_input_1."Feature_56" + 0.06378063500767207 * keras_input_1."Feature_57" + 0.40944429137225996 * keras_input_1."Feature_58" + 0.05991929013442666 * keras_input_1."Feature_59" + -0.25380582311556343 * keras_input_1."Feature_60" + -0.15302555226937853 * keras_input_1."Feature_61" + -0.28163856539921023 * keras_input_1."Feature_62" + -0.32151436837580016 * keras_input_1."Feature_63" AS output_4 
FROM keras_input_1), 
activation_relu AS 
(SELECT layer_dense_1."KEY" AS "KEY", maxvalue(layer_dense_1.output_1, 0) AS output_1, maxvalue(layer_dense_1.output_2, 0) AS output_2, maxvalue(layer_dense_1.output_3, 0) AS output_3, maxvalue(layer_dense_1.output_4, 0) AS output_4 
FROM layer_dense_1), 
activation_relu_1 AS 
(SELECT activation_relu."KEY" AS "KEY", activation_relu.output_1 AS output_1, activation_relu.output_2 AS output_2, activation_relu.output_3 AS output_3, activation_relu.output_4 AS output_4 
FROM activation_relu), 
activation_relu_1_1 AS 
(SELECT activation_relu_1."KEY" AS "KEY", activation_relu_1.output_1 AS output_1, activation_relu_1.output_2 AS output_2, activation_relu_1.output_3 AS output_3, activation_relu_1.output_4 AS output_4 
FROM activation_relu_1), 
layer_dense_2 AS 
(SELECT activation_relu_1_1."KEY" AS "KEY", 0.8990013784771799 + 0.13870043275998886 * activation_relu_1_1.output_1 + -1.006327624289209 * activation_relu_1_1.output_2 + -1.0793698084322292 * activation_relu_1_1.output_3 + -0.3558672196704441 * activation_relu_1_1.output_4 AS output_1, 0.06160922422075751 + -0.6247416470490175 * activation_relu_1_1.output_1 + 0.26378823320567396 * activation_relu_1_1.output_2 + 0.1528527173151918 * activation_relu_1_1.output_3 + -0.8176123836483198 * activation_relu_1_1.output_4 AS output_2, -0.4668997165716111 + -1.2677123825248426 * activation_relu_1_1.output_1 + 0.3106848263824114 * activation_relu_1_1.output_2 + 0.4913868370407075 * activation_relu_1_1.output_3 + -1.2540209528526702 * activation_relu_1_1.output_4 AS output_3, -0.8569032750254812 + -0.7205961920662872 * activation_relu_1_1.output_1 + -0.06031857552845087 * activation_relu_1_1.output_2 + 0.6144468909763643 * activation_relu_1_1.output_3 + 0.3599587702009165 * activation_relu_1_1.output_4 AS output_4, 0.49958247918531223 + 0.3344934747392487 * activation_relu_1_1.output_1 + -0.4992186416642259 * activation_relu_1_1.output_2 + -1.6470006599657874 * activation_relu_1_1.output_3 + -0.29929369688554364 * activation_relu_1_1.output_4 AS output_5, -0.5690157982928937 + -0.19502154153033774 * activation_relu_1_1.output_1 + 0.09480667607142997 * activation_relu_1_1.output_2 + 0.0602715581328916 * activation_relu_1_1.output_3 + 0.4956864959012239 * activation_relu_1_1.output_4 AS output_6, -1.1560570775239523 + 0.402703896778552 * activation_relu_1_1.output_1 + 0.3038081425350023 * activation_relu_1_1.output_2 + -1.1399466437418944 * activation_relu_1_1.output_3 + -0.33883840314521785 * activation_relu_1_1.output_4 AS output_7, 0.16952795577389249 + -0.18956296250231944 * activation_relu_1_1.output_1 + -1.082200397919115 * activation_relu_1_1.output_2 + -0.17157268694834205 * activation_relu_1_1.output_3 + 0.437385042396393 * activation_relu_1_1.output_4 AS output_8, 0.4029917808129494 + -0.2034178254160806 * activation_relu_1_1.output_1 + 0.21125383974596845 * activation_relu_1_1.output_2 + 0.1994599721646752 * activation_relu_1_1.output_3 + -0.18504991991154807 * activation_relu_1_1.output_4 AS output_9, 0.2723320332124791 + -0.3254986884250523 * activation_relu_1_1.output_1 + -0.6016750684611294 * activation_relu_1_1.output_2 + 0.533419638172232 * activation_relu_1_1.output_3 + 0.1378698667753136 * activation_relu_1_1.output_4 AS output_10 
FROM activation_relu_1_1), 
layer_dense_2_1 AS 
(SELECT layer_dense_2."KEY" AS "KEY", layer_dense_2.output_1 AS output_1, layer_dense_2.output_2 AS output_2, layer_dense_2.output_3 AS output_3, layer_dense_2.output_4 AS output_4, layer_dense_2.output_5 AS output_5, layer_dense_2.output_6 AS output_6, layer_dense_2.output_7 AS output_7, layer_dense_2.output_8 AS output_8, layer_dense_2.output_9 AS output_9, layer_dense_2.output_10 AS output_10 
FROM layer_dense_2), 
score_soft_max_step1 AS 
(SELECT layer_dense_2_1."KEY" AS "KEY", layer_dense_2_1.output_1 AS "Score_0", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_1)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_1)) ELSE -709.782712893384 END) AS "exp_Score_0", layer_dense_2_1.output_2 AS "Score_1", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_2)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_2)) ELSE -709.782712893384 END) AS "exp_Score_1", layer_dense_2_1.output_3 AS "Score_2", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_3)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_3)) ELSE -709.782712893384 END) AS "exp_Score_2", layer_dense_2_1.output_4 AS "Score_3", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_4)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_4)) ELSE -709.782712893384 END) AS "exp_Score_3", layer_dense_2_1.output_5 AS "Score_4", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_5)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_5)) ELSE -709.782712893384 END) AS "exp_Score_4", layer_dense_2_1.output_6 AS "Score_5", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_6)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_6)) ELSE -709.782712893384 END) AS "exp_Score_5", layer_dense_2_1.output_7 AS "Score_6", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_7)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_7)) ELSE -709.782712893384 END) AS "exp_Score_6", layer_dense_2_1.output_8 AS "Score_7", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_8)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_8)) ELSE -709.782712893384 END) AS "exp_Score_7", layer_dense_2_1.output_9 AS "Score_8", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_9)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_9)) ELSE -709.782712893384 END) AS "exp_Score_8", layer_dense_2_1.output_10 AS "Score_9", exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_10)) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, layer_dense_2_1.output_10)) ELSE -709.782712893384 END) AS "exp_Score_9" 
FROM layer_dense_2_1), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_Score" AS "exp_Score" 
FROM (SELECT score_soft_max_step1."KEY" AS "KEY", 0 AS class, score_soft_max_step1."exp_Score_0" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 1 AS class, score_soft_max_step1."exp_Score_1" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 2 AS class, score_soft_max_step1."exp_Score_2" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 3 AS class, score_soft_max_step1."exp_Score_3" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 4 AS class, score_soft_max_step1."exp_Score_4" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 5 AS class, score_soft_max_step1."exp_Score_5" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 6 AS class, score_soft_max_step1."exp_Score_6" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 7 AS class, score_soft_max_step1."exp_Score_7" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 8 AS class, score_soft_max_step1."exp_Score_8" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 9 AS class, score_soft_max_step1."exp_Score_9" AS "exp_Score" 
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1."KEY" AS "KEY", score_soft_max_step1."Score_0" AS "Score_0", score_soft_max_step1."exp_Score_0" AS "exp_Score_0", score_soft_max_step1."Score_1" AS "Score_1", score_soft_max_step1."exp_Score_1" AS "exp_Score_1", score_soft_max_step1."Score_2" AS "Score_2", score_soft_max_step1."exp_Score_2" AS "exp_Score_2", score_soft_max_step1."Score_3" AS "Score_3", score_soft_max_step1."exp_Score_3" AS "exp_Score_3", score_soft_max_step1."Score_4" AS "Score_4", score_soft_max_step1."exp_Score_4" AS "exp_Score_4", score_soft_max_step1."Score_5" AS "Score_5", score_soft_max_step1."exp_Score_5" AS "exp_Score_5", score_soft_max_step1."Score_6" AS "Score_6", score_soft_max_step1."exp_Score_6" AS "exp_Score_6", score_soft_max_step1."Score_7" AS "Score_7", score_soft_max_step1."exp_Score_7" AS "exp_Score_7", score_soft_max_step1."Score_8" AS "Score_8", score_soft_max_step1."exp_Score_8" AS "exp_Score_8", score_soft_max_step1."Score_9" AS "Score_9", score_soft_max_step1."exp_Score_9" AS "exp_Score_9", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpScore" AS "sum_ExpScore" 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_Score") AS "sum_ExpScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_step1."KEY" = sum_exp_t."KEY_sum"), 
layer_softmax AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."exp_Score_0" / score_soft_max."sum_ExpScore" AS output_1, score_soft_max."exp_Score_1" / score_soft_max."sum_ExpScore" AS output_2, score_soft_max."exp_Score_2" / score_soft_max."sum_ExpScore" AS output_3, score_soft_max."exp_Score_3" / score_soft_max."sum_ExpScore" AS output_4, score_soft_max."exp_Score_4" / score_soft_max."sum_ExpScore" AS output_5, score_soft_max."exp_Score_5" / score_soft_max."sum_ExpScore" AS output_6, score_soft_max."exp_Score_6" / score_soft_max."sum_ExpScore" AS output_7, score_soft_max."exp_Score_7" / score_soft_max."sum_ExpScore" AS output_8, score_soft_max."exp_Score_8" / score_soft_max."sum_ExpScore" AS output_9, score_soft_max."exp_Score_9" / score_soft_max."sum_ExpScore" AS output_10 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", CAST(NULL AS DOUBLE PRECISION) AS "Score_4", CAST(NULL AS DOUBLE PRECISION) AS "Score_5", CAST(NULL AS DOUBLE PRECISION) AS "Score_6", CAST(NULL AS DOUBLE PRECISION) AS "Score_7", CAST(NULL AS DOUBLE PRECISION) AS "Score_8", CAST(NULL AS DOUBLE PRECISION) AS "Score_9", layer_softmax.output_1 AS "Proba_0", layer_softmax.output_2 AS "Proba_1", layer_softmax.output_3 AS "Proba_2", layer_softmax.output_4 AS "Proba_3", layer_softmax.output_5 AS "Proba_4", layer_softmax.output_6 AS "Proba_5", layer_softmax.output_7 AS "Proba_6", layer_softmax.output_8 AS "Proba_7", layer_softmax.output_9 AS "Proba_8", layer_softmax.output_10 AS "Proba_9", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_3", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_4", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_5", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_6", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_7", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_8", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_9", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 4 AS class, orig_cte."LogProba_4" AS "LogProba", orig_cte."Proba_4" AS "Proba", orig_cte."Score_4" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 5 AS class, orig_cte."LogProba_5" AS "LogProba", orig_cte."Proba_5" AS "Proba", orig_cte."Score_5" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 6 AS class, orig_cte."LogProba_6" AS "LogProba", orig_cte."Proba_6" AS "Proba", orig_cte."Score_6" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 7 AS class, orig_cte."LogProba_7" AS "LogProba", orig_cte."Proba_7" AS "Proba", orig_cte."Score_7" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 8 AS class, orig_cte."LogProba_8" AS "LogProba", orig_cte."Proba_8" AS "Proba", orig_cte."Score_8" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 9 AS class, orig_cte."LogProba_9" AS "LogProba", orig_cte."Proba_9" AS "Proba", orig_cte."Score_9" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Score_4" AS "Score_4", orig_cte."Score_5" AS "Score_5", orig_cte."Score_6" AS "Score_6", orig_cte."Score_7" AS "Score_7", orig_cte."Score_8" AS "Score_8", orig_cte."Score_9" AS "Score_9", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."Proba_4" AS "Proba_4", orig_cte."Proba_5" AS "Proba_5", orig_cte."Proba_6" AS "Proba_6", orig_cte."Proba_7" AS "Proba_7", orig_cte."Proba_8" AS "Proba_8", orig_cte."Proba_9" AS "Proba_9", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."LogProba_4" AS "LogProba_4", orig_cte."LogProba_5" AS "LogProba_5", orig_cte."LogProba_6" AS "LogProba_6", orig_cte."LogProba_7" AS "LogProba_7", orig_cte."LogProba_8" AS "LogProba_8", orig_cte."LogProba_9" AS "LogProba_9", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Score_4" AS "Score_4", score_max."Score_5" AS "Score_5", score_max."Score_6" AS "Score_6", score_max."Score_7" AS "Score_7", score_max."Score_8" AS "Score_8", score_max."Score_9" AS "Score_9", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."Proba_4" AS "Proba_4", score_max."Proba_5" AS "Proba_5", score_max."Proba_6" AS "Proba_6", score_max."Proba_7" AS "Proba_7", score_max."Proba_8" AS "Proba_8", score_max."Proba_9" AS "Proba_9", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."LogProba_4" AS "LogProba_4", score_max."LogProba_5" AS "LogProba_5", score_max."LogProba_6" AS "LogProba_6", score_max."LogProba_7" AS "LogProba_7", score_max."LogProba_8" AS "LogProba_8", score_max."LogProba_9" AS "LogProba_9", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Score_4" AS "Score_4", score_max."Score_5" AS "Score_5", score_max."Score_6" AS "Score_6", score_max."Score_7" AS "Score_7", score_max."Score_8" AS "Score_8", score_max."Score_9" AS "Score_9", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."Proba_4" AS "Proba_4", score_max."Proba_5" AS "Proba_5", score_max."Proba_6" AS "Proba_6", score_max."Proba_7" AS "Proba_7", score_max."Proba_8" AS "Proba_8", score_max."Proba_9" AS "Proba_9", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."LogProba_4" AS "LogProba_4", score_max."LogProba_5" AS "LogProba_5", score_max."LogProba_6" AS "LogProba_6", score_max."LogProba_7" AS "LogProba_7", score_max."LogProba_8" AS "LogProba_8", score_max."LogProba_9" AS "LogProba_9", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Score_2" AS "Score_2", arg_max_cte."Score_3" AS "Score_3", arg_max_cte."Score_4" AS "Score_4", arg_max_cte."Score_5" AS "Score_5", arg_max_cte."Score_6" AS "Score_6", arg_max_cte."Score_7" AS "Score_7", arg_max_cte."Score_8" AS "Score_8", arg_max_cte."Score_9" AS "Score_9", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", arg_max_cte."Proba_2" AS "Proba_2", arg_max_cte."Proba_3" AS "Proba_3", arg_max_cte."Proba_4" AS "Proba_4", arg_max_cte."Proba_5" AS "Proba_5", arg_max_cte."Proba_6" AS "Proba_6", arg_max_cte."Proba_7" AS "Proba_7", arg_max_cte."Proba_8" AS "Proba_8", arg_max_cte."Proba_9" AS "Proba_9", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."Proba_2" IS NULL OR arg_max_cte."Proba_2" > 0.0) THEN ln(arg_max_cte."Proba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."Proba_3" IS NULL OR arg_max_cte."Proba_3" > 0.0) THEN ln(arg_max_cte."Proba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", CASE WHEN (arg_max_cte."Proba_4" IS NULL OR arg_max_cte."Proba_4" > 0.0) THEN ln(arg_max_cte."Proba_4") ELSE -1.79769313486231e+308 END AS "LogProba_4", CASE WHEN (arg_max_cte."Proba_5" IS NULL OR arg_max_cte."Proba_5" > 0.0) THEN ln(arg_max_cte."Proba_5") ELSE -1.79769313486231e+308 END AS "LogProba_5", CASE WHEN (arg_max_cte."Proba_6" IS NULL OR arg_max_cte."Proba_6" > 0.0) THEN ln(arg_max_cte."Proba_6") ELSE -1.79769313486231e+308 END AS "LogProba_6", CASE WHEN (arg_max_cte."Proba_7" IS NULL OR arg_max_cte."Proba_7" > 0.0) THEN ln(arg_max_cte."Proba_7") ELSE -1.79769313486231e+308 END AS "LogProba_7", CASE WHEN (arg_max_cte."Proba_8" IS NULL OR arg_max_cte."Proba_8" > 0.0) THEN ln(arg_max_cte."Proba_8") ELSE -1.79769313486231e+308 END AS "LogProba_8", CASE WHEN (arg_max_cte."Proba_9" IS NULL OR arg_max_cte."Proba_9" > 0.0) THEN ln(arg_max_cte."Proba_9") ELSE -1.79769313486231e+308 END AS "LogProba_9", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte