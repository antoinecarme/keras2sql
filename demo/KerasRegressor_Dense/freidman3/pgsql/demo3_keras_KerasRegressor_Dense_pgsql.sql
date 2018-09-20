-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_Dense
-- Dataset : freidman3
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3" 
FROM freidman3 AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3" 
FROM keras_input), 
layer_dense_1 AS 
(SELECT keras_input_1."KEY" AS "KEY", -0.12439313310640229 + 0.46179207111986204 * keras_input_1."Feature_0" + 0.6165767395667779 * keras_input_1."Feature_1" + -0.5107895656730858 * keras_input_1."Feature_2" + 0.7042158569521922 * keras_input_1."Feature_3" AS output_1, 0.09703698706962953 + -0.43562633776171494 * keras_input_1."Feature_0" + 0.05028463971868277 * keras_input_1."Feature_1" + 0.10742856937184739 * keras_input_1."Feature_2" + 0.20816314129421631 * keras_input_1."Feature_3" AS output_2, -0.12951141877222544 + -0.6494401862475105 * keras_input_1."Feature_0" + 0.09935764068731968 * keras_input_1."Feature_1" + -0.07467186023686692 * keras_input_1."Feature_2" + -0.5227758693624872 * keras_input_1."Feature_3" AS output_3, -0.1230541473425814 + 0.5499641919759111 * keras_input_1."Feature_0" + -0.38205715193442263 * keras_input_1."Feature_1" + 0.0013411010934921415 * keras_input_1."Feature_2" + 0.6877705507725549 * keras_input_1."Feature_3" AS output_4 
FROM keras_input_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2, layer_dense_1.output_3 AS output_3, layer_dense_1.output_4 AS output_4 
FROM layer_dense_1), 
layer_dense_2 AS 
(SELECT layer_dense_1_1."KEY" AS "KEY", -0.12494636678973434 + 0.41356959655349324 * layer_dense_1_1.output_1 + -0.1584818270926314 * layer_dense_1_1.output_2 + 1.1141236460422228 * layer_dense_1_1.output_3 + 0.9402060195897758 * layer_dense_1_1.output_4 AS output_1 
FROM layer_dense_1_1)
 SELECT layer_dense_2."KEY" AS "KEY", layer_dense_2.output_1 AS "Estimator" 
FROM layer_dense_2