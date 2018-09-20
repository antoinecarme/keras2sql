-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_SimpleRNN
-- Dataset : iris_str_tgt
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3" 
FROM "IRIS_STR_TGT" "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3" 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1."KEY" ASC) AS rn, keras_input_1."KEY" AS "KEY", keras_input_1."Feature_0" AS "Feature_0", keras_input_1."Feature_1" AS "Feature_1", keras_input_1."Feature_2" AS "Feature_2", keras_input_1."Feature_3" AS "Feature_3" 
FROM keras_input_1), 
input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", 0.013038184322365531 + -0.11984377954022961 * keras_input_1_rn."Feature_0" + -0.6019564383090352 * keras_input_1_rn."Feature_1" + -0.7311786975898455 * keras_input_1_rn."Feature_2" + 0.48382747139645976 * keras_input_1_rn."Feature_3" AS dot_prod_1, 0.02435713529331841 + 0.7540278953406487 * keras_input_1_rn."Feature_0" + -0.34969770658614774 * keras_input_1_rn."Feature_1" + 0.45179717332406594 * keras_input_1_rn."Feature_2" + -0.11651891264026905 * keras_input_1_rn."Feature_3" AS dot_prod_2 
FROM keras_input_1_rn), 
rnn_cte_simple_rnn_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", output_1, output_2, "State_1", "State_2") AS 
(SELECT input_kernel_bias.rn AS rn_1, input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_1", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_2", input_kernel_bias.dot_prod_1 + 0.0 AS output_1, input_kernel_bias.dot_prod_2 + 0.0 AS output_2, input_kernel_bias.dot_prod_1 + 0.0 AS "State_1", input_kernel_bias.dot_prod_2 + 0.0 AS "State_2" 
FROM input_kernel_bias 
WHERE input_kernel_bias.rn = 1 UNION ALL SELECT input_kernel_bias.rn AS rn, input_kernel_bias."KEY" AS "KEY", rnn_cte_simple_rnn_1."State_1" AS "PreviousState_1", rnn_cte_simple_rnn_1."State_2" AS "PreviousState_2", input_kernel_bias.dot_prod_1 + 0.07785012871922622 * rnn_cte_simple_rnn_1."State_1" + 0.9708781342235625 * rnn_cte_simple_rnn_1."State_2" AS output_1, input_kernel_bias.dot_prod_2 + 0.975017492456991 * rnn_cte_simple_rnn_1."State_1" + -0.19215324813291312 * rnn_cte_simple_rnn_1."State_2" AS output_2, input_kernel_bias.dot_prod_1 + 0.07785012871922622 * rnn_cte_simple_rnn_1."State_1" + 0.9708781342235625 * rnn_cte_simple_rnn_1."State_2" AS "State_1", input_kernel_bias.dot_prod_2 + 0.975017492456991 * rnn_cte_simple_rnn_1."State_1" + -0.19215324813291312 * rnn_cte_simple_rnn_1."State_2" AS "State_2" 
FROM input_kernel_bias, rnn_cte_simple_rnn_1 
WHERE input_kernel_bias.rn = rnn_cte_simple_rnn_1.rn_1 + 1), 
simple_rnn_1 AS 
(SELECT rnn_cte_simple_rnn_1."KEY" AS "KEY", CAST(rnn_cte_simple_rnn_1.output_1 AS BINARY_DOUBLE) AS output_1, CAST(rnn_cte_simple_rnn_1.output_2 AS BINARY_DOUBLE) AS output_2 
FROM rnn_cte_simple_rnn_1), 
simple_rnn_1_1 AS 
(SELECT simple_rnn_1."KEY" AS "KEY", simple_rnn_1.output_1 AS output_1, simple_rnn_1.output_2 AS output_2 
FROM simple_rnn_1), 
layer_dense_1 AS 
(SELECT simple_rnn_1_1."KEY" AS "KEY", 0.004919469515208939 + 0.7486449915274354 * simple_rnn_1_1.output_1 + -0.7800106813781961 * simple_rnn_1_1.output_2 AS output_1, 0.024330394183264176 + -0.4348973157162721 * simple_rnn_1_1.output_1 + 0.89410766597564 * simple_rnn_1_1.output_2 AS output_2, -0.025138002216917886 + -0.7903254817744962 * simple_rnn_1_1.output_1 + -0.688523326515222 * simple_rnn_1_1.output_2 AS output_3 
FROM simple_rnn_1_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2, layer_dense_1.output_3 AS output_3 
FROM layer_dense_1), 
score_soft_max_step1 AS 
(SELECT layer_dense_1_1."KEY" AS "KEY", layer_dense_1_1.output_1 AS "Score_0", exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_1))) AS "exp_Score_0", layer_dense_1_1.output_2 AS "Score_1", exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_2))) AS "exp_Score_1", layer_dense_1_1.output_3 AS "Score_2", exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_3))) AS "exp_Score_2" 
FROM layer_dense_1_1), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_Score" AS "exp_Score" 
FROM (SELECT score_soft_max_step1."KEY" AS "KEY", 0 AS class, score_soft_max_step1."exp_Score_0" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 1 AS class, score_soft_max_step1."exp_Score_1" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 2 AS class, score_soft_max_step1."exp_Score_2" AS "exp_Score" 
FROM score_soft_max_step1) soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1."KEY" AS "KEY", score_soft_max_step1."Score_0" AS "Score_0", score_soft_max_step1."exp_Score_0" AS "exp_Score_0", score_soft_max_step1."Score_1" AS "Score_1", score_soft_max_step1."exp_Score_1" AS "exp_Score_1", score_soft_max_step1."Score_2" AS "Score_2", score_soft_max_step1."exp_Score_2" AS "exp_Score_2", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpScore" AS "sum_ExpScore" 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_Score") AS "sum_ExpScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") sum_exp_t ON score_soft_max_step1."KEY" = sum_exp_t."KEY_sum"), 
layer_softmax AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."exp_Score_0" / score_soft_max."sum_ExpScore" AS output_1, score_soft_max."exp_Score_1" / score_soft_max."sum_ExpScore" AS output_2, score_soft_max."exp_Score_2" / score_soft_max."sum_ExpScore" AS output_3 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS BINARY_DOUBLE) AS "Score_CLASS_0", CAST(NULL AS BINARY_DOUBLE) AS "Score_CLASS_1", CAST(NULL AS BINARY_DOUBLE) AS "Score_CLASS_2", layer_softmax.output_1 AS "Proba_CLASS_0", layer_softmax.output_2 AS "Proba_CLASS_1", layer_softmax.output_3 AS "Proba_CLASS_2", CAST(NULL AS BINARY_DOUBLE) AS "LogProba_CLASS_0", CAST(NULL AS BINARY_DOUBLE) AS "LogProba_CLASS_1", CAST(NULL AS BINARY_DOUBLE) AS "LogProba_CLASS_2", CAST(NULL AS NUMBER(19)) AS "Decision", CAST(NULL AS BINARY_DOUBLE) AS "DecisionProba" 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 'CLASS_0' AS class, orig_cte."LogProba_CLASS_0" AS "LogProba", orig_cte."Proba_CLASS_0" AS "Proba", orig_cte."Score_CLASS_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 'CLASS_1' AS class, orig_cte."LogProba_CLASS_1" AS "LogProba", orig_cte."Proba_CLASS_1" AS "Proba", orig_cte."Score_CLASS_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 'CLASS_2' AS class, orig_cte."LogProba_CLASS_2" AS "LogProba", orig_cte."Proba_CLASS_2" AS "Proba", orig_cte."Score_CLASS_2" AS "Score" 
FROM orig_cte) scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_CLASS_0" AS "Score_CLASS_0", orig_cte."Score_CLASS_1" AS "Score_CLASS_1", orig_cte."Score_CLASS_2" AS "Score_CLASS_2", orig_cte."Proba_CLASS_0" AS "Proba_CLASS_0", orig_cte."Proba_CLASS_1" AS "Proba_CLASS_1", orig_cte."Proba_CLASS_2" AS "Proba_CLASS_2", orig_cte."LogProba_CLASS_0" AS "LogProba_CLASS_0", orig_cte."LogProba_CLASS_1" AS "LogProba_CLASS_1", orig_cte."LogProba_CLASS_2" AS "LogProba_CLASS_2", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_CLASS_0" AS "Score_CLASS_0", score_max."Score_CLASS_1" AS "Score_CLASS_1", score_max."Score_CLASS_2" AS "Score_CLASS_2", score_max."Proba_CLASS_0" AS "Proba_CLASS_0", score_max."Proba_CLASS_1" AS "Proba_CLASS_1", score_max."Proba_CLASS_2" AS "Proba_CLASS_2", score_max."LogProba_CLASS_0" AS "LogProba_CLASS_0", score_max."LogProba_CLASS_1" AS "LogProba_CLASS_1", score_max."LogProba_CLASS_2" AS "LogProba_CLASS_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_CLASS_0" AS "Score_CLASS_0", score_max."Score_CLASS_1" AS "Score_CLASS_1", score_max."Score_CLASS_2" AS "Score_CLASS_2", score_max."Proba_CLASS_0" AS "Proba_CLASS_0", score_max."Proba_CLASS_1" AS "Proba_CLASS_1", score_max."Proba_CLASS_2" AS "Proba_CLASS_2", score_max."LogProba_CLASS_0" AS "LogProba_CLASS_0", score_max."LogProba_CLASS_1" AS "LogProba_CLASS_1", score_max."LogProba_CLASS_2" AS "LogProba_CLASS_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_CLASS_0" AS "Score_CLASS_0", arg_max_cte."Score_CLASS_1" AS "Score_CLASS_1", arg_max_cte."Score_CLASS_2" AS "Score_CLASS_2", arg_max_cte."Proba_CLASS_0" AS "Proba_CLASS_0", arg_max_cte."Proba_CLASS_1" AS "Proba_CLASS_1", arg_max_cte."Proba_CLASS_2" AS "Proba_CLASS_2", CASE WHEN (arg_max_cte."Proba_CLASS_0" IS NULL OR arg_max_cte."Proba_CLASS_0" > 0.0) THEN ln(arg_max_cte."Proba_CLASS_0") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_CLASS_0", CASE WHEN (arg_max_cte."Proba_CLASS_1" IS NULL OR arg_max_cte."Proba_CLASS_1" > 0.0) THEN ln(arg_max_cte."Proba_CLASS_1") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_CLASS_1", CASE WHEN (arg_max_cte."Proba_CLASS_2" IS NULL OR arg_max_cte."Proba_CLASS_2" > 0.0) THEN ln(arg_max_cte."Proba_CLASS_2") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_CLASS_2", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte