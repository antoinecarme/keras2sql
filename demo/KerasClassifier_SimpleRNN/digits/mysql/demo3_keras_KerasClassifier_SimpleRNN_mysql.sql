-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_SimpleRNN
-- Dataset : digits
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3`, `ADS`.`Feature_4` AS `Feature_4`, `ADS`.`Feature_5` AS `Feature_5`, `ADS`.`Feature_6` AS `Feature_6`, `ADS`.`Feature_7` AS `Feature_7`, `ADS`.`Feature_8` AS `Feature_8`, `ADS`.`Feature_9` AS `Feature_9`, `ADS`.`Feature_10` AS `Feature_10`, `ADS`.`Feature_11` AS `Feature_11`, `ADS`.`Feature_12` AS `Feature_12`, `ADS`.`Feature_13` AS `Feature_13`, `ADS`.`Feature_14` AS `Feature_14`, `ADS`.`Feature_15` AS `Feature_15`, `ADS`.`Feature_16` AS `Feature_16`, `ADS`.`Feature_17` AS `Feature_17`, `ADS`.`Feature_18` AS `Feature_18`, `ADS`.`Feature_19` AS `Feature_19`, `ADS`.`Feature_20` AS `Feature_20`, `ADS`.`Feature_21` AS `Feature_21`, `ADS`.`Feature_22` AS `Feature_22`, `ADS`.`Feature_23` AS `Feature_23`, `ADS`.`Feature_24` AS `Feature_24`, `ADS`.`Feature_25` AS `Feature_25`, `ADS`.`Feature_26` AS `Feature_26`, `ADS`.`Feature_27` AS `Feature_27`, `ADS`.`Feature_28` AS `Feature_28`, `ADS`.`Feature_29` AS `Feature_29`, `ADS`.`Feature_30` AS `Feature_30`, `ADS`.`Feature_31` AS `Feature_31`, `ADS`.`Feature_32` AS `Feature_32`, `ADS`.`Feature_33` AS `Feature_33`, `ADS`.`Feature_34` AS `Feature_34`, `ADS`.`Feature_35` AS `Feature_35`, `ADS`.`Feature_36` AS `Feature_36`, `ADS`.`Feature_37` AS `Feature_37`, `ADS`.`Feature_38` AS `Feature_38`, `ADS`.`Feature_39` AS `Feature_39`, `ADS`.`Feature_40` AS `Feature_40`, `ADS`.`Feature_41` AS `Feature_41`, `ADS`.`Feature_42` AS `Feature_42`, `ADS`.`Feature_43` AS `Feature_43`, `ADS`.`Feature_44` AS `Feature_44`, `ADS`.`Feature_45` AS `Feature_45`, `ADS`.`Feature_46` AS `Feature_46`, `ADS`.`Feature_47` AS `Feature_47`, `ADS`.`Feature_48` AS `Feature_48`, `ADS`.`Feature_49` AS `Feature_49`, `ADS`.`Feature_50` AS `Feature_50`, `ADS`.`Feature_51` AS `Feature_51`, `ADS`.`Feature_52` AS `Feature_52`, `ADS`.`Feature_53` AS `Feature_53`, `ADS`.`Feature_54` AS `Feature_54`, `ADS`.`Feature_55` AS `Feature_55`, `ADS`.`Feature_56` AS `Feature_56`, `ADS`.`Feature_57` AS `Feature_57`, `ADS`.`Feature_58` AS `Feature_58`, `ADS`.`Feature_59` AS `Feature_59`, `ADS`.`Feature_60` AS `Feature_60`, `ADS`.`Feature_61` AS `Feature_61`, `ADS`.`Feature_62` AS `Feature_62`, `ADS`.`Feature_63` AS `Feature_63` 
FROM digits AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3`, keras_input.`Feature_4` AS `Feature_4`, keras_input.`Feature_5` AS `Feature_5`, keras_input.`Feature_6` AS `Feature_6`, keras_input.`Feature_7` AS `Feature_7`, keras_input.`Feature_8` AS `Feature_8`, keras_input.`Feature_9` AS `Feature_9`, keras_input.`Feature_10` AS `Feature_10`, keras_input.`Feature_11` AS `Feature_11`, keras_input.`Feature_12` AS `Feature_12`, keras_input.`Feature_13` AS `Feature_13`, keras_input.`Feature_14` AS `Feature_14`, keras_input.`Feature_15` AS `Feature_15`, keras_input.`Feature_16` AS `Feature_16`, keras_input.`Feature_17` AS `Feature_17`, keras_input.`Feature_18` AS `Feature_18`, keras_input.`Feature_19` AS `Feature_19`, keras_input.`Feature_20` AS `Feature_20`, keras_input.`Feature_21` AS `Feature_21`, keras_input.`Feature_22` AS `Feature_22`, keras_input.`Feature_23` AS `Feature_23`, keras_input.`Feature_24` AS `Feature_24`, keras_input.`Feature_25` AS `Feature_25`, keras_input.`Feature_26` AS `Feature_26`, keras_input.`Feature_27` AS `Feature_27`, keras_input.`Feature_28` AS `Feature_28`, keras_input.`Feature_29` AS `Feature_29`, keras_input.`Feature_30` AS `Feature_30`, keras_input.`Feature_31` AS `Feature_31`, keras_input.`Feature_32` AS `Feature_32`, keras_input.`Feature_33` AS `Feature_33`, keras_input.`Feature_34` AS `Feature_34`, keras_input.`Feature_35` AS `Feature_35`, keras_input.`Feature_36` AS `Feature_36`, keras_input.`Feature_37` AS `Feature_37`, keras_input.`Feature_38` AS `Feature_38`, keras_input.`Feature_39` AS `Feature_39`, keras_input.`Feature_40` AS `Feature_40`, keras_input.`Feature_41` AS `Feature_41`, keras_input.`Feature_42` AS `Feature_42`, keras_input.`Feature_43` AS `Feature_43`, keras_input.`Feature_44` AS `Feature_44`, keras_input.`Feature_45` AS `Feature_45`, keras_input.`Feature_46` AS `Feature_46`, keras_input.`Feature_47` AS `Feature_47`, keras_input.`Feature_48` AS `Feature_48`, keras_input.`Feature_49` AS `Feature_49`, keras_input.`Feature_50` AS `Feature_50`, keras_input.`Feature_51` AS `Feature_51`, keras_input.`Feature_52` AS `Feature_52`, keras_input.`Feature_53` AS `Feature_53`, keras_input.`Feature_54` AS `Feature_54`, keras_input.`Feature_55` AS `Feature_55`, keras_input.`Feature_56` AS `Feature_56`, keras_input.`Feature_57` AS `Feature_57`, keras_input.`Feature_58` AS `Feature_58`, keras_input.`Feature_59` AS `Feature_59`, keras_input.`Feature_60` AS `Feature_60`, keras_input.`Feature_61` AS `Feature_61`, keras_input.`Feature_62` AS `Feature_62`, keras_input.`Feature_63` AS `Feature_63` 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.`KEY` ASC) AS rn, keras_input_1.`KEY` AS `KEY`, keras_input_1.`Feature_0` AS `Feature_0`, keras_input_1.`Feature_1` AS `Feature_1`, keras_input_1.`Feature_2` AS `Feature_2`, keras_input_1.`Feature_3` AS `Feature_3`, keras_input_1.`Feature_4` AS `Feature_4`, keras_input_1.`Feature_5` AS `Feature_5`, keras_input_1.`Feature_6` AS `Feature_6`, keras_input_1.`Feature_7` AS `Feature_7`, keras_input_1.`Feature_8` AS `Feature_8`, keras_input_1.`Feature_9` AS `Feature_9`, keras_input_1.`Feature_10` AS `Feature_10`, keras_input_1.`Feature_11` AS `Feature_11`, keras_input_1.`Feature_12` AS `Feature_12`, keras_input_1.`Feature_13` AS `Feature_13`, keras_input_1.`Feature_14` AS `Feature_14`, keras_input_1.`Feature_15` AS `Feature_15`, keras_input_1.`Feature_16` AS `Feature_16`, keras_input_1.`Feature_17` AS `Feature_17`, keras_input_1.`Feature_18` AS `Feature_18`, keras_input_1.`Feature_19` AS `Feature_19`, keras_input_1.`Feature_20` AS `Feature_20`, keras_input_1.`Feature_21` AS `Feature_21`, keras_input_1.`Feature_22` AS `Feature_22`, keras_input_1.`Feature_23` AS `Feature_23`, keras_input_1.`Feature_24` AS `Feature_24`, keras_input_1.`Feature_25` AS `Feature_25`, keras_input_1.`Feature_26` AS `Feature_26`, keras_input_1.`Feature_27` AS `Feature_27`, keras_input_1.`Feature_28` AS `Feature_28`, keras_input_1.`Feature_29` AS `Feature_29`, keras_input_1.`Feature_30` AS `Feature_30`, keras_input_1.`Feature_31` AS `Feature_31`, keras_input_1.`Feature_32` AS `Feature_32`, keras_input_1.`Feature_33` AS `Feature_33`, keras_input_1.`Feature_34` AS `Feature_34`, keras_input_1.`Feature_35` AS `Feature_35`, keras_input_1.`Feature_36` AS `Feature_36`, keras_input_1.`Feature_37` AS `Feature_37`, keras_input_1.`Feature_38` AS `Feature_38`, keras_input_1.`Feature_39` AS `Feature_39`, keras_input_1.`Feature_40` AS `Feature_40`, keras_input_1.`Feature_41` AS `Feature_41`, keras_input_1.`Feature_42` AS `Feature_42`, keras_input_1.`Feature_43` AS `Feature_43`, keras_input_1.`Feature_44` AS `Feature_44`, keras_input_1.`Feature_45` AS `Feature_45`, keras_input_1.`Feature_46` AS `Feature_46`, keras_input_1.`Feature_47` AS `Feature_47`, keras_input_1.`Feature_48` AS `Feature_48`, keras_input_1.`Feature_49` AS `Feature_49`, keras_input_1.`Feature_50` AS `Feature_50`, keras_input_1.`Feature_51` AS `Feature_51`, keras_input_1.`Feature_52` AS `Feature_52`, keras_input_1.`Feature_53` AS `Feature_53`, keras_input_1.`Feature_54` AS `Feature_54`, keras_input_1.`Feature_55` AS `Feature_55`, keras_input_1.`Feature_56` AS `Feature_56`, keras_input_1.`Feature_57` AS `Feature_57`, keras_input_1.`Feature_58` AS `Feature_58`, keras_input_1.`Feature_59` AS `Feature_59`, keras_input_1.`Feature_60` AS `Feature_60`, keras_input_1.`Feature_61` AS `Feature_61`, keras_input_1.`Feature_62` AS `Feature_62`, keras_input_1.`Feature_63` AS `Feature_63` 
FROM keras_input_1), 
input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.`KEY` AS `KEY`, keras_input_1_rn.`Feature_0` AS `Feature_0`, keras_input_1_rn.`Feature_1` AS `Feature_1`, keras_input_1_rn.`Feature_2` AS `Feature_2`, keras_input_1_rn.`Feature_3` AS `Feature_3`, keras_input_1_rn.`Feature_4` AS `Feature_4`, keras_input_1_rn.`Feature_5` AS `Feature_5`, keras_input_1_rn.`Feature_6` AS `Feature_6`, keras_input_1_rn.`Feature_7` AS `Feature_7`, keras_input_1_rn.`Feature_8` AS `Feature_8`, keras_input_1_rn.`Feature_9` AS `Feature_9`, keras_input_1_rn.`Feature_10` AS `Feature_10`, keras_input_1_rn.`Feature_11` AS `Feature_11`, keras_input_1_rn.`Feature_12` AS `Feature_12`, keras_input_1_rn.`Feature_13` AS `Feature_13`, keras_input_1_rn.`Feature_14` AS `Feature_14`, keras_input_1_rn.`Feature_15` AS `Feature_15`, keras_input_1_rn.`Feature_16` AS `Feature_16`, keras_input_1_rn.`Feature_17` AS `Feature_17`, keras_input_1_rn.`Feature_18` AS `Feature_18`, keras_input_1_rn.`Feature_19` AS `Feature_19`, keras_input_1_rn.`Feature_20` AS `Feature_20`, keras_input_1_rn.`Feature_21` AS `Feature_21`, keras_input_1_rn.`Feature_22` AS `Feature_22`, keras_input_1_rn.`Feature_23` AS `Feature_23`, keras_input_1_rn.`Feature_24` AS `Feature_24`, keras_input_1_rn.`Feature_25` AS `Feature_25`, keras_input_1_rn.`Feature_26` AS `Feature_26`, keras_input_1_rn.`Feature_27` AS `Feature_27`, keras_input_1_rn.`Feature_28` AS `Feature_28`, keras_input_1_rn.`Feature_29` AS `Feature_29`, keras_input_1_rn.`Feature_30` AS `Feature_30`, keras_input_1_rn.`Feature_31` AS `Feature_31`, keras_input_1_rn.`Feature_32` AS `Feature_32`, keras_input_1_rn.`Feature_33` AS `Feature_33`, keras_input_1_rn.`Feature_34` AS `Feature_34`, keras_input_1_rn.`Feature_35` AS `Feature_35`, keras_input_1_rn.`Feature_36` AS `Feature_36`, keras_input_1_rn.`Feature_37` AS `Feature_37`, keras_input_1_rn.`Feature_38` AS `Feature_38`, keras_input_1_rn.`Feature_39` AS `Feature_39`, keras_input_1_rn.`Feature_40` AS `Feature_40`, keras_input_1_rn.`Feature_41` AS `Feature_41`, keras_input_1_rn.`Feature_42` AS `Feature_42`, keras_input_1_rn.`Feature_43` AS `Feature_43`, keras_input_1_rn.`Feature_44` AS `Feature_44`, keras_input_1_rn.`Feature_45` AS `Feature_45`, keras_input_1_rn.`Feature_46` AS `Feature_46`, keras_input_1_rn.`Feature_47` AS `Feature_47`, keras_input_1_rn.`Feature_48` AS `Feature_48`, keras_input_1_rn.`Feature_49` AS `Feature_49`, keras_input_1_rn.`Feature_50` AS `Feature_50`, keras_input_1_rn.`Feature_51` AS `Feature_51`, keras_input_1_rn.`Feature_52` AS `Feature_52`, keras_input_1_rn.`Feature_53` AS `Feature_53`, keras_input_1_rn.`Feature_54` AS `Feature_54`, keras_input_1_rn.`Feature_55` AS `Feature_55`, keras_input_1_rn.`Feature_56` AS `Feature_56`, keras_input_1_rn.`Feature_57` AS `Feature_57`, keras_input_1_rn.`Feature_58` AS `Feature_58`, keras_input_1_rn.`Feature_59` AS `Feature_59`, keras_input_1_rn.`Feature_60` AS `Feature_60`, keras_input_1_rn.`Feature_61` AS `Feature_61`, keras_input_1_rn.`Feature_62` AS `Feature_62`, keras_input_1_rn.`Feature_63` AS `Feature_63`, -0.010040900569827156 + -0.03927694986308772 * keras_input_1_rn.`Feature_0` + -0.21975682824408724 * keras_input_1_rn.`Feature_1` + -0.26730893940087685 * keras_input_1_rn.`Feature_2` + 0.13669212636170797 * keras_input_1_rn.`Feature_3` + -0.23348078453626644 * keras_input_1_rn.`Feature_4` + -0.2694740974332096 * keras_input_1_rn.`Feature_5` + 0.03155015022703811 * keras_input_1_rn.`Feature_6` + -0.2928278006920269 * keras_input_1_rn.`Feature_7` + -0.143211036072859 * keras_input_1_rn.`Feature_8` + 0.0476255213009317 * keras_input_1_rn.`Feature_9` + -0.29272357640295676 * keras_input_1_rn.`Feature_10` + 0.08959866010098498 * keras_input_1_rn.`Feature_11` + -0.03181917100286053 * keras_input_1_rn.`Feature_12` + -0.225839830519454 * keras_input_1_rn.`Feature_13` + -0.29249907083965554 * keras_input_1_rn.`Feature_14` + 0.021080570578798197 * keras_input_1_rn.`Feature_15` + 0.13244660486968451 * keras_input_1_rn.`Feature_16` + -0.09786380098798275 * keras_input_1_rn.`Feature_17` + -0.03398454472691909 * keras_input_1_rn.`Feature_18` + 0.011082370812504511 * keras_input_1_rn.`Feature_19` + -0.27796032463700626 * keras_input_1_rn.`Feature_20` + 0.25628333143562854 * keras_input_1_rn.`Feature_21` + -0.23758462509809283 * keras_input_1_rn.`Feature_22` + -0.2865927831650708 * keras_input_1_rn.`Feature_23` + 0.294481940190657 * keras_input_1_rn.`Feature_24` + 0.06884453906107733 * keras_input_1_rn.`Feature_25` + -0.1752383589398293 * keras_input_1_rn.`Feature_26` + -0.02472739253805206 * keras_input_1_rn.`Feature_27` + -0.03708206855520163 * keras_input_1_rn.`Feature_28` + -0.13353892527111408 * keras_input_1_rn.`Feature_29` + -0.220621387142255 * keras_input_1_rn.`Feature_30` + 0.19034771507585196 * keras_input_1_rn.`Feature_31` + 0.23814221236195077 * keras_input_1_rn.`Feature_32` + 0.05085372301838128 * keras_input_1_rn.`Feature_33` + 0.15524801074183472 * keras_input_1_rn.`Feature_34` + -0.20418038184254378 * keras_input_1_rn.`Feature_35` + -0.13921314522473316 * keras_input_1_rn.`Feature_36` + 0.15583462795041597 * keras_input_1_rn.`Feature_37` + -0.08004533975526854 * keras_input_1_rn.`Feature_38` + -0.14666262898466786 * keras_input_1_rn.`Feature_39` + -0.13341768688490047 * keras_input_1_rn.`Feature_40` + 0.28093095006590574 * keras_input_1_rn.`Feature_41` + 0.2526291039950434 * keras_input_1_rn.`Feature_42` + -0.3006889343820693 * keras_input_1_rn.`Feature_43` + -0.10204562797985098 * keras_input_1_rn.`Feature_44` + -0.0203551801627655 * keras_input_1_rn.`Feature_45` + -0.13693533888050338 * keras_input_1_rn.`Feature_46` + -0.24287218989443282 * keras_input_1_rn.`Feature_47` + 0.08263584664119283 * keras_input_1_rn.`Feature_48` + -0.30008721580240993 * keras_input_1_rn.`Feature_49` + -0.1363128740517508 * keras_input_1_rn.`Feature_50` + -0.06728966763807281 * keras_input_1_rn.`Feature_51` + 0.14828048714394115 * keras_input_1_rn.`Feature_52` + -0.05160796316346498 * keras_input_1_rn.`Feature_53` + -0.027040854470438393 * keras_input_1_rn.`Feature_54` + -0.060856169186974216 * keras_input_1_rn.`Feature_55` + 0.03703817207849819 * keras_input_1_rn.`Feature_56` + 0.26132701546887105 * keras_input_1_rn.`Feature_57` + 0.10723019141704566 * keras_input_1_rn.`Feature_58` + 0.15135354322895372 * keras_input_1_rn.`Feature_59` + 0.023018471013786332 * keras_input_1_rn.`Feature_60` + 0.02529105378890299 * keras_input_1_rn.`Feature_61` + 0.08581299504624136 * keras_input_1_rn.`Feature_62` + -0.25970532795721735 * keras_input_1_rn.`Feature_63` AS dot_prod_1, 0.008156774761422311 + 0.2205008527433473 * keras_input_1_rn.`Feature_0` + -0.08629333174023147 * keras_input_1_rn.`Feature_1` + 0.15852180613768327 * keras_input_1_rn.`Feature_2` + -0.026362443733108365 * keras_input_1_rn.`Feature_3` + 0.06375900843478051 * keras_input_1_rn.`Feature_4` + -0.09720991633443615 * keras_input_1_rn.`Feature_5` + 0.23916531925446716 * keras_input_1_rn.`Feature_6` + -0.10862584832604841 * keras_input_1_rn.`Feature_7` + 0.07771665091544921 * keras_input_1_rn.`Feature_8` + 0.3253367541007098 * keras_input_1_rn.`Feature_9` + -0.12292187651899733 * keras_input_1_rn.`Feature_10` + -0.0805422110280448 * keras_input_1_rn.`Feature_11` + 0.12025846046924432 * keras_input_1_rn.`Feature_12` + 0.30089537517929227 * keras_input_1_rn.`Feature_13` + 0.20119542419722783 * keras_input_1_rn.`Feature_14` + 0.27441732631765225 * keras_input_1_rn.`Feature_15` + -0.15184042674914752 * keras_input_1_rn.`Feature_16` + 0.041353909763259665 * keras_input_1_rn.`Feature_17` + -0.020261480454700477 * keras_input_1_rn.`Feature_18` + -0.16894188512127759 * keras_input_1_rn.`Feature_19` + 0.14468459511725004 * keras_input_1_rn.`Feature_20` + -0.05374510429529631 * keras_input_1_rn.`Feature_21` + 0.07356974330388011 * keras_input_1_rn.`Feature_22` + 0.2961239568475693 * keras_input_1_rn.`Feature_23` + 0.04083507134113551 * keras_input_1_rn.`Feature_24` + 0.006963946605821726 * keras_input_1_rn.`Feature_25` + -0.028869076904257093 * keras_input_1_rn.`Feature_26` + 0.09062930366604151 * keras_input_1_rn.`Feature_27` + 0.14560316997249936 * keras_input_1_rn.`Feature_28` + 0.15235233436638249 * keras_input_1_rn.`Feature_29` + 0.24508720301443143 * keras_input_1_rn.`Feature_30` + 0.16282409298923756 * keras_input_1_rn.`Feature_31` + 0.145317842368487 * keras_input_1_rn.`Feature_32` + 0.2623438172424375 * keras_input_1_rn.`Feature_33` + 0.23577311602964177 * keras_input_1_rn.`Feature_34` + -0.285729202744261 * keras_input_1_rn.`Feature_35` + 0.14737681893787208 * keras_input_1_rn.`Feature_36` + 0.2809610797975872 * keras_input_1_rn.`Feature_37` + -0.29205172013274117 * keras_input_1_rn.`Feature_38` + 0.27014606799424234 * keras_input_1_rn.`Feature_39` + 0.10154214781521126 * keras_input_1_rn.`Feature_40` + -0.3366634435683053 * keras_input_1_rn.`Feature_41` + -0.11885576416229768 * keras_input_1_rn.`Feature_42` + 0.19932602808060473 * keras_input_1_rn.`Feature_43` + 0.12037276623325699 * keras_input_1_rn.`Feature_44` + -0.25801595664298327 * keras_input_1_rn.`Feature_45` + -0.2383195441890575 * keras_input_1_rn.`Feature_46` + 0.10316843481425698 * keras_input_1_rn.`Feature_47` + 0.038433689396120574 * keras_input_1_rn.`Feature_48` + -0.04498871247339368 * keras_input_1_rn.`Feature_49` + -0.056507288995065894 * keras_input_1_rn.`Feature_50` + 0.07818832471341286 * keras_input_1_rn.`Feature_51` + -0.0493460581062491 * keras_input_1_rn.`Feature_52` + 0.18546428712381272 * keras_input_1_rn.`Feature_53` + 0.2608501921827988 * keras_input_1_rn.`Feature_54` + 0.2569105266757981 * keras_input_1_rn.`Feature_55` + -0.061162269902769933 * keras_input_1_rn.`Feature_56` + -0.09077665450920153 * keras_input_1_rn.`Feature_57` + -0.004562318793551525 * keras_input_1_rn.`Feature_58` + -0.2663977972443552 * keras_input_1_rn.`Feature_59` + -0.23343249851832681 * keras_input_1_rn.`Feature_60` + -0.28212431107585895 * keras_input_1_rn.`Feature_61` + 0.007122645165645174 * keras_input_1_rn.`Feature_62` + 0.14939741016003538 * keras_input_1_rn.`Feature_63` AS dot_prod_2 
FROM keras_input_1_rn), 
rnn_cte_simple_rnn_1(rn_1, `KEY`, `PreviousState_1`, `PreviousState_2`, output_1, output_2, `State_1`, `State_2`) AS 
(SELECT input_kernel_bias.rn AS rn_1, input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, input_kernel_bias.dot_prod_1 + 0.0 AS output_1, input_kernel_bias.dot_prod_2 + 0.0 AS output_2, input_kernel_bias.dot_prod_1 + 0.0 AS `State_1`, input_kernel_bias.dot_prod_2 + 0.0 AS `State_2` 
FROM input_kernel_bias 
WHERE input_kernel_bias.rn = 1 UNION ALL SELECT input_kernel_bias.rn AS rn, input_kernel_bias.`KEY` AS `KEY`, rnn_cte_simple_rnn_1.`State_1` AS `PreviousState_1`, rnn_cte_simple_rnn_1.`State_2` AS `PreviousState_2`, input_kernel_bias.dot_prod_1 + 0.16076037524451417 * rnn_cte_simple_rnn_1.`State_1` + 1.0074402296758314 * rnn_cte_simple_rnn_1.`State_2` AS output_1, input_kernel_bias.dot_prod_2 + 0.9680921426027999 * rnn_cte_simple_rnn_1.`State_1` + -0.1806170349601314 * rnn_cte_simple_rnn_1.`State_2` AS output_2, input_kernel_bias.dot_prod_1 + 0.16076037524451417 * rnn_cte_simple_rnn_1.`State_1` + 1.0074402296758314 * rnn_cte_simple_rnn_1.`State_2` AS `State_1`, input_kernel_bias.dot_prod_2 + 0.9680921426027999 * rnn_cte_simple_rnn_1.`State_1` + -0.1806170349601314 * rnn_cte_simple_rnn_1.`State_2` AS `State_2` 
FROM input_kernel_bias, rnn_cte_simple_rnn_1 
WHERE input_kernel_bias.rn = rnn_cte_simple_rnn_1.rn_1 + 1), 
simple_rnn_1 AS 
(SELECT rnn_cte_simple_rnn_1.`KEY` AS `KEY`, CAST(rnn_cte_simple_rnn_1.output_1 AS DOUBLE) AS output_1, CAST(rnn_cte_simple_rnn_1.output_2 AS DOUBLE) AS output_2 
FROM rnn_cte_simple_rnn_1), 
simple_rnn_1_1 AS 
(SELECT simple_rnn_1.`KEY` AS `KEY`, simple_rnn_1.output_1 AS output_1, simple_rnn_1.output_2 AS output_2 
FROM simple_rnn_1), 
layer_dense_1 AS 
(SELECT simple_rnn_1_1.`KEY` AS `KEY`, -0.00010949891431933 + 0.5141007137792908 * simple_rnn_1_1.output_1 + 0.6917126831649243 * simple_rnn_1_1.output_2 AS output_1, 0.006005552507993126 + -0.27537247548533805 * simple_rnn_1_1.output_1 + 0.6854346916947671 * simple_rnn_1_1.output_2 AS output_2, 0.02969904691418269 + -0.5681930160230729 * simple_rnn_1_1.output_1 + -0.39388927921292094 * simple_rnn_1_1.output_2 AS output_3, -0.019564948456405024 + -0.4724842999378844 * simple_rnn_1_1.output_1 + 0.24731953973675397 * simple_rnn_1_1.output_2 AS output_4, -6.302181644680755e-05 + 0.6191775580816602 * simple_rnn_1_1.output_1 + 0.002662056593707722 * simple_rnn_1_1.output_2 AS output_5, -0.006005539554730309 + -0.4723042688233621 * simple_rnn_1_1.output_1 + -0.1631344957765395 * simple_rnn_1_1.output_2 AS output_6, -0.03419944074974842 + -0.45698233866102317 * simple_rnn_1_1.output_1 + -0.6237248894384742 * simple_rnn_1_1.output_2 AS output_7, -0.005984976474580252 + -0.04325231616721191 * simple_rnn_1_1.output_1 + 0.16038208244552585 * simple_rnn_1_1.output_2 AS output_8, -0.005987383904124166 + -0.04487944145503596 * simple_rnn_1_1.output_1 + 0.0978295814733045 * simple_rnn_1_1.output_2 AS output_9, -0.005859152321912127 + 0.06800959389615577 * simple_rnn_1_1.output_1 + 0.3113852153790152 * simple_rnn_1_1.output_2 AS output_10 
FROM simple_rnn_1_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2, layer_dense_1.output_3 AS output_3, layer_dense_1.output_4 AS output_4, layer_dense_1.output_5 AS output_5, layer_dense_1.output_6 AS output_6, layer_dense_1.output_7 AS output_7, layer_dense_1.output_8 AS output_8, layer_dense_1.output_9 AS output_9, layer_dense_1.output_10 AS output_10 
FROM layer_dense_1), 
score_soft_max_step1 AS 
(SELECT layer_dense_1_1.`KEY` AS `KEY`, layer_dense_1_1.output_1 AS `Score_0`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_1))) AS `exp_Score_0`, layer_dense_1_1.output_2 AS `Score_1`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_2))) AS `exp_Score_1`, layer_dense_1_1.output_3 AS `Score_2`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_3))) AS `exp_Score_2`, layer_dense_1_1.output_4 AS `Score_3`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_4))) AS `exp_Score_3`, layer_dense_1_1.output_5 AS `Score_4`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_5))) AS `exp_Score_4`, layer_dense_1_1.output_6 AS `Score_5`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_6))) AS `exp_Score_5`, layer_dense_1_1.output_7 AS `Score_6`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_7))) AS `exp_Score_6`, layer_dense_1_1.output_8 AS `Score_7`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_8))) AS `exp_Score_7`, layer_dense_1_1.output_9 AS `Score_8`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_9))) AS `exp_Score_8`, layer_dense_1_1.output_10 AS `Score_9`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_10))) AS `exp_Score_9` 
FROM layer_dense_1_1), 
score_class_union_soft AS 
(SELECT soft_scu.`KEY` AS `KEY`, soft_scu.class AS class, soft_scu.`exp_Score` AS `exp_Score` 
FROM (SELECT score_soft_max_step1.`KEY` AS `KEY`, 0 AS class, score_soft_max_step1.`exp_Score_0` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 1 AS class, score_soft_max_step1.`exp_Score_1` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 2 AS class, score_soft_max_step1.`exp_Score_2` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 3 AS class, score_soft_max_step1.`exp_Score_3` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 4 AS class, score_soft_max_step1.`exp_Score_4` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 5 AS class, score_soft_max_step1.`exp_Score_5` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 6 AS class, score_soft_max_step1.`exp_Score_6` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 7 AS class, score_soft_max_step1.`exp_Score_7` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 8 AS class, score_soft_max_step1.`exp_Score_8` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 9 AS class, score_soft_max_step1.`exp_Score_9` AS `exp_Score` 
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1.`KEY` AS `KEY`, score_soft_max_step1.`Score_0` AS `Score_0`, score_soft_max_step1.`exp_Score_0` AS `exp_Score_0`, score_soft_max_step1.`Score_1` AS `Score_1`, score_soft_max_step1.`exp_Score_1` AS `exp_Score_1`, score_soft_max_step1.`Score_2` AS `Score_2`, score_soft_max_step1.`exp_Score_2` AS `exp_Score_2`, score_soft_max_step1.`Score_3` AS `Score_3`, score_soft_max_step1.`exp_Score_3` AS `exp_Score_3`, score_soft_max_step1.`Score_4` AS `Score_4`, score_soft_max_step1.`exp_Score_4` AS `exp_Score_4`, score_soft_max_step1.`Score_5` AS `Score_5`, score_soft_max_step1.`exp_Score_5` AS `exp_Score_5`, score_soft_max_step1.`Score_6` AS `Score_6`, score_soft_max_step1.`exp_Score_6` AS `exp_Score_6`, score_soft_max_step1.`Score_7` AS `Score_7`, score_soft_max_step1.`exp_Score_7` AS `exp_Score_7`, score_soft_max_step1.`Score_8` AS `Score_8`, score_soft_max_step1.`exp_Score_8` AS `exp_Score_8`, score_soft_max_step1.`Score_9` AS `Score_9`, score_soft_max_step1.`exp_Score_9` AS `exp_Score_9`, sum_exp_t.`KEY_sum` AS `KEY_sum`, sum_exp_t.`sum_ExpScore` AS `sum_ExpScore` 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft.`KEY` AS `KEY_sum`, sum(score_class_union_soft.`exp_Score`) AS `sum_ExpScore` 
FROM score_class_union_soft GROUP BY score_class_union_soft.`KEY`) AS sum_exp_t ON score_soft_max_step1.`KEY` = sum_exp_t.`KEY_sum`), 
layer_softmax AS 
(SELECT score_soft_max.`KEY` AS `KEY`, score_soft_max.`exp_Score_0` / score_soft_max.`sum_ExpScore` AS output_1, score_soft_max.`exp_Score_1` / score_soft_max.`sum_ExpScore` AS output_2, score_soft_max.`exp_Score_2` / score_soft_max.`sum_ExpScore` AS output_3, score_soft_max.`exp_Score_3` / score_soft_max.`sum_ExpScore` AS output_4, score_soft_max.`exp_Score_4` / score_soft_max.`sum_ExpScore` AS output_5, score_soft_max.`exp_Score_5` / score_soft_max.`sum_ExpScore` AS output_6, score_soft_max.`exp_Score_6` / score_soft_max.`sum_ExpScore` AS output_7, score_soft_max.`exp_Score_7` / score_soft_max.`sum_ExpScore` AS output_8, score_soft_max.`exp_Score_8` / score_soft_max.`sum_ExpScore` AS output_9, score_soft_max.`exp_Score_9` / score_soft_max.`sum_ExpScore` AS output_10 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, NULL AS `Score_2`, NULL AS `Score_3`, NULL AS `Score_4`, NULL AS `Score_5`, NULL AS `Score_6`, NULL AS `Score_7`, NULL AS `Score_8`, NULL AS `Score_9`, layer_softmax.output_1 AS `Proba_0`, layer_softmax.output_2 AS `Proba_1`, layer_softmax.output_3 AS `Proba_2`, layer_softmax.output_4 AS `Proba_3`, layer_softmax.output_5 AS `Proba_4`, layer_softmax.output_6 AS `Proba_5`, layer_softmax.output_7 AS `Proba_6`, layer_softmax.output_8 AS `Proba_7`, layer_softmax.output_9 AS `Proba_8`, layer_softmax.output_10 AS `Proba_9`, NULL AS `LogProba_0`, NULL AS `LogProba_1`, NULL AS `LogProba_2`, NULL AS `LogProba_3`, NULL AS `LogProba_4`, NULL AS `LogProba_5`, NULL AS `LogProba_6`, NULL AS `LogProba_7`, NULL AS `LogProba_8`, NULL AS `LogProba_9`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 0 AS class, orig_cte.`LogProba_0` AS `LogProba`, orig_cte.`Proba_0` AS `Proba`, orig_cte.`Score_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 1 AS class, orig_cte.`LogProba_1` AS `LogProba`, orig_cte.`Proba_1` AS `Proba`, orig_cte.`Score_1` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 2 AS class, orig_cte.`LogProba_2` AS `LogProba`, orig_cte.`Proba_2` AS `Proba`, orig_cte.`Score_2` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 3 AS class, orig_cte.`LogProba_3` AS `LogProba`, orig_cte.`Proba_3` AS `Proba`, orig_cte.`Score_3` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 4 AS class, orig_cte.`LogProba_4` AS `LogProba`, orig_cte.`Proba_4` AS `Proba`, orig_cte.`Score_4` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 5 AS class, orig_cte.`LogProba_5` AS `LogProba`, orig_cte.`Proba_5` AS `Proba`, orig_cte.`Score_5` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 6 AS class, orig_cte.`LogProba_6` AS `LogProba`, orig_cte.`Proba_6` AS `Proba`, orig_cte.`Score_6` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 7 AS class, orig_cte.`LogProba_7` AS `LogProba`, orig_cte.`Proba_7` AS `Proba`, orig_cte.`Score_7` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 8 AS class, orig_cte.`LogProba_8` AS `LogProba`, orig_cte.`Proba_8` AS `Proba`, orig_cte.`Score_8` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 9 AS class, orig_cte.`LogProba_9` AS `LogProba`, orig_cte.`Proba_9` AS `Proba`, orig_cte.`Score_9` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_0` AS `Score_0`, orig_cte.`Score_1` AS `Score_1`, orig_cte.`Score_2` AS `Score_2`, orig_cte.`Score_3` AS `Score_3`, orig_cte.`Score_4` AS `Score_4`, orig_cte.`Score_5` AS `Score_5`, orig_cte.`Score_6` AS `Score_6`, orig_cte.`Score_7` AS `Score_7`, orig_cte.`Score_8` AS `Score_8`, orig_cte.`Score_9` AS `Score_9`, orig_cte.`Proba_0` AS `Proba_0`, orig_cte.`Proba_1` AS `Proba_1`, orig_cte.`Proba_2` AS `Proba_2`, orig_cte.`Proba_3` AS `Proba_3`, orig_cte.`Proba_4` AS `Proba_4`, orig_cte.`Proba_5` AS `Proba_5`, orig_cte.`Proba_6` AS `Proba_6`, orig_cte.`Proba_7` AS `Proba_7`, orig_cte.`Proba_8` AS `Proba_8`, orig_cte.`Proba_9` AS `Proba_9`, orig_cte.`LogProba_0` AS `LogProba_0`, orig_cte.`LogProba_1` AS `LogProba_1`, orig_cte.`LogProba_2` AS `LogProba_2`, orig_cte.`LogProba_3` AS `LogProba_3`, orig_cte.`LogProba_4` AS `LogProba_4`, orig_cte.`LogProba_5` AS `LogProba_5`, orig_cte.`LogProba_6` AS `LogProba_6`, orig_cte.`LogProba_7` AS `LogProba_7`, orig_cte.`LogProba_8` AS `LogProba_8`, orig_cte.`LogProba_9` AS `LogProba_9`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Proba` AS `max_Proba` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Proba`) AS `max_Proba` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Score_4` AS `Score_4`, score_max.`Score_5` AS `Score_5`, score_max.`Score_6` AS `Score_6`, score_max.`Score_7` AS `Score_7`, score_max.`Score_8` AS `Score_8`, score_max.`Score_9` AS `Score_9`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`Proba_4` AS `Proba_4`, score_max.`Proba_5` AS `Proba_5`, score_max.`Proba_6` AS `Proba_6`, score_max.`Proba_7` AS `Proba_7`, score_max.`Proba_8` AS `Proba_8`, score_max.`Proba_9` AS `Proba_9`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`LogProba_4` AS `LogProba_4`, score_max.`LogProba_5` AS `LogProba_5`, score_max.`LogProba_6` AS `LogProba_6`, score_max.`LogProba_7` AS `LogProba_7`, score_max.`LogProba_8` AS `LogProba_8`, score_max.`LogProba_9` AS `LogProba_9`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba` 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.`KEY_u` = score_max.`KEY`), 
arg_max_cte AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Score_4` AS `Score_4`, score_max.`Score_5` AS `Score_5`, score_max.`Score_6` AS `Score_6`, score_max.`Score_7` AS `Score_7`, score_max.`Score_8` AS `Score_8`, score_max.`Score_9` AS `Score_9`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`Proba_4` AS `Proba_4`, score_max.`Proba_5` AS `Proba_5`, score_max.`Proba_6` AS `Proba_6`, score_max.`Proba_7` AS `Proba_7`, score_max.`Proba_8` AS `Proba_8`, score_max.`Proba_9` AS `Proba_9`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`LogProba_4` AS `LogProba_4`, score_max.`LogProba_5` AS `LogProba_5`, score_max.`LogProba_6` AS `LogProba_6`, score_max.`LogProba_7` AS `LogProba_7`, score_max.`LogProba_8` AS `LogProba_8`, score_max.`LogProba_9` AS `LogProba_9`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba`, `arg_max_t_Proba`.`KEY_Proba` AS `KEY_Proba`, `arg_max_t_Proba`.`arg_max_Proba` AS `arg_max_Proba` 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Proba`, max(union_with_max.class) AS `arg_max_Proba` 
FROM union_with_max 
WHERE union_with_max.`max_Proba` <= union_with_max.`Proba` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Proba` ON score_max.`KEY` = `arg_max_t_Proba`.`KEY_Proba`)
 SELECT arg_max_cte.`KEY` AS `KEY`, arg_max_cte.`Score_0` AS `Score_0`, arg_max_cte.`Score_1` AS `Score_1`, arg_max_cte.`Score_2` AS `Score_2`, arg_max_cte.`Score_3` AS `Score_3`, arg_max_cte.`Score_4` AS `Score_4`, arg_max_cte.`Score_5` AS `Score_5`, arg_max_cte.`Score_6` AS `Score_6`, arg_max_cte.`Score_7` AS `Score_7`, arg_max_cte.`Score_8` AS `Score_8`, arg_max_cte.`Score_9` AS `Score_9`, arg_max_cte.`Proba_0` AS `Proba_0`, arg_max_cte.`Proba_1` AS `Proba_1`, arg_max_cte.`Proba_2` AS `Proba_2`, arg_max_cte.`Proba_3` AS `Proba_3`, arg_max_cte.`Proba_4` AS `Proba_4`, arg_max_cte.`Proba_5` AS `Proba_5`, arg_max_cte.`Proba_6` AS `Proba_6`, arg_max_cte.`Proba_7` AS `Proba_7`, arg_max_cte.`Proba_8` AS `Proba_8`, arg_max_cte.`Proba_9` AS `Proba_9`, CASE WHEN (arg_max_cte.`Proba_0` IS NULL OR arg_max_cte.`Proba_0` > 0.0) THEN ln(arg_max_cte.`Proba_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (arg_max_cte.`Proba_1` IS NULL OR arg_max_cte.`Proba_1` > 0.0) THEN ln(arg_max_cte.`Proba_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (arg_max_cte.`Proba_2` IS NULL OR arg_max_cte.`Proba_2` > 0.0) THEN ln(arg_max_cte.`Proba_2`) ELSE -1.79769313486231e+308 END AS `LogProba_2`, CASE WHEN (arg_max_cte.`Proba_3` IS NULL OR arg_max_cte.`Proba_3` > 0.0) THEN ln(arg_max_cte.`Proba_3`) ELSE -1.79769313486231e+308 END AS `LogProba_3`, CASE WHEN (arg_max_cte.`Proba_4` IS NULL OR arg_max_cte.`Proba_4` > 0.0) THEN ln(arg_max_cte.`Proba_4`) ELSE -1.79769313486231e+308 END AS `LogProba_4`, CASE WHEN (arg_max_cte.`Proba_5` IS NULL OR arg_max_cte.`Proba_5` > 0.0) THEN ln(arg_max_cte.`Proba_5`) ELSE -1.79769313486231e+308 END AS `LogProba_5`, CASE WHEN (arg_max_cte.`Proba_6` IS NULL OR arg_max_cte.`Proba_6` > 0.0) THEN ln(arg_max_cte.`Proba_6`) ELSE -1.79769313486231e+308 END AS `LogProba_6`, CASE WHEN (arg_max_cte.`Proba_7` IS NULL OR arg_max_cte.`Proba_7` > 0.0) THEN ln(arg_max_cte.`Proba_7`) ELSE -1.79769313486231e+308 END AS `LogProba_7`, CASE WHEN (arg_max_cte.`Proba_8` IS NULL OR arg_max_cte.`Proba_8` > 0.0) THEN ln(arg_max_cte.`Proba_8`) ELSE -1.79769313486231e+308 END AS `LogProba_8`, CASE WHEN (arg_max_cte.`Proba_9` IS NULL OR arg_max_cte.`Proba_9` > 0.0) THEN ln(arg_max_cte.`Proba_9`) ELSE -1.79769313486231e+308 END AS `LogProba_9`, arg_max_cte.`arg_max_Proba` AS `Decision`, arg_max_cte.`max_Proba` AS `DecisionProba` 
FROM arg_max_cte