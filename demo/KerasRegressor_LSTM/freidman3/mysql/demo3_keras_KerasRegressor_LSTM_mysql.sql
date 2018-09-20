-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_LSTM
-- Dataset : freidman3
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3` 
FROM freidman3 AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3` 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.`KEY` ASC) AS rn, keras_input_1.`KEY` AS `KEY`, keras_input_1.`Feature_0` AS `Feature_0`, keras_input_1.`Feature_1` AS `Feature_1`, keras_input_1.`Feature_2` AS `Feature_2`, keras_input_1.`Feature_3` AS `Feature_3` 
FROM keras_input_1), 
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.`KEY` AS `KEY`, keras_input_1_rn.`Feature_0` AS `Feature_0`, keras_input_1_rn.`Feature_1` AS `Feature_1`, keras_input_1_rn.`Feature_2` AS `Feature_2`, keras_input_1_rn.`Feature_3` AS `Feature_3`, 0.0 + 0.49369730005195533 * keras_input_1_rn.`Feature_0` + 0.5934372122543516 * keras_input_1_rn.`Feature_1` + -0.388878277319225 * keras_input_1_rn.`Feature_2` + -0.34416418068902643 * keras_input_1_rn.`Feature_3` AS dot_prod_i_1, 0.0 + -0.44399459194990176 * keras_input_1_rn.`Feature_0` + 0.07381173082540982 * keras_input_1_rn.`Feature_1` + 0.07606956260599385 * keras_input_1_rn.`Feature_2` + -0.05023691581051837 * keras_input_1_rn.`Feature_3` AS dot_prod_i_2, 0.0 + -0.28557667362084055 * keras_input_1_rn.`Feature_0` + -0.2699794796470867 * keras_input_1_rn.`Feature_1` + -0.19371424232988738 * keras_input_1_rn.`Feature_2` + -0.6000899780533389 * keras_input_1_rn.`Feature_3` AS dot_prod_i_3, 1.0 + 0.5554617841509268 * keras_input_1_rn.`Feature_0` + 0.5807826543354393 * keras_input_1_rn.`Feature_1` + -0.09543274362981924 * keras_input_1_rn.`Feature_2` + 0.18703715250217423 * keras_input_1_rn.`Feature_3` AS dot_prod_f_1, 1.0 + 0.42558166392141983 * keras_input_1_rn.`Feature_0` + 0.5941856393122014 * keras_input_1_rn.`Feature_1` + 0.2515873483001133 * keras_input_1_rn.`Feature_2` + -0.025723995482030526 * keras_input_1_rn.`Feature_3` AS dot_prod_f_2, 1.0 + 0.04598601280587744 * keras_input_1_rn.`Feature_0` + -0.4332362060247284 * keras_input_1_rn.`Feature_1` + -0.06132615387693108 * keras_input_1_rn.`Feature_2` + 0.3800739988732117 * keras_input_1_rn.`Feature_3` AS dot_prod_f_3, 0.0 + 0.059638033823614434 * keras_input_1_rn.`Feature_0` + 0.23944742424613208 * keras_input_1_rn.`Feature_1` + 0.10839684743203815 * keras_input_1_rn.`Feature_2` + -0.42275933612694544 * keras_input_1_rn.`Feature_3` AS dot_prod_c_1, 0.0 + -0.2808567440918541 * keras_input_1_rn.`Feature_0` + -0.5647601335522031 * keras_input_1_rn.`Feature_1` + 0.0020387736774046816 * keras_input_1_rn.`Feature_2` + -0.40799455478394187 * keras_input_1_rn.`Feature_3` AS dot_prod_c_2, 0.0 + -0.26425666574811296 * keras_input_1_rn.`Feature_0` + -0.4800863462467672 * keras_input_1_rn.`Feature_1` + 0.44802432103928536 * keras_input_1_rn.`Feature_2` + 0.6013298543215166 * keras_input_1_rn.`Feature_3` AS dot_prod_c_3, 0.0 + -0.0005775954464235511 * keras_input_1_rn.`Feature_0` + -0.4968619457429893 * keras_input_1_rn.`Feature_1` + 0.05538030483526912 * keras_input_1_rn.`Feature_2` + -0.10226582074121848 * keras_input_1_rn.`Feature_3` AS dot_prod_o_1, 0.0 + 0.0480282046878896 * keras_input_1_rn.`Feature_0` + -0.39089791035946697 * keras_input_1_rn.`Feature_1` + -0.5680338787701874 * keras_input_1_rn.`Feature_2` + -0.37589522796003955 * keras_input_1_rn.`Feature_3` AS dot_prod_o_2, 0.0 + 0.09700240569099328 * keras_input_1_rn.`Feature_0` + 0.33586046201285424 * keras_input_1_rn.`Feature_1` + -0.40503549677848594 * keras_input_1_rn.`Feature_2` + -0.07378962280081391 * keras_input_1_rn.`Feature_3` AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, `KEY`, `PreviousState_1`, `PreviousState_2`, `PreviousState_3`, `PreviousState_4`, `PreviousState_5`, `PreviousState_6`, `State_1`, `State_2`, `State_3`, `State_4`, `State_5`, `State_6`) AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, CAST(0.0 AS DOUBLE) AS `PreviousState_3`, CAST(0.0 AS DOUBLE) AS `PreviousState_4`, CAST(0.0 AS DOUBLE) AS `PreviousState_5`, CAST(0.0 AS DOUBLE) AS `PreviousState_6`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5)) * 0.0) AS `State_1`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5)) * 0.0) AS `State_2`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5)) * 0.0) AS `State_3`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5)) * 0.0 AS `State_4`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5)) * 0.0 AS `State_5`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5)) * 0.0 AS `State_6` 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias.`KEY` AS `KEY`, rnn_cte_lstm_1.`State_1` AS `PreviousState_1`, rnn_cte_lstm_1.`State_2` AS `PreviousState_2`, rnn_cte_lstm_1.`State_3` AS `PreviousState_3`, rnn_cte_lstm_1.`State_4` AS `PreviousState_4`, rnn_cte_lstm_1.`State_5` AS `PreviousState_5`, rnn_cte_lstm_1.`State_6` AS `PreviousState_6`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.04720812138317668 * rnn_cte_lstm_1.`State_1` + 0.3296051095465166 * rnn_cte_lstm_1.`State_2` + 0.4389142209971305 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7548868734632376 * rnn_cte_lstm_1.`State_1` + -0.08367340651531625 * rnn_cte_lstm_1.`State_2` + -0.1321964933677207 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + -0.0811596567832923 * rnn_cte_lstm_1.`State_1` + 0.2946546589054947 * rnn_cte_lstm_1.`State_2` + 0.31102492211546695 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.044992728113694716 * rnn_cte_lstm_1.`State_1` + 0.36503691704501695 * rnn_cte_lstm_1.`State_2` + -0.013276180962666487 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_4`) AS `State_1`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.20233468859931947 * rnn_cte_lstm_1.`State_1` + -0.30051034319678827 * rnn_cte_lstm_1.`State_2` + 0.20867151431315717 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.13094303346992253 * rnn_cte_lstm_1.`State_1` + -0.2072927380020031 * rnn_cte_lstm_1.`State_2` + 0.11010745999804362 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.23186664269490873 * rnn_cte_lstm_1.`State_1` + 0.38120731369059546 * rnn_cte_lstm_1.`State_2` + 0.3561837004030066 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.19458730234975963 * rnn_cte_lstm_1.`State_1` + -0.06840855289116657 * rnn_cte_lstm_1.`State_2` + 0.4520103644947457 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_5`) AS `State_2`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.17187513590272432 * rnn_cte_lstm_1.`State_1` + 0.008141609324755723 * rnn_cte_lstm_1.`State_2` + -0.32570420998469124 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.19893627930071028 * rnn_cte_lstm_1.`State_1` + 0.29366846674955965 * rnn_cte_lstm_1.`State_2` + -0.328291975984632 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.4470824489464813 * rnn_cte_lstm_1.`State_1` + -0.06428101027217512 * rnn_cte_lstm_1.`State_2` + 0.0834608188379903 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + -0.024388150836989295 * rnn_cte_lstm_1.`State_1` + 0.5390463058207331 * rnn_cte_lstm_1.`State_2` + -0.2920503736253417 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_6`) AS `State_3`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7548868734632376 * rnn_cte_lstm_1.`State_1` + -0.08367340651531625 * rnn_cte_lstm_1.`State_2` + -0.1321964933677207 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + -0.0811596567832923 * rnn_cte_lstm_1.`State_1` + 0.2946546589054947 * rnn_cte_lstm_1.`State_2` + 0.31102492211546695 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.044992728113694716 * rnn_cte_lstm_1.`State_1` + 0.36503691704501695 * rnn_cte_lstm_1.`State_2` + -0.013276180962666487 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_4` AS `State_4`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.13094303346992253 * rnn_cte_lstm_1.`State_1` + -0.2072927380020031 * rnn_cte_lstm_1.`State_2` + 0.11010745999804362 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.23186664269490873 * rnn_cte_lstm_1.`State_1` + 0.38120731369059546 * rnn_cte_lstm_1.`State_2` + 0.3561837004030066 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.19458730234975963 * rnn_cte_lstm_1.`State_1` + -0.06840855289116657 * rnn_cte_lstm_1.`State_2` + 0.4520103644947457 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_5` AS `State_5`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.19893627930071028 * rnn_cte_lstm_1.`State_1` + 0.29366846674955965 * rnn_cte_lstm_1.`State_2` + -0.328291975984632 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.4470824489464813 * rnn_cte_lstm_1.`State_1` + -0.06428101027217512 * rnn_cte_lstm_1.`State_2` + 0.0834608188379903 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + -0.024388150836989295 * rnn_cte_lstm_1.`State_1` + 0.5390463058207331 * rnn_cte_lstm_1.`State_2` + -0.2920503736253417 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_6` AS `State_6` 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1.`KEY` AS `KEY`, CAST(rnn_cte_lstm_1.`State_1` AS DOUBLE) AS output_1, CAST(rnn_cte_lstm_1.`State_2` AS DOUBLE) AS output_2, CAST(rnn_cte_lstm_1.`State_3` AS DOUBLE) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1.`KEY` AS `KEY`, lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1.`KEY` AS `KEY`, 0.9092881956929976 + -0.30062342672438325 * lstm_1_1.output_1 + 0.023096099688632465 * lstm_1_1.output_2 + -0.451531137471318 * lstm_1_1.output_3 AS output_1 
FROM lstm_1_1)
 SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS `Estimator` 
FROM layer_dense_1