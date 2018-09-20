-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_GRU
-- Dataset : FourClass_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3`, `ADS`.`Feature_4` AS `Feature_4`, `ADS`.`Feature_5` AS `Feature_5`, `ADS`.`Feature_6` AS `Feature_6`, `ADS`.`Feature_7` AS `Feature_7`, `ADS`.`Feature_8` AS `Feature_8`, `ADS`.`Feature_9` AS `Feature_9` 
FROM `FourClass_10` AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3`, keras_input.`Feature_4` AS `Feature_4`, keras_input.`Feature_5` AS `Feature_5`, keras_input.`Feature_6` AS `Feature_6`, keras_input.`Feature_7` AS `Feature_7`, keras_input.`Feature_8` AS `Feature_8`, keras_input.`Feature_9` AS `Feature_9` 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.`KEY` ASC) AS rn, keras_input_1.`KEY` AS `KEY`, keras_input_1.`Feature_0` AS `Feature_0`, keras_input_1.`Feature_1` AS `Feature_1`, keras_input_1.`Feature_2` AS `Feature_2`, keras_input_1.`Feature_3` AS `Feature_3`, keras_input_1.`Feature_4` AS `Feature_4`, keras_input_1.`Feature_5` AS `Feature_5`, keras_input_1.`Feature_6` AS `Feature_6`, keras_input_1.`Feature_7` AS `Feature_7`, keras_input_1.`Feature_8` AS `Feature_8`, keras_input_1.`Feature_9` AS `Feature_9` 
FROM keras_input_1), 
gru_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.`KEY` AS `KEY`, keras_input_1_rn.`Feature_0` AS `Feature_0`, keras_input_1_rn.`Feature_1` AS `Feature_1`, keras_input_1_rn.`Feature_2` AS `Feature_2`, keras_input_1_rn.`Feature_3` AS `Feature_3`, keras_input_1_rn.`Feature_4` AS `Feature_4`, keras_input_1_rn.`Feature_5` AS `Feature_5`, keras_input_1_rn.`Feature_6` AS `Feature_6`, keras_input_1_rn.`Feature_7` AS `Feature_7`, keras_input_1_rn.`Feature_8` AS `Feature_8`, keras_input_1_rn.`Feature_9` AS `Feature_9`, -0.07590537006657933 + -0.141123059317847 * keras_input_1_rn.`Feature_0` + 0.36249886859799596 * keras_input_1_rn.`Feature_1` + -0.06593658507303765 * keras_input_1_rn.`Feature_2` + 0.04048211718263451 * keras_input_1_rn.`Feature_3` + -0.04430818829431449 * keras_input_1_rn.`Feature_4` + 0.11953319837719782 * keras_input_1_rn.`Feature_5` + 0.12669142862061852 * keras_input_1_rn.`Feature_6` + 0.39926326532045536 * keras_input_1_rn.`Feature_7` + 0.6813955686902439 * keras_input_1_rn.`Feature_8` + -0.2084866354807344 * keras_input_1_rn.`Feature_9` AS dot_prod_z_1, -0.5726205687287897 + 0.3689594321593279 * keras_input_1_rn.`Feature_0` + -0.26051553826489776 * keras_input_1_rn.`Feature_1` + 0.4119843915208104 * keras_input_1_rn.`Feature_2` + 0.37838536046582505 * keras_input_1_rn.`Feature_3` + 0.35840442202389156 * keras_input_1_rn.`Feature_4` + 0.5802225624601679 * keras_input_1_rn.`Feature_5` + 0.1601539066167746 * keras_input_1_rn.`Feature_6` + -0.13290862890302316 * keras_input_1_rn.`Feature_7` + 0.0059721832107798075 * keras_input_1_rn.`Feature_8` + 0.15983818339645706 * keras_input_1_rn.`Feature_9` AS dot_prod_z_2, 0.0 + -0.378834269310854 * keras_input_1_rn.`Feature_0` + -0.4846040888531703 * keras_input_1_rn.`Feature_1` + -0.5947360746917778 * keras_input_1_rn.`Feature_2` + -0.5235510035996684 * keras_input_1_rn.`Feature_3` + -0.44771291896500787 * keras_input_1_rn.`Feature_4` + 0.26900032613124025 * keras_input_1_rn.`Feature_5` + 0.012224205431599855 * keras_input_1_rn.`Feature_6` + -0.4825366546619857 * keras_input_1_rn.`Feature_7` + 0.20956737314283447 * keras_input_1_rn.`Feature_8` + -0.044876543870373875 * keras_input_1_rn.`Feature_9` AS dot_prod_r_1, 0.0 + -0.2283105461114897 * keras_input_1_rn.`Feature_0` + 0.10090713818814001 * keras_input_1_rn.`Feature_1` + -0.22062014088424453 * keras_input_1_rn.`Feature_2` + -0.3135517847005039 * keras_input_1_rn.`Feature_3` + 0.6022551430623415 * keras_input_1_rn.`Feature_4` + -0.30838936457159694 * keras_input_1_rn.`Feature_5` + -0.3393095033599692 * keras_input_1_rn.`Feature_6` + 0.1494208550049828 * keras_input_1_rn.`Feature_7` + 0.051985396338829926 * keras_input_1_rn.`Feature_8` + 0.252876477286719 * keras_input_1_rn.`Feature_9` AS dot_prod_r_2, -0.1775599501542067 + -0.46562250751029094 * keras_input_1_rn.`Feature_0` + -0.3744526499761688 * keras_input_1_rn.`Feature_1` + 0.016496597852271547 * keras_input_1_rn.`Feature_2` + 0.5139046036663892 * keras_input_1_rn.`Feature_3` + -0.19559227961703562 * keras_input_1_rn.`Feature_4` + -0.15394608097224366 * keras_input_1_rn.`Feature_5` + -0.8522777441574373 * keras_input_1_rn.`Feature_6` + -0.3397191969838155 * keras_input_1_rn.`Feature_7` + -0.3811407970764787 * keras_input_1_rn.`Feature_8` + -0.24619574017517265 * keras_input_1_rn.`Feature_9` AS dot_prod_h_1, 0.0834057722832614 + 0.2063466191279303 * keras_input_1_rn.`Feature_0` + -0.18284769926662878 * keras_input_1_rn.`Feature_1` + 0.19698993467351172 * keras_input_1_rn.`Feature_2` + -0.1909193769264036 * keras_input_1_rn.`Feature_3` + 0.7458374969712624 * keras_input_1_rn.`Feature_4` + -0.02276244927345805 * keras_input_1_rn.`Feature_5` + 0.3203985974380626 * keras_input_1_rn.`Feature_6` + 0.5691676021554345 * keras_input_1_rn.`Feature_7` + 0.1119841775879986 * keras_input_1_rn.`Feature_8` + 0.3134116635891637 * keras_input_1_rn.`Feature_9` AS dot_prod_h_2 
FROM keras_input_1_rn), 
rnn_cte_gru_1(rn_1, `KEY`, `PreviousState_1`, `PreviousState_2`, `State_1`, `State_2`) AS 
(SELECT gru_input_kernel_bias.rn AS rn_1, gru_input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, (1.0 - greatest(0.0, least(1.0, 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5))) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1)))) AS `State_1`, (1.0 - greatest(0.0, least(1.0, 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5))) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2)))) AS `State_2` 
FROM gru_input_kernel_bias 
WHERE gru_input_kernel_bias.rn = 1 UNION ALL SELECT gru_input_kernel_bias.rn AS rn, gru_input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, greatest(0.0, least(1.0, 0.2 * (0.07889305402131672 * CAST(0.0 AS DOUBLE) + -0.12001338771399168 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_1) + 0.5)) * CAST(0.0 AS DOUBLE) + (1.0 - greatest(0.0, least(1.0, 0.2 * (0.07889305402131672 * CAST(0.0 AS DOUBLE) + -0.12001338771399168 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_1) + 0.5))) * ((exp(0.19308494093258327 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.7665848473643189 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1) - exp(-(0.19308494093258327 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.7665848473643189 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1))) / (exp(0.19308494093258327 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.7665848473643189 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1) + exp(-(0.19308494093258327 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.7665848473643189 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1)))) AS `State_1`, greatest(0.0, least(1.0, 0.2 * (-0.034960511057912716 * CAST(0.0 AS DOUBLE) + -0.14062053889322335 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_2) + 0.5)) * CAST(0.0 AS DOUBLE) + (1.0 - greatest(0.0, least(1.0, 0.2 * (-0.034960511057912716 * CAST(0.0 AS DOUBLE) + -0.14062053889322335 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_2) + 0.5))) * ((exp(0.8028151871906004 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + -0.4545734405306024 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2) - exp(-(0.8028151871906004 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + -0.4545734405306024 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2))) / (exp(0.8028151871906004 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + -0.4545734405306024 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2) + exp(-(0.8028151871906004 * greatest(0.0, least(1.0, 0.2 * (-0.1888178280225422 * CAST(0.0 AS DOUBLE) + -0.24466095906319685 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + -0.4545734405306024 * greatest(0.0, least(1.0, 0.2 * (-0.5245068706087566 * CAST(0.0 AS DOUBLE) + -0.3341770861035541 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2)))) AS `State_2` 
FROM gru_input_kernel_bias, rnn_cte_gru_1 
WHERE gru_input_kernel_bias.rn = rnn_cte_gru_1.rn_1 + 1), 
gru_1 AS 
(SELECT rnn_cte_gru_1.`KEY` AS `KEY`, CAST(rnn_cte_gru_1.`State_1` AS DOUBLE) AS output_1, CAST(rnn_cte_gru_1.`State_2` AS DOUBLE) AS output_2 
FROM rnn_cte_gru_1), 
gru_1_1 AS 
(SELECT gru_1.`KEY` AS `KEY`, gru_1.output_1 AS output_1, gru_1.output_2 AS output_2 
FROM gru_1), 
layer_dense_1 AS 
(SELECT gru_1_1.`KEY` AS `KEY`, -0.01365678402004269 + -0.15200304869231732 * gru_1_1.output_1 + 0.15857528828469777 * gru_1_1.output_2 AS output_1, -0.024361167646464052 + 0.9202780143475691 * gru_1_1.output_1 + -0.6707470248331148 * gru_1_1.output_2 AS output_2, -0.005673039634456491 + -0.7668154765881715 * gru_1_1.output_1 + -1.0898859852353584 * gru_1_1.output_2 AS output_3, 0.0299747567713659 + 0.013940913370601517 * gru_1_1.output_1 + -1.3157788545669638 * gru_1_1.output_2 AS output_4 
FROM gru_1_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2, layer_dense_1.output_3 AS output_3, layer_dense_1.output_4 AS output_4 
FROM layer_dense_1), 
score_soft_max_step1 AS 
(SELECT layer_dense_1_1.`KEY` AS `KEY`, layer_dense_1_1.output_1 AS `Score_0`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_1))) AS `exp_Score_0`, layer_dense_1_1.output_2 AS `Score_1`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_2))) AS `exp_Score_1`, layer_dense_1_1.output_3 AS `Score_2`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_3))) AS `exp_Score_2`, layer_dense_1_1.output_4 AS `Score_3`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_4))) AS `exp_Score_3` 
FROM layer_dense_1_1), 
score_class_union_soft AS 
(SELECT soft_scu.`KEY` AS `KEY`, soft_scu.class AS class, soft_scu.`exp_Score` AS `exp_Score` 
FROM (SELECT score_soft_max_step1.`KEY` AS `KEY`, 0 AS class, score_soft_max_step1.`exp_Score_0` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 1 AS class, score_soft_max_step1.`exp_Score_1` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 2 AS class, score_soft_max_step1.`exp_Score_2` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 3 AS class, score_soft_max_step1.`exp_Score_3` AS `exp_Score` 
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1.`KEY` AS `KEY`, score_soft_max_step1.`Score_0` AS `Score_0`, score_soft_max_step1.`exp_Score_0` AS `exp_Score_0`, score_soft_max_step1.`Score_1` AS `Score_1`, score_soft_max_step1.`exp_Score_1` AS `exp_Score_1`, score_soft_max_step1.`Score_2` AS `Score_2`, score_soft_max_step1.`exp_Score_2` AS `exp_Score_2`, score_soft_max_step1.`Score_3` AS `Score_3`, score_soft_max_step1.`exp_Score_3` AS `exp_Score_3`, sum_exp_t.`KEY_sum` AS `KEY_sum`, sum_exp_t.`sum_ExpScore` AS `sum_ExpScore` 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft.`KEY` AS `KEY_sum`, sum(score_class_union_soft.`exp_Score`) AS `sum_ExpScore` 
FROM score_class_union_soft GROUP BY score_class_union_soft.`KEY`) AS sum_exp_t ON score_soft_max_step1.`KEY` = sum_exp_t.`KEY_sum`), 
layer_softmax AS 
(SELECT score_soft_max.`KEY` AS `KEY`, score_soft_max.`exp_Score_0` / score_soft_max.`sum_ExpScore` AS output_1, score_soft_max.`exp_Score_1` / score_soft_max.`sum_ExpScore` AS output_2, score_soft_max.`exp_Score_2` / score_soft_max.`sum_ExpScore` AS output_3, score_soft_max.`exp_Score_3` / score_soft_max.`sum_ExpScore` AS output_4 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, NULL AS `Score_2`, NULL AS `Score_3`, layer_softmax.output_1 AS `Proba_0`, layer_softmax.output_2 AS `Proba_1`, layer_softmax.output_3 AS `Proba_2`, layer_softmax.output_4 AS `Proba_3`, NULL AS `LogProba_0`, NULL AS `LogProba_1`, NULL AS `LogProba_2`, NULL AS `LogProba_3`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 0 AS class, orig_cte.`LogProba_0` AS `LogProba`, orig_cte.`Proba_0` AS `Proba`, orig_cte.`Score_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 1 AS class, orig_cte.`LogProba_1` AS `LogProba`, orig_cte.`Proba_1` AS `Proba`, orig_cte.`Score_1` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 2 AS class, orig_cte.`LogProba_2` AS `LogProba`, orig_cte.`Proba_2` AS `Proba`, orig_cte.`Score_2` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 3 AS class, orig_cte.`LogProba_3` AS `LogProba`, orig_cte.`Proba_3` AS `Proba`, orig_cte.`Score_3` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_0` AS `Score_0`, orig_cte.`Score_1` AS `Score_1`, orig_cte.`Score_2` AS `Score_2`, orig_cte.`Score_3` AS `Score_3`, orig_cte.`Proba_0` AS `Proba_0`, orig_cte.`Proba_1` AS `Proba_1`, orig_cte.`Proba_2` AS `Proba_2`, orig_cte.`Proba_3` AS `Proba_3`, orig_cte.`LogProba_0` AS `LogProba_0`, orig_cte.`LogProba_1` AS `LogProba_1`, orig_cte.`LogProba_2` AS `LogProba_2`, orig_cte.`LogProba_3` AS `LogProba_3`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Proba` AS `max_Proba` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Proba`) AS `max_Proba` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba` 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.`KEY_u` = score_max.`KEY`), 
arg_max_cte AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba`, `arg_max_t_Proba`.`KEY_Proba` AS `KEY_Proba`, `arg_max_t_Proba`.`arg_max_Proba` AS `arg_max_Proba` 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Proba`, max(union_with_max.class) AS `arg_max_Proba` 
FROM union_with_max 
WHERE union_with_max.`max_Proba` <= union_with_max.`Proba` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Proba` ON score_max.`KEY` = `arg_max_t_Proba`.`KEY_Proba`)
 SELECT arg_max_cte.`KEY` AS `KEY`, arg_max_cte.`Score_0` AS `Score_0`, arg_max_cte.`Score_1` AS `Score_1`, arg_max_cte.`Score_2` AS `Score_2`, arg_max_cte.`Score_3` AS `Score_3`, arg_max_cte.`Proba_0` AS `Proba_0`, arg_max_cte.`Proba_1` AS `Proba_1`, arg_max_cte.`Proba_2` AS `Proba_2`, arg_max_cte.`Proba_3` AS `Proba_3`, CASE WHEN (arg_max_cte.`Proba_0` IS NULL OR arg_max_cte.`Proba_0` > 0.0) THEN ln(arg_max_cte.`Proba_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (arg_max_cte.`Proba_1` IS NULL OR arg_max_cte.`Proba_1` > 0.0) THEN ln(arg_max_cte.`Proba_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (arg_max_cte.`Proba_2` IS NULL OR arg_max_cte.`Proba_2` > 0.0) THEN ln(arg_max_cte.`Proba_2`) ELSE -1.79769313486231e+308 END AS `LogProba_2`, CASE WHEN (arg_max_cte.`Proba_3` IS NULL OR arg_max_cte.`Proba_3` > 0.0) THEN ln(arg_max_cte.`Proba_3`) ELSE -1.79769313486231e+308 END AS `LogProba_3`, arg_max_cte.`arg_max_Proba` AS `Decision`, arg_max_cte.`max_Proba` AS `DecisionProba` 
FROM arg_max_cte