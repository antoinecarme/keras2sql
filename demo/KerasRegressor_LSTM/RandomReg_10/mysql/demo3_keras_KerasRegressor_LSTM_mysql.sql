-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_LSTM
-- Dataset : RandomReg_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3`, `ADS`.`Feature_4` AS `Feature_4`, `ADS`.`Feature_5` AS `Feature_5`, `ADS`.`Feature_6` AS `Feature_6`, `ADS`.`Feature_7` AS `Feature_7`, `ADS`.`Feature_8` AS `Feature_8`, `ADS`.`Feature_9` AS `Feature_9` 
FROM `RandomReg_10` AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3`, keras_input.`Feature_4` AS `Feature_4`, keras_input.`Feature_5` AS `Feature_5`, keras_input.`Feature_6` AS `Feature_6`, keras_input.`Feature_7` AS `Feature_7`, keras_input.`Feature_8` AS `Feature_8`, keras_input.`Feature_9` AS `Feature_9` 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.`KEY` ASC) AS rn, keras_input_1.`KEY` AS `KEY`, keras_input_1.`Feature_0` AS `Feature_0`, keras_input_1.`Feature_1` AS `Feature_1`, keras_input_1.`Feature_2` AS `Feature_2`, keras_input_1.`Feature_3` AS `Feature_3`, keras_input_1.`Feature_4` AS `Feature_4`, keras_input_1.`Feature_5` AS `Feature_5`, keras_input_1.`Feature_6` AS `Feature_6`, keras_input_1.`Feature_7` AS `Feature_7`, keras_input_1.`Feature_8` AS `Feature_8`, keras_input_1.`Feature_9` AS `Feature_9` 
FROM keras_input_1), 
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.`KEY` AS `KEY`, keras_input_1_rn.`Feature_0` AS `Feature_0`, keras_input_1_rn.`Feature_1` AS `Feature_1`, keras_input_1_rn.`Feature_2` AS `Feature_2`, keras_input_1_rn.`Feature_3` AS `Feature_3`, keras_input_1_rn.`Feature_4` AS `Feature_4`, keras_input_1_rn.`Feature_5` AS `Feature_5`, keras_input_1_rn.`Feature_6` AS `Feature_6`, keras_input_1_rn.`Feature_7` AS `Feature_7`, keras_input_1_rn.`Feature_8` AS `Feature_8`, keras_input_1_rn.`Feature_9` AS `Feature_9`, 0.2461409008217623 + 0.4716414636744018 * keras_input_1_rn.`Feature_0` + 0.36631216975324377 * keras_input_1_rn.`Feature_1` + -0.27779370841858086 * keras_input_1_rn.`Feature_2` + -0.27856418775254493 * keras_input_1_rn.`Feature_3` + -0.3675630872794914 * keras_input_1_rn.`Feature_4` + 0.14173272190372319 * keras_input_1_rn.`Feature_5` + 0.2982512261123337 * keras_input_1_rn.`Feature_6` + -0.06880633287229623 * keras_input_1_rn.`Feature_7` + -0.2702966926633788 * keras_input_1_rn.`Feature_8` + -0.006977020713821564 * keras_input_1_rn.`Feature_9` AS dot_prod_i_1, 0.27620405421285876 + -0.28425756270133995 * keras_input_1_rn.`Feature_0` + -0.07416660320178897 * keras_input_1_rn.`Feature_1` + 0.07277980013801875 * keras_input_1_rn.`Feature_2` + -0.14450587460732242 * keras_input_1_rn.`Feature_3` + 0.2689238624400398 * keras_input_1_rn.`Feature_4` + -0.2529699069122996 * keras_input_1_rn.`Feature_5` + -0.16244701550925403 * keras_input_1_rn.`Feature_6` + -0.0033295620651082464 * keras_input_1_rn.`Feature_7` + -0.5173184172416345 * keras_input_1_rn.`Feature_8` + 0.10767627702941049 * keras_input_1_rn.`Feature_9` AS dot_prod_i_2, -0.028287656635529897 + -0.21637149092780236 * keras_input_1_rn.`Feature_0` + -0.3144812673943553 * keras_input_1_rn.`Feature_1` + -0.42895828821171617 * keras_input_1_rn.`Feature_2` + -0.5182093663235017 * keras_input_1_rn.`Feature_3` + -0.4482809110763113 * keras_input_1_rn.`Feature_4` + 0.314159535124748 * keras_input_1_rn.`Feature_5` + -0.10197182113318325 * keras_input_1_rn.`Feature_6` + -0.06539448397719606 * keras_input_1_rn.`Feature_7` + -0.39003770119820075 * keras_input_1_rn.`Feature_8` + 0.39524812002499554 * keras_input_1_rn.`Feature_9` AS dot_prod_i_3, 1.1351246405287652 + 0.5143268271777758 * keras_input_1_rn.`Feature_0` + 0.29630282767834565 * keras_input_1_rn.`Feature_1` + -0.25655195559801247 * keras_input_1_rn.`Feature_2` + 0.017233956480384657 * keras_input_1_rn.`Feature_3` + 0.03534421885254385 * keras_input_1_rn.`Feature_4` + 0.2576003807878964 * keras_input_1_rn.`Feature_5` + -0.1918444335973069 * keras_input_1_rn.`Feature_6` + 0.24304296732601205 * keras_input_1_rn.`Feature_7` + 0.07961389161023215 * keras_input_1_rn.`Feature_8` + -0.08521566420007459 * keras_input_1_rn.`Feature_9` AS dot_prod_f_1, 1.1617998531871494 + 0.3337306043903547 * keras_input_1_rn.`Feature_0` + 0.32832479379182505 * keras_input_1_rn.`Feature_1` + 0.13975434910899168 * keras_input_1_rn.`Feature_2` + -0.10192879071740414 * keras_input_1_rn.`Feature_3` + -0.2651326795672296 * keras_input_1_rn.`Feature_4` + 0.3027955633028835 * keras_input_1_rn.`Feature_5` + 0.08168698170479824 * keras_input_1_rn.`Feature_6` + -0.40692483816300645 * keras_input_1_rn.`Feature_7` + -0.672456231744851 * keras_input_1_rn.`Feature_8` + 0.009151053041610449 * keras_input_1_rn.`Feature_9` AS dot_prod_f_2, 0.9683380243241972 + -0.0005016816601166039 * keras_input_1_rn.`Feature_0` + -0.4582999558490543 * keras_input_1_rn.`Feature_1` + -0.25844511826410976 * keras_input_1_rn.`Feature_2` + 0.35565861417095174 * keras_input_1_rn.`Feature_3` + -0.196876700767632 * keras_input_1_rn.`Feature_4` + 0.048198907621955965 * keras_input_1_rn.`Feature_5` + 0.32619201176718937 * keras_input_1_rn.`Feature_6` + -0.0361398509480319 * keras_input_1_rn.`Feature_7` + -0.09728635501450901 * keras_input_1_rn.`Feature_8` + -0.15241267489790739 * keras_input_1_rn.`Feature_9` AS dot_prod_f_3, -0.006058036743553688 + -0.060015868805921246 * keras_input_1_rn.`Feature_0` + -0.10813312193692179 * keras_input_1_rn.`Feature_1` + -0.2003872685502696 * keras_input_1_rn.`Feature_2` + -0.571776663965028 * keras_input_1_rn.`Feature_3` + -0.34451309425461457 * keras_input_1_rn.`Feature_4` + -0.08838355476124071 * keras_input_1_rn.`Feature_5` + 0.001712846058461119 * keras_input_1_rn.`Feature_6` + -0.7246791505426532 * keras_input_1_rn.`Feature_7` + -0.5360757892968333 * keras_input_1_rn.`Feature_8` + 0.0010165180016582797 * keras_input_1_rn.`Feature_9` AS dot_prod_c_1, 0.13202295255952 + -0.27306730750659775 * keras_input_1_rn.`Feature_0` + -0.7370513643833206 * keras_input_1_rn.`Feature_1` + -0.2459775205945838 * keras_input_1_rn.`Feature_2` + -0.5023649762820157 * keras_input_1_rn.`Feature_3` + -0.19167353873542137 * keras_input_1_rn.`Feature_4` + 0.24739556175263552 * keras_input_1_rn.`Feature_5` + 0.14157987791082383 * keras_input_1_rn.`Feature_6` + -0.599955494700822 * keras_input_1_rn.`Feature_7` + -0.6116033682155859 * keras_input_1_rn.`Feature_8` + -0.4736653901730302 * keras_input_1_rn.`Feature_9` AS dot_prod_c_2, 0.0011010210526113257 + -0.254249085051506 * keras_input_1_rn.`Feature_0` + -0.6995695706817275 * keras_input_1_rn.`Feature_1` + 0.1282860608052249 * keras_input_1_rn.`Feature_2` + 0.42592481563205725 * keras_input_1_rn.`Feature_3` + 0.35287712933957427 * keras_input_1_rn.`Feature_4` + -0.5300184639162756 * keras_input_1_rn.`Feature_5` + -0.17837194276384724 * keras_input_1_rn.`Feature_6` + 0.12781835055723834 * keras_input_1_rn.`Feature_7` + -0.14064736114412418 * keras_input_1_rn.`Feature_8` + 0.39299957299831045 * keras_input_1_rn.`Feature_9` AS dot_prod_c_3, -0.03695692945378571 + -0.05523597355618073 * keras_input_1_rn.`Feature_0` + -0.6705624199091501 * keras_input_1_rn.`Feature_1` + -0.19615947555761853 * keras_input_1_rn.`Feature_2` + -0.23151745987193054 * keras_input_1_rn.`Feature_3` + -0.4348432676544442 * keras_input_1_rn.`Feature_4` + 0.21435483214513637 * keras_input_1_rn.`Feature_5` + -0.4691256784339787 * keras_input_1_rn.`Feature_6` + 0.46146508578284196 * keras_input_1_rn.`Feature_7` + -0.14139380873051235 * keras_input_1_rn.`Feature_8` + -0.5235524898371793 * keras_input_1_rn.`Feature_9` AS dot_prod_o_1, 0.10952990316535265 + 0.019381815824087666 * keras_input_1_rn.`Feature_0` + -0.5043480893294146 * keras_input_1_rn.`Feature_1` + -0.5803134921545391 * keras_input_1_rn.`Feature_2` + -0.4357579607457122 * keras_input_1_rn.`Feature_3` + -0.32659121410042546 * keras_input_1_rn.`Feature_4` + -0.49225202075268215 * keras_input_1_rn.`Feature_5` + -0.4042857614362197 * keras_input_1_rn.`Feature_6` + 0.006675427718520815 * keras_input_1_rn.`Feature_7` + 0.27724111385194056 * keras_input_1_rn.`Feature_8` + 0.010838817681669374 * keras_input_1_rn.`Feature_9` AS dot_prod_o_2, -0.08006075426443063 + 0.010195444482800933 * keras_input_1_rn.`Feature_0` + 0.18146659494581605 * keras_input_1_rn.`Feature_1` + -0.5680271586753827 * keras_input_1_rn.`Feature_2` + -0.06986582746114096 * keras_input_1_rn.`Feature_3` + 0.5148728942096458 * keras_input_1_rn.`Feature_4` + 0.28465924971923984 * keras_input_1_rn.`Feature_5` + -0.48434067138805953 * keras_input_1_rn.`Feature_6` + -0.22644229746318287 * keras_input_1_rn.`Feature_7` + -0.2033429900224853 * keras_input_1_rn.`Feature_8` + 0.3865826943010903 * keras_input_1_rn.`Feature_9` AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, `KEY`, `PreviousState_1`, `PreviousState_2`, `PreviousState_3`, `PreviousState_4`, `PreviousState_5`, `PreviousState_6`, `State_1`, `State_2`, `State_3`, `State_4`, `State_5`, `State_6`) AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, CAST(0.0 AS DOUBLE) AS `PreviousState_3`, CAST(0.0 AS DOUBLE) AS `PreviousState_4`, CAST(0.0 AS DOUBLE) AS `PreviousState_5`, CAST(0.0 AS DOUBLE) AS `PreviousState_6`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5)) * 0.0) AS `State_1`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5)) * 0.0) AS `State_2`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5)) * 0.0) AS `State_3`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5)) * 0.0 AS `State_4`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5)) * 0.0 AS `State_5`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5)) * 0.0 AS `State_6` 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias.`KEY` AS `KEY`, rnn_cte_lstm_1.`State_1` AS `PreviousState_1`, rnn_cte_lstm_1.`State_2` AS `PreviousState_2`, rnn_cte_lstm_1.`State_3` AS `PreviousState_3`, rnn_cte_lstm_1.`State_4` AS `PreviousState_4`, rnn_cte_lstm_1.`State_5` AS `PreviousState_5`, rnn_cte_lstm_1.`State_6` AS `PreviousState_6`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.02220677901816177 * rnn_cte_lstm_1.`State_1` + 0.42497156499811867 * rnn_cte_lstm_1.`State_2` + 0.3860610318463539 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.8591351505065943 * rnn_cte_lstm_1.`State_1` + 0.0110222404599518 * rnn_cte_lstm_1.`State_2` + -0.05911961136591969 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.008292601497822247 * rnn_cte_lstm_1.`State_1` + 0.5084242090559551 * rnn_cte_lstm_1.`State_2` + 0.27532807138301363 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.08016108841812052 * rnn_cte_lstm_1.`State_1` + 0.5365215391351449 * rnn_cte_lstm_1.`State_2` + -0.025943549218790843 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_4`) AS `State_1`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.10639029116023879 * rnn_cte_lstm_1.`State_1` + -0.1762574392259241 * rnn_cte_lstm_1.`State_2` + 0.20876310635699763 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.052668440899506105 * rnn_cte_lstm_1.`State_1` + -0.026697440714809784 * rnn_cte_lstm_1.`State_2` + 0.17655271605690598 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.4211414342225307 * rnn_cte_lstm_1.`State_1` + 0.576606302511077 * rnn_cte_lstm_1.`State_2` + 0.4228601992301086 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.044569402998600405 * rnn_cte_lstm_1.`State_1` + 0.07738655563590231 * rnn_cte_lstm_1.`State_2` + 0.5281379895325182 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_5`) AS `State_2`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.20985165068613548 * rnn_cte_lstm_1.`State_1` + 0.02784110253810283 * rnn_cte_lstm_1.`State_2` + -0.28597650143093456 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.2066984898964893 * rnn_cte_lstm_1.`State_1` + 0.3980922841101299 * rnn_cte_lstm_1.`State_2` + -0.2965704874886209 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.530039762824556 * rnn_cte_lstm_1.`State_1` + 0.10866127127277933 * rnn_cte_lstm_1.`State_2` + 0.09121377155645671 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + -0.0429020296570415 * rnn_cte_lstm_1.`State_1` + 0.5675379459024312 * rnn_cte_lstm_1.`State_2` + -0.25658940189452867 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_6`) AS `State_3`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.8591351505065943 * rnn_cte_lstm_1.`State_1` + 0.0110222404599518 * rnn_cte_lstm_1.`State_2` + -0.05911961136591969 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.008292601497822247 * rnn_cte_lstm_1.`State_1` + 0.5084242090559551 * rnn_cte_lstm_1.`State_2` + 0.27532807138301363 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.08016108841812052 * rnn_cte_lstm_1.`State_1` + 0.5365215391351449 * rnn_cte_lstm_1.`State_2` + -0.025943549218790843 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_4` AS `State_4`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.052668440899506105 * rnn_cte_lstm_1.`State_1` + -0.026697440714809784 * rnn_cte_lstm_1.`State_2` + 0.17655271605690598 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.4211414342225307 * rnn_cte_lstm_1.`State_1` + 0.576606302511077 * rnn_cte_lstm_1.`State_2` + 0.4228601992301086 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.044569402998600405 * rnn_cte_lstm_1.`State_1` + 0.07738655563590231 * rnn_cte_lstm_1.`State_2` + 0.5281379895325182 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_5` AS `State_5`, greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.2066984898964893 * rnn_cte_lstm_1.`State_1` + 0.3980922841101299 * rnn_cte_lstm_1.`State_2` + -0.2965704874886209 * rnn_cte_lstm_1.`State_3`) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.530039762824556 * rnn_cte_lstm_1.`State_1` + 0.10866127127277933 * rnn_cte_lstm_1.`State_2` + 0.09121377155645671 * rnn_cte_lstm_1.`State_3`) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + -0.0429020296570415 * rnn_cte_lstm_1.`State_1` + 0.5675379459024312 * rnn_cte_lstm_1.`State_2` + -0.25658940189452867 * rnn_cte_lstm_1.`State_3`) + 0.5)) * rnn_cte_lstm_1.`State_6` AS `State_6` 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1.`KEY` AS `KEY`, CAST(rnn_cte_lstm_1.`State_1` AS DOUBLE) AS output_1, CAST(rnn_cte_lstm_1.`State_2` AS DOUBLE) AS output_2, CAST(rnn_cte_lstm_1.`State_3` AS DOUBLE) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1.`KEY` AS `KEY`, lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1.`KEY` AS `KEY`, 0.11075715427859657 + -0.36475870113638603 * lstm_1_1.output_1 + -0.19337275477024232 * lstm_1_1.output_2 + -0.41908593315810244 * lstm_1_1.output_3 AS output_1 
FROM lstm_1_1)
 SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS `Estimator` 
FROM layer_dense_1