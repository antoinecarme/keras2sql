-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_GRU
-- Dataset : diabetes
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9" 
FROM diabetes AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9" 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1."KEY" ASC) AS rn, keras_input_1."KEY" AS "KEY", keras_input_1."Feature_0" AS "Feature_0", keras_input_1."Feature_1" AS "Feature_1", keras_input_1."Feature_2" AS "Feature_2", keras_input_1."Feature_3" AS "Feature_3", keras_input_1."Feature_4" AS "Feature_4", keras_input_1."Feature_5" AS "Feature_5", keras_input_1."Feature_6" AS "Feature_6", keras_input_1."Feature_7" AS "Feature_7", keras_input_1."Feature_8" AS "Feature_8", keras_input_1."Feature_9" AS "Feature_9" 
FROM keras_input_1), 
gru_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", keras_input_1_rn."Feature_4" AS "Feature_4", keras_input_1_rn."Feature_5" AS "Feature_5", keras_input_1_rn."Feature_6" AS "Feature_6", keras_input_1_rn."Feature_7" AS "Feature_7", keras_input_1_rn."Feature_8" AS "Feature_8", keras_input_1_rn."Feature_9" AS "Feature_9", -2.705614968685676 + 0.3709491475888547 * keras_input_1_rn."Feature_0" + 0.03619861932234563 * keras_input_1_rn."Feature_1" + 0.07805648659807243 * keras_input_1_rn."Feature_2" + -0.2150292051842932 * keras_input_1_rn."Feature_3" + -0.47637848903342994 * keras_input_1_rn."Feature_4" + 0.0037247281325123193 * keras_input_1_rn."Feature_5" + 0.19281890625243875 * keras_input_1_rn."Feature_6" + -0.7592460073065375 * keras_input_1_rn."Feature_7" + -0.9364660387099343 * keras_input_1_rn."Feature_8" + -0.42078305847224706 * keras_input_1_rn."Feature_9" AS dot_prod_z_1, -2.7099864180732793 + -0.4919012187613379 * keras_input_1_rn."Feature_0" + -0.1923042498858899 * keras_input_1_rn."Feature_1" + -0.31673366078997256 * keras_input_1_rn."Feature_2" + -0.8965479438573596 * keras_input_1_rn."Feature_3" + 0.050564255389833924 * keras_input_1_rn."Feature_4" + 0.014785273562123233 * keras_input_1_rn."Feature_5" + 0.30070048942917077 * keras_input_1_rn."Feature_6" + -0.594581202255272 * keras_input_1_rn."Feature_7" + 0.009653141689782692 * keras_input_1_rn."Feature_8" + -0.3449013675569155 * keras_input_1_rn."Feature_9" AS dot_prod_z_2, 0.0 + -0.28557667362084055 * keras_input_1_rn."Feature_0" + -0.26425666574811296 * keras_input_1_rn."Feature_1" + -0.2699794796470867 * keras_input_1_rn."Feature_2" + -0.4800863462467672 * keras_input_1_rn."Feature_3" + -0.19371424232988738 * keras_input_1_rn."Feature_4" + 0.44802432103928536 * keras_input_1_rn."Feature_5" + -0.6000899780533389 * keras_input_1_rn."Feature_6" + 0.6013298543215166 * keras_input_1_rn."Feature_7" + -0.47342065670735217 * keras_input_1_rn."Feature_8" + 0.5664661108741975 * keras_input_1_rn."Feature_9" AS dot_prod_r_1, 0.0 + 0.5554617841509268 * keras_input_1_rn."Feature_0" + -0.0005775954464235511 * keras_input_1_rn."Feature_1" + 0.5807826543354393 * keras_input_1_rn."Feature_2" + -0.4968619457429893 * keras_input_1_rn."Feature_3" + -0.09543274362981924 * keras_input_1_rn."Feature_4" + 0.05538030483526912 * keras_input_1_rn."Feature_5" + 0.18703715250217423 * keras_input_1_rn."Feature_6" + -0.10226582074121848 * keras_input_1_rn."Feature_7" + 0.21201437703847426 * keras_input_1_rn."Feature_8" + -0.36056722193250695 * keras_input_1_rn."Feature_9" AS dot_prod_r_2, -2.7726434645233895 + 0.228949256197093 * keras_input_1_rn."Feature_0" + 0.06376612672491157 * keras_input_1_rn."Feature_1" + 0.006626592405484315 * keras_input_1_rn."Feature_2" + -0.8126605233218518 * keras_input_1_rn."Feature_3" + 0.12519901852004864 * keras_input_1_rn."Feature_4" + -0.6790018720190465 * keras_input_1_rn."Feature_5" + 0.4707305412107484 * keras_input_1_rn."Feature_6" + -0.7397087794005676 * keras_input_1_rn."Feature_7" + -0.8017432250866293 * keras_input_1_rn."Feature_8" + -0.5754260666214106 * keras_input_1_rn."Feature_9" AS dot_prod_h_1, 2.6426352611659114 + 0.21007542420980677 * keras_input_1_rn."Feature_0" + 0.10172971955442876 * keras_input_1_rn."Feature_1" + 0.1642185312812468 * keras_input_1_rn."Feature_2" + 0.7551822476766539 * keras_input_1_rn."Feature_3" + 0.17886572597342043 * keras_input_1_rn."Feature_4" + -0.15205546298202394 * keras_input_1_rn."Feature_5" + -0.21200189898472935 * keras_input_1_rn."Feature_6" + 0.41767297889358185 * keras_input_1_rn."Feature_7" + 0.3872199822621303 * keras_input_1_rn."Feature_8" + 0.9216195493142767 * keras_input_1_rn."Feature_9" AS dot_prod_h_2 
FROM keras_input_1_rn), 
rnn_cte_gru_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", "State_1", "State_2") AS 
(SELECT gru_input_kernel_bias.rn AS rn_1, gru_input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS FLOAT) AS "PreviousState_1", CAST(0.0 AS FLOAT) AS "PreviousState_2", (1.0 - greatest(0.0, least(1.0, 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5))) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1)))) AS "State_1", (1.0 - greatest(0.0, least(1.0, 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5))) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2)))) AS "State_2" 
FROM gru_input_kernel_bias 
WHERE gru_input_kernel_bias.rn = 1 UNION ALL SELECT gru_input_kernel_bias.rn AS rn, gru_input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS FLOAT) AS "PreviousState_1", CAST(0.0 AS FLOAT) AS "PreviousState_2", greatest(0.0, least(1.0, 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT) + 0.03861754315374066 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_z_1) + 0.5)) * CAST(0.0 AS FLOAT) + (1.0 - greatest(0.0, least(1.0, 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT) + 0.03861754315374066 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_z_1) + 0.5))) * ((exp(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_1) - exp(-(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_1))) / (exp(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_1) + exp(-(-0.20629458740002615 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.18588036651285594 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_1)))) AS "State_1", greatest(0.0, least(1.0, 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT) + 0.27805107213113867 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_z_2) + 0.5)) * CAST(0.0 AS FLOAT) + (1.0 - greatest(0.0, least(1.0, 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT) + 0.27805107213113867 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_z_2) + 0.5))) * ((exp(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_2) - exp(-(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_2))) / (exp(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_2) + exp(-(-0.2775259356596579 * greatest(0.0, least(1.0, 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT) + -0.4361016447237923 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_1) + 0.5)) * CAST(0.0 AS FLOAT) + 0.3697689785282325 * greatest(0.0, least(1.0, 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT) + 0.7481517452896373 * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_r_2) + 0.5)) * CAST(0.0 AS FLOAT) + gru_input_kernel_bias.dot_prod_h_2)))) AS "State_2" 
FROM gru_input_kernel_bias, rnn_cte_gru_1 
WHERE gru_input_kernel_bias.rn = rnn_cte_gru_1.rn_1 + 1), 
gru_1 AS 
(SELECT rnn_cte_gru_1."KEY" AS "KEY", CAST(rnn_cte_gru_1."State_1" AS FLOAT) AS output_1, CAST(rnn_cte_gru_1."State_2" AS FLOAT) AS output_2 
FROM rnn_cte_gru_1), 
gru_1_1 AS 
(SELECT gru_1."KEY" AS "KEY", gru_1.output_1 AS output_1, gru_1.output_2 AS output_2 
FROM gru_1), 
layer_dense_1 AS 
(SELECT gru_1_1."KEY" AS "KEY", 3.7096491416207464 + -5.203127301457487 * gru_1_1.output_1 + 5.890188283712322 * gru_1_1.output_2 AS output_1 
FROM gru_1_1)
 SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS "Estimator" 
FROM layer_dense_1