-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_GRU
-- Dataset : freidman2
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3` 
FROM freidman2 AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3` 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.`KEY` ASC) AS rn, keras_input_1.`KEY` AS `KEY`, keras_input_1.`Feature_0` AS `Feature_0`, keras_input_1.`Feature_1` AS `Feature_1`, keras_input_1.`Feature_2` AS `Feature_2`, keras_input_1.`Feature_3` AS `Feature_3` 
FROM keras_input_1), 
gru_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.`KEY` AS `KEY`, keras_input_1_rn.`Feature_0` AS `Feature_0`, keras_input_1_rn.`Feature_1` AS `Feature_1`, keras_input_1_rn.`Feature_2` AS `Feature_2`, keras_input_1_rn.`Feature_3` AS `Feature_3`, 0.0 + 0.6244831771358976 * keras_input_1_rn.`Feature_0` + 0.07543680882271286 * keras_input_1_rn.`Feature_1` + 0.7506452956098149 * keras_input_1_rn.`Feature_2` + 0.30287969619136157 * keras_input_1_rn.`Feature_3` AS dot_prod_z_1, 0.0 + -0.5616136717434999 * keras_input_1_rn.`Feature_0` + -0.3552588030197192 * keras_input_1_rn.`Feature_1` + 0.09336527497902203 * keras_input_1_rn.`Feature_2` + -0.714371341474337 * keras_input_1_rn.`Feature_3` AS dot_prod_z_2, 0.0 + -0.3612290941025523 * keras_input_1_rn.`Feature_0` + -0.33426118025833607 * keras_input_1_rn.`Feature_1` + -0.3415000308767464 * keras_input_1_rn.`Feature_2` + -0.6072665310752055 * keras_input_1_rn.`Feature_3` AS dot_prod_r_1, 0.0 + 0.7026097564390985 * keras_input_1_rn.`Feature_0` + -0.0007306068707360058 * keras_input_1_rn.`Feature_1` + 0.7346384052873016 * keras_input_1_rn.`Feature_2` + -0.6284861724843395 * keras_input_1_rn.`Feature_3` AS dot_prod_r_2, 0.0 + 0.5383229553583972 * keras_input_1_rn.`Feature_0` + 0.06075140749700303 * keras_input_1_rn.`Feature_1` + 0.7515919892759364 * keras_input_1_rn.`Feature_2` + -0.4944510917344977 * keras_input_1_rn.`Feature_3` AS dot_prod_h_1, 0.0 + 0.058168216390497296 * keras_input_1_rn.`Feature_0` + 0.12269941619968727 * keras_input_1_rn.`Feature_1` + -0.5480052703552417 * keras_input_1_rn.`Feature_2` + 0.42483361438283196 * keras_input_1_rn.`Feature_3` AS dot_prod_h_2 
FROM keras_input_1_rn), 
rnn_cte_gru_1(rn_1, `KEY`, `PreviousState_1`, `PreviousState_2`, `State_1`, `State_2`) AS 
(SELECT gru_input_kernel_bias.rn AS rn_1, gru_input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, (1.0 - greatest(0.0, least(1.0, 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5))) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1)))) AS `State_1`, (1.0 - greatest(0.0, least(1.0, 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5))) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2)))) AS `State_2` 
FROM gru_input_kernel_bias 
WHERE gru_input_kernel_bias.rn = 1 UNION ALL SELECT gru_input_kernel_bias.rn AS rn, gru_input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, greatest(0.0, least(1.0, 0.2 * (0.8138234813332196 * CAST(0.0 AS DOUBLE) + 0.03861754315374066 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_1) + 0.5)) * CAST(0.0 AS DOUBLE) + (1.0 - greatest(0.0, least(1.0, 0.2 * (0.8138234813332196 * CAST(0.0 AS DOUBLE) + 0.03861754315374066 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_1) + 0.5))) * ((exp(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1) - exp(-(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1))) / (exp(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1) + exp(-(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_1)))) AS `State_1`, greatest(0.0, least(1.0, 0.2 * (0.08426053191069505 * CAST(0.0 AS DOUBLE) + 0.27805107213113867 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_2) + 0.5)) * CAST(0.0 AS DOUBLE) + (1.0 - greatest(0.0, least(1.0, 0.2 * (0.08426053191069505 * CAST(0.0 AS DOUBLE) + 0.27805107213113867 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_z_2) + 0.5))) * ((exp(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2) - exp(-(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2))) / (exp(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2) + exp(-(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS DOUBLE) + -0.4361016447237923 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS DOUBLE) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS DOUBLE) + 0.7481517452896373 * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS DOUBLE) + gru_input_kernel_bias.dot_prod_h_2)))) AS `State_2` 
FROM gru_input_kernel_bias, rnn_cte_gru_1 
WHERE gru_input_kernel_bias.rn = rnn_cte_gru_1.rn_1 + 1), 
gru_1 AS 
(SELECT rnn_cte_gru_1.`KEY` AS `KEY`, CAST(rnn_cte_gru_1.`State_1` AS DOUBLE) AS output_1, CAST(rnn_cte_gru_1.`State_2` AS DOUBLE) AS output_2 
FROM rnn_cte_gru_1), 
gru_1_1 AS 
(SELECT gru_1.`KEY` AS `KEY`, gru_1.output_1 AS output_1, gru_1.output_2 AS output_2 
FROM gru_1), 
layer_dense_1 AS 
(SELECT gru_1_1.`KEY` AS `KEY`, 0.76949384598897 + -0.5464927276885809 * gru_1_1.output_1 + 1.96521899824704 * gru_1_1.output_2 AS output_1 
FROM gru_1_1)
 SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS `Estimator` 
FROM layer_dense_1