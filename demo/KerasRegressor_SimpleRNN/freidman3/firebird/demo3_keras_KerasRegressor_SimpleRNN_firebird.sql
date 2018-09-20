-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_SimpleRNN
-- Dataset : freidman3
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3" 
FROM freidman3 AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3" 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT ROW_NUMBER() OVER (ORDER BY keras_input_1."KEY" ASC) AS rn, keras_input_1."KEY" AS "KEY", keras_input_1."Feature_0" AS "Feature_0", keras_input_1."Feature_1" AS "Feature_1", keras_input_1."Feature_2" AS "Feature_2", keras_input_1."Feature_3" AS "Feature_3" 
FROM keras_input_1), 
input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", 0.403679053466791 + 1.1445492319572428 * keras_input_1_rn."Feature_0" + -0.08591286769891436 * keras_input_1_rn."Feature_1" + 1.0489960815914983 * keras_input_1_rn."Feature_2" + 0.45488794607621374 * keras_input_1_rn."Feature_3" AS dot_prod_1, -0.3565074685011032 + -1.0233050139622584 * keras_input_1_rn."Feature_0" + 0.5714931519471782 * keras_input_1_rn."Feature_1" + -0.23745525229524164 * keras_input_1_rn."Feature_2" + -0.7739026908147839 * keras_input_1_rn."Feature_3" AS dot_prod_2 
FROM keras_input_1_rn), 
rnn_cte_simple_rnn_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", output_1, output_2, "State_1", "State_2") AS 
(SELECT input_kernel_bias.rn AS rn_1, input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "PreviousState_1", CAST(0.0 AS DOUBLE PRECISION) AS "PreviousState_2", input_kernel_bias.dot_prod_1 + 0.0 AS output_1, input_kernel_bias.dot_prod_2 + 0.0 AS output_2, input_kernel_bias.dot_prod_1 + 0.0 AS "State_1", input_kernel_bias.dot_prod_2 + 0.0 AS "State_2" 
FROM input_kernel_bias 
WHERE input_kernel_bias.rn = 1 UNION ALL SELECT input_kernel_bias.rn AS rn, input_kernel_bias."KEY" AS "KEY", rnn_cte_simple_rnn_1."State_1" AS "PreviousState_1", rnn_cte_simple_rnn_1."State_2" AS "PreviousState_2", input_kernel_bias.dot_prod_1 + -0.7007738608446926 * rnn_cte_simple_rnn_1."State_1" + 0.6262425164485362 * rnn_cte_simple_rnn_1."State_2" AS output_1, input_kernel_bias.dot_prod_2 + 0.25031102935748134 * rnn_cte_simple_rnn_1."State_1" + 0.7258020914267241 * rnn_cte_simple_rnn_1."State_2" AS output_2, input_kernel_bias.dot_prod_1 + -0.7007738608446926 * rnn_cte_simple_rnn_1."State_1" + 0.6262425164485362 * rnn_cte_simple_rnn_1."State_2" AS "State_1", input_kernel_bias.dot_prod_2 + 0.25031102935748134 * rnn_cte_simple_rnn_1."State_1" + 0.7258020914267241 * rnn_cte_simple_rnn_1."State_2" AS "State_2" 
FROM input_kernel_bias, rnn_cte_simple_rnn_1 
WHERE input_kernel_bias.rn = rnn_cte_simple_rnn_1.rn_1 + 1), 
simple_rnn_1 AS 
(SELECT rnn_cte_simple_rnn_1."KEY" AS "KEY", CAST(rnn_cte_simple_rnn_1.output_1 AS DOUBLE PRECISION) AS output_1, CAST(rnn_cte_simple_rnn_1.output_2 AS DOUBLE PRECISION) AS output_2 
FROM rnn_cte_simple_rnn_1), 
simple_rnn_1_1 AS 
(SELECT simple_rnn_1."KEY" AS "KEY", simple_rnn_1.output_1 AS output_1, simple_rnn_1.output_2 AS output_2 
FROM simple_rnn_1), 
layer_dense_1 AS 
(SELECT simple_rnn_1_1."KEY" AS "KEY", 0.3852535863354133 + 1.5093806941139396 * simple_rnn_1_1.output_1 + -0.7280742974048413 * simple_rnn_1_1.output_2 AS output_1 
FROM simple_rnn_1_1)
 SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS "Estimator" 
FROM layer_dense_1