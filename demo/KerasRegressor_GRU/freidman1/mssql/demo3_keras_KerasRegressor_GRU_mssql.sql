-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_GRU
-- Dataset : freidman1
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT [ADS].[KEY] AS [KEY], [ADS].[Feature_0] AS [Feature_0], [ADS].[Feature_1] AS [Feature_1], [ADS].[Feature_2] AS [Feature_2], [ADS].[Feature_3] AS [Feature_3], [ADS].[Feature_4] AS [Feature_4], [ADS].[Feature_5] AS [Feature_5], [ADS].[Feature_6] AS [Feature_6], [ADS].[Feature_7] AS [Feature_7], [ADS].[Feature_8] AS [Feature_8], [ADS].[Feature_9] AS [Feature_9] 
FROM freidman1 AS [ADS]), 
keras_input_1 AS 
(SELECT keras_input.[KEY] AS [KEY], keras_input.[Feature_0] AS [Feature_0], keras_input.[Feature_1] AS [Feature_1], keras_input.[Feature_2] AS [Feature_2], keras_input.[Feature_3] AS [Feature_3], keras_input.[Feature_4] AS [Feature_4], keras_input.[Feature_5] AS [Feature_5], keras_input.[Feature_6] AS [Feature_6], keras_input.[Feature_7] AS [Feature_7], keras_input.[Feature_8] AS [Feature_8], keras_input.[Feature_9] AS [Feature_9] 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.[KEY] ASC) AS rn, keras_input_1.[KEY] AS [KEY], keras_input_1.[Feature_0] AS [Feature_0], keras_input_1.[Feature_1] AS [Feature_1], keras_input_1.[Feature_2] AS [Feature_2], keras_input_1.[Feature_3] AS [Feature_3], keras_input_1.[Feature_4] AS [Feature_4], keras_input_1.[Feature_5] AS [Feature_5], keras_input_1.[Feature_6] AS [Feature_6], keras_input_1.[Feature_7] AS [Feature_7], keras_input_1.[Feature_8] AS [Feature_8], keras_input_1.[Feature_9] AS [Feature_9] 
FROM keras_input_1), 
gru_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.[KEY] AS [KEY], keras_input_1_rn.[Feature_0] AS [Feature_0], keras_input_1_rn.[Feature_1] AS [Feature_1], keras_input_1_rn.[Feature_2] AS [Feature_2], keras_input_1_rn.[Feature_3] AS [Feature_3], keras_input_1_rn.[Feature_4] AS [Feature_4], keras_input_1_rn.[Feature_5] AS [Feature_5], keras_input_1_rn.[Feature_6] AS [Feature_6], keras_input_1_rn.[Feature_7] AS [Feature_7], keras_input_1_rn.[Feature_8] AS [Feature_8], keras_input_1_rn.[Feature_9] AS [Feature_9], -0.6344567366773625 + -0.08884287551402763 * keras_input_1_rn.[Feature_0] + -0.4343457797262673 * keras_input_1_rn.[Feature_1] + 0.05327548111817924 * keras_input_1_rn.[Feature_2] + -0.30535797213606547 * keras_input_1_rn.[Feature_3] + -0.8750076750242349 * keras_input_1_rn.[Feature_4] + -0.4207585294066946 * keras_input_1_rn.[Feature_5] + -0.8576215821898852 * keras_input_1_rn.[Feature_6] + -0.8688394466307301 * keras_input_1_rn.[Feature_7] + -0.942836947120729 * keras_input_1_rn.[Feature_8] + -0.6371515388589711 * keras_input_1_rn.[Feature_9] AS dot_prod_z_1, -0.5151806313272346 + -0.8654504022285813 * keras_input_1_rn.[Feature_0] + -0.657784261137912 * keras_input_1_rn.[Feature_1] + -0.3253600329162182 * keras_input_1_rn.[Feature_2] + -0.973018602020559 * keras_input_1_rn.[Feature_3] + -0.3367710027326922 * keras_input_1_rn.[Feature_4] + -0.436693907558177 * keras_input_1_rn.[Feature_5] + -0.451415375679674 * keras_input_1_rn.[Feature_6] + -0.7828009196789212 * keras_input_1_rn.[Feature_7] + 0.002965595456195022 * keras_input_1_rn.[Feature_8] + -0.46090406454904453 * keras_input_1_rn.[Feature_9] AS dot_prod_z_2, 0.0 + -0.28557667362084055 * keras_input_1_rn.[Feature_0] + -0.26425666574811296 * keras_input_1_rn.[Feature_1] + -0.2699794796470867 * keras_input_1_rn.[Feature_2] + -0.4800863462467672 * keras_input_1_rn.[Feature_3] + -0.19371424232988738 * keras_input_1_rn.[Feature_4] + 0.44802432103928536 * keras_input_1_rn.[Feature_5] + -0.6000899780533389 * keras_input_1_rn.[Feature_6] + 0.6013298543215166 * keras_input_1_rn.[Feature_7] + -0.47342065670735217 * keras_input_1_rn.[Feature_8] + 0.5664661108741975 * keras_input_1_rn.[Feature_9] AS dot_prod_r_1, 0.0 + 0.5554617841509268 * keras_input_1_rn.[Feature_0] + -0.0005775954464235511 * keras_input_1_rn.[Feature_1] + 0.5807826543354393 * keras_input_1_rn.[Feature_2] + -0.4968619457429893 * keras_input_1_rn.[Feature_3] + -0.09543274362981924 * keras_input_1_rn.[Feature_4] + 0.05538030483526912 * keras_input_1_rn.[Feature_5] + 0.18703715250217423 * keras_input_1_rn.[Feature_6] + -0.10226582074121848 * keras_input_1_rn.[Feature_7] + 0.21201437703847426 * keras_input_1_rn.[Feature_8] + -0.36056722193250695 * keras_input_1_rn.[Feature_9] AS dot_prod_r_2, -0.47364179562365694 + -0.008134774219216443 * keras_input_1_rn.[Feature_0] + -0.33921854044021205 * keras_input_1_rn.[Feature_1] + 0.21548259136526401 * keras_input_1_rn.[Feature_2] + -0.8024559729157533 * keras_input_1_rn.[Feature_3] + -0.11853284101100962 * keras_input_1_rn.[Feature_4] + -0.9663655334990489 * keras_input_1_rn.[Feature_5] + -0.40381143415711973 * keras_input_1_rn.[Feature_6] + -0.7444636748042955 * keras_input_1_rn.[Feature_7] + -0.5791195197058607 * keras_input_1_rn.[Feature_8] + -0.632412984471248 * keras_input_1_rn.[Feature_9] AS dot_prod_h_1, 0.44359682837283476 + 0.4411833545726786 * keras_input_1_rn.[Feature_0] + 0.4539372809623698 * keras_input_1_rn.[Feature_1] + -0.08707945250628278 * keras_input_1_rn.[Feature_2] + 0.7026025775990862 * keras_input_1_rn.[Feature_3] + 0.30125185672284455 * keras_input_1_rn.[Feature_4] + -0.026083182675459053 * keras_input_1_rn.[Feature_5] + 0.7432461289393815 * keras_input_1_rn.[Feature_6] + 0.2717489279636455 * keras_input_1_rn.[Feature_7] + 0.09944823338771934 * keras_input_1_rn.[Feature_8] + 0.9603577952149268 * keras_input_1_rn.[Feature_9] AS dot_prod_h_2 
FROM keras_input_1_rn), 
rnn_cte_gru_1(rn_1, [KEY], [PreviousState_1], [PreviousState_2], [State_1], [State_2]) AS 
(SELECT gru_input_kernel_bias.rn AS rn_1, gru_input_kernel_bias.[KEY] AS [KEY], CAST(0.0 AS FLOAT(53)) AS [PreviousState_1], CAST(0.0 AS FLOAT(53)) AS [PreviousState_2], (1.0 - CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5) THEN 1.0 ELSE 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5) THEN 1.0 ELSE 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_1) + 0.5 END ELSE 0.0 END) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_1) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_1)))) AS [State_1], (1.0 - CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5) THEN 1.0 ELSE 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5) THEN 1.0 ELSE 0.2 * (0.0 + gru_input_kernel_bias.dot_prod_z_2) + 0.5 END ELSE 0.0 END) * ((exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) - exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2))) / (exp(0.0 + gru_input_kernel_bias.dot_prod_h_2) + exp(-(0.0 + gru_input_kernel_bias.dot_prod_h_2)))) AS [State_2] 
FROM gru_input_kernel_bias 
WHERE gru_input_kernel_bias.rn = 1 UNION ALL SELECT gru_input_kernel_bias.rn AS rn, gru_input_kernel_bias.[KEY] AS [KEY], CAST(0.0 AS FLOAT(53)) AS [PreviousState_1], CAST(0.0 AS FLOAT(53)) AS [PreviousState_2], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5) THEN 1.0 ELSE 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5) THEN 1.0 ELSE 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + (1.0 - CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5) THEN 1.0 ELSE 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5) THEN 1.0 ELSE 0.2 * (0.8138234813332196 * CAST(0.0 AS FLOAT(53)) + 0.03861754315374066 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_1) + 0.5 END ELSE 0.0 END) * ((exp(-0.20629458740002615 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.18588036651285594 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_1) - exp(-(-0.20629458740002615 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.18588036651285594 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_1))) / (exp(-0.20629458740002615 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.18588036651285594 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_1) + exp(-(-0.20629458740002615 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.18588036651285594 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_1)))) AS [State_1], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5) THEN 1.0 ELSE 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5) THEN 1.0 ELSE 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + (1.0 - CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5) THEN 1.0 ELSE 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5) THEN 1.0 ELSE 0.2 * (0.08426053191069505 * CAST(0.0 AS FLOAT(53)) + 0.27805107213113867 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_z_2) + 0.5 END ELSE 0.0 END) * ((exp(-0.2775259356596579 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.3697689785282325 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_2) - exp(-(-0.2775259356596579 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.3697689785282325 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_2))) / (exp(-0.2775259356596579 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.3697689785282325 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_2) + exp(-(-0.2775259356596579 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5) THEN 1.0 ELSE 0.2 * (-0.43752735121956315 * CAST(0.0 AS FLOAT(53)) + -0.4361016447237923 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_1) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + 0.3697689785282325 * CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5) THEN 1.0 ELSE 0.2 * (-0.1399400556427051 * CAST(0.0 AS FLOAT(53)) + 0.7481517452896373 * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_r_2) + 0.5 END ELSE 0.0 END * CAST(0.0 AS FLOAT(53)) + gru_input_kernel_bias.dot_prod_h_2)))) AS [State_2] 
FROM gru_input_kernel_bias, rnn_cte_gru_1 
WHERE gru_input_kernel_bias.rn = rnn_cte_gru_1.rn_1 + 1), 
gru_1 AS 
(SELECT rnn_cte_gru_1.[KEY] AS [KEY], CAST(rnn_cte_gru_1.[State_1] AS FLOAT(53)) AS output_1, CAST(rnn_cte_gru_1.[State_2] AS FLOAT(53)) AS output_2 
FROM rnn_cte_gru_1), 
gru_1_1 AS 
(SELECT gru_1.[KEY] AS [KEY], gru_1.output_1 AS output_1, gru_1.output_2 AS output_2 
FROM gru_1), 
layer_dense_1 AS 
(SELECT gru_1_1.[KEY] AS [KEY], 0.832041967108931 + -1.5757075985067328 * gru_1_1.output_1 + 2.1972589718879827 * gru_1_1.output_2 AS output_1 
FROM gru_1_1)
 SELECT layer_dense_1.[KEY] AS [KEY], layer_dense_1.output_1 AS [Estimator] 
FROM layer_dense_1