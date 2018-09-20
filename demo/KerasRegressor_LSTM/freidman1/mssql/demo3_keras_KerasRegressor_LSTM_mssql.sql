-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_LSTM
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
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.[KEY] AS [KEY], keras_input_1_rn.[Feature_0] AS [Feature_0], keras_input_1_rn.[Feature_1] AS [Feature_1], keras_input_1_rn.[Feature_2] AS [Feature_2], keras_input_1_rn.[Feature_3] AS [Feature_3], keras_input_1_rn.[Feature_4] AS [Feature_4], keras_input_1_rn.[Feature_5] AS [Feature_5], keras_input_1_rn.[Feature_6] AS [Feature_6], keras_input_1_rn.[Feature_7] AS [Feature_7], keras_input_1_rn.[Feature_8] AS [Feature_8], keras_input_1_rn.[Feature_9] AS [Feature_9], 0.03829108407540385 + 0.4544480840840393 * keras_input_1_rn.[Feature_0] + 0.5381584716200171 * keras_input_1_rn.[Feature_1] + -0.30281138575827454 * keras_input_1_rn.[Feature_2] + -0.26191610000777493 * keras_input_1_rn.[Feature_3] + -0.35913247556473155 * keras_input_1_rn.[Feature_4] + 0.16489744542684875 * keras_input_1_rn.[Feature_5] + 0.3091528846563989 * keras_input_1_rn.[Feature_6] + -0.1834140264689528 * keras_input_1_rn.[Feature_7] + -0.2880227867648488 * keras_input_1_rn.[Feature_8] + 0.07546890484961176 * keras_input_1_rn.[Feature_9] AS dot_prod_i_1, 0.023746291249982995 + -0.3591982005287428 * keras_input_1_rn.[Feature_0] + 0.08322063764630575 * keras_input_1_rn.[Feature_1] + 0.07711840098345539 * keras_input_1_rn.[Feature_2] + -0.027048762192919063 * keras_input_1_rn.[Feature_3] + 0.417168851831348 * keras_input_1_rn.[Feature_4] + -0.17820927799383288 * keras_input_1_rn.[Feature_5] + -0.06536634313293303 * keras_input_1_rn.[Feature_6] + 0.06477395721322853 * keras_input_1_rn.[Feature_7] + -0.3917607973387847 * keras_input_1_rn.[Feature_8] + 0.11335043951079675 * keras_input_1_rn.[Feature_9] AS dot_prod_i_2, -0.0297255453410593 + -0.27226256059976545 * keras_input_1_rn.[Feature_0] + -0.2509362849869037 * keras_input_1_rn.[Feature_1] + -0.19349178304189105 * keras_input_1_rn.[Feature_2] + -0.5399150124756352 * keras_input_1_rn.[Feature_3] + -0.42957074719005967 * keras_input_1_rn.[Feature_4] + 0.39440591805107084 * keras_input_1_rn.[Feature_5] + -0.07230051485768041 * keras_input_1_rn.[Feature_6] + 0.03541220560855455 * keras_input_1_rn.[Feature_7] + -0.2775644382416108 * keras_input_1_rn.[Feature_8] + 0.3815189165008297 * keras_input_1_rn.[Feature_9] AS dot_prod_i_3, 1.043078663897611 + 0.5112364526319662 * keras_input_1_rn.[Feature_0] + 0.5297496519042706 * keras_input_1_rn.[Feature_1] + -0.04772645858676381 * keras_input_1_rn.[Feature_2] + 0.19482918650874007 * keras_input_1_rn.[Feature_3] + 0.2218269551226912 * keras_input_1_rn.[Feature_4] + 0.3998112839581403 * keras_input_1_rn.[Feature_5] + -0.05708158089449318 * keras_input_1_rn.[Feature_6] + 0.3589962213714952 * keras_input_1_rn.[Feature_7] + 0.331894243566629 * keras_input_1_rn.[Feature_8] + 0.0655916166571585 * keras_input_1_rn.[Feature_9] AS dot_prod_f_1, 1.0216469152384697 + 0.3800920400003033 * keras_input_1_rn.[Feature_0] + 0.5254811604233269 * keras_input_1_rn.[Feature_1] + 0.22699604356540537 * keras_input_1_rn.[Feature_2] + -0.00830898952824577 * keras_input_1_rn.[Feature_3] + -0.1454385796992201 * keras_input_1_rn.[Feature_4] + 0.4567476626067879 * keras_input_1_rn.[Feature_5] + 0.15347682502492843 * keras_input_1_rn.[Feature_6] + -0.3468896918938949 * keras_input_1_rn.[Feature_7] + -0.501230798596657 * keras_input_1_rn.[Feature_8] + 0.011678956875064438 * keras_input_1_rn.[Feature_9] AS dot_prod_f_2, 0.9668102739523439 + 0.007728068761619094 * keras_input_1_rn.[Feature_0] + -0.39663535893760204 * keras_input_1_rn.[Feature_1] + -0.08139553510614309 * keras_input_1_rn.[Feature_2] + 0.2928472196132479 * keras_input_1_rn.[Feature_3] + -0.2601749172122129 * keras_input_1_rn.[Feature_4] + 0.16883217545791168 * keras_input_1_rn.[Feature_5] + 0.33860627372052865 * keras_input_1_rn.[Feature_6] + -0.019741286563890043 * keras_input_1_rn.[Feature_7] + -0.03931434036771706 * keras_input_1_rn.[Feature_8] + -0.1811651674535157 * keras_input_1_rn.[Feature_9] AS dot_prod_f_3, -0.041198688807555436 + 0.014315655501238062 * keras_input_1_rn.[Feature_0] + 0.16968272114424415 * keras_input_1_rn.[Feature_1] + 0.05740947486163263 * keras_input_1_rn.[Feature_2] + -0.3974836072388876 * keras_input_1_rn.[Feature_3] + -0.14218462877783566 * keras_input_1_rn.[Feature_4] + 0.15451642679496883 * keras_input_1_rn.[Feature_5] + 0.13801541011038415 * keras_input_1_rn.[Feature_6] + -0.53207649336281 * keras_input_1_rn.[Feature_7] + -0.2273571961582195 * keras_input_1_rn.[Feature_8] + 0.07023854714854605 * keras_input_1_rn.[Feature_9] AS dot_prod_c_1, 0.33734628111332365 + 0.06421172661516768 * keras_input_1_rn.[Feature_0] + -0.2102888979310762 * keras_input_1_rn.[Feature_1] + 0.277203809119784 * keras_input_1_rn.[Feature_2] + -0.0514646427227933 * keras_input_1_rn.[Feature_3] + 0.2385790597756768 * keras_input_1_rn.[Feature_4] + 0.7714602706482885 * keras_input_1_rn.[Feature_5] + 0.5462923047210173 * keras_input_1_rn.[Feature_6] + -0.16120156997184562 * keras_input_1_rn.[Feature_7] + -0.0563305729488744 * keras_input_1_rn.[Feature_8] + -0.12303814340006293 * keras_input_1_rn.[Feature_9] AS dot_prod_c_2, -0.03825762379528626 + -0.2599845558100993 * keras_input_1_rn.[Feature_0] + -0.44029090270689064 * keras_input_1_rn.[Feature_1] + 0.3484228016546723 * keras_input_1_rn.[Feature_2] + 0.4771390406939014 * keras_input_1_rn.[Feature_3] + 0.44995246086365975 * keras_input_1_rn.[Feature_4] + -0.3362353998557455 * keras_input_1_rn.[Feature_5] + -0.05384198281960329 * keras_input_1_rn.[Feature_6] + 0.25853230003619276 * keras_input_1_rn.[Feature_7] + 0.104740536994269 * keras_input_1_rn.[Feature_8] + 0.4680129760578482 * keras_input_1_rn.[Feature_9] AS dot_prod_c_3, 0.04859729012339887 + 0.04187063895015475 * keras_input_1_rn.[Feature_0] + -0.38414929677193754 * keras_input_1_rn.[Feature_1] + 0.08276618499577801 * keras_input_1_rn.[Feature_2] + -0.0476640870691355 * keras_input_1_rn.[Feature_3] + -0.26278538079889835 * keras_input_1_rn.[Feature_4] + 0.4259615633269254 * keras_input_1_rn.[Feature_5] + -0.34327724260543874 * keras_input_1_rn.[Feature_6] + 0.5393939511718981 * keras_input_1_rn.[Feature_7] + 0.13595920853069401 * keras_input_1_rn.[Feature_8] + -0.3523905177755418 * keras_input_1_rn.[Feature_9] AS dot_prod_o_1, 0.019207239156821265 + 0.05610344606618586 * keras_input_1_rn.[Feature_0] + -0.31682986247736483 * keras_input_1_rn.[Feature_1] + -0.47503984139619415 * keras_input_1_rn.[Feature_2] + -0.3087539375727694 * keras_input_1_rn.[Feature_3] + -0.19392646007740438 * keras_input_1_rn.[Feature_4] + -0.3831348856263714 * keras_input_1_rn.[Feature_5] + -0.3007856252508905 * keras_input_1_rn.[Feature_6] + 0.0587698556453191 * keras_input_1_rn.[Feature_7] + 0.4985424240576274 * keras_input_1_rn.[Feature_8] + 0.0866657622467653 * keras_input_1_rn.[Feature_9] AS dot_prod_o_2, -0.03346015800054645 + 0.051449932649329955 * keras_input_1_rn.[Feature_0] + 0.2586021454617385 * keras_input_1_rn.[Feature_1] + -0.37474861167548745 * keras_input_1_rn.[Feature_2] + -0.09380449820263988 * keras_input_1_rn.[Feature_3] + 0.48096279292344474 * keras_input_1_rn.[Feature_4] + 0.4340526099520203 * keras_input_1_rn.[Feature_5] + -0.47228460548088086 * keras_input_1_rn.[Feature_6] + -0.21029303086946072 * keras_input_1_rn.[Feature_7] + -0.1609301726040901 * keras_input_1_rn.[Feature_8] + 0.37283065141261107 * keras_input_1_rn.[Feature_9] AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, [KEY], [PreviousState_1], [PreviousState_2], [PreviousState_3], [PreviousState_4], [PreviousState_5], [PreviousState_6], [State_1], [State_2], [State_3], [State_4], [State_5], [State_6]) AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias.[KEY] AS [KEY], CAST(0.0 AS FLOAT(53)) AS [PreviousState_1], CAST(0.0 AS FLOAT(53)) AS [PreviousState_2], CAST(0.0 AS FLOAT(53)) AS [PreviousState_3], CAST(0.0 AS FLOAT(53)) AS [PreviousState_4], CAST(0.0 AS FLOAT(53)) AS [PreviousState_5], CAST(0.0 AS FLOAT(53)) AS [PreviousState_6], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5 END ELSE 0.0 END * (CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5 END ELSE 0.0 END * 0.0) AS [State_1], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5 END ELSE 0.0 END * (CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5 END ELSE 0.0 END * 0.0) AS [State_2], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5 END ELSE 0.0 END * (CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5 END ELSE 0.0 END * 0.0) AS [State_3], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5 END ELSE 0.0 END * 0.0 AS [State_4], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5 END ELSE 0.0 END * 0.0 AS [State_5], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5 END ELSE 0.0 END * 0.0 AS [State_6] 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias.[KEY] AS [KEY], rnn_cte_lstm_1.[State_1] AS [PreviousState_1], rnn_cte_lstm_1.[State_2] AS [PreviousState_2], rnn_cte_lstm_1.[State_3] AS [PreviousState_3], rnn_cte_lstm_1.[State_4] AS [PreviousState_4], rnn_cte_lstm_1.[State_5] AS [PreviousState_5], rnn_cte_lstm_1.[State_6] AS [PreviousState_6], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + -0.015385645272321303 * rnn_cte_lstm_1.[State_1] + 0.27062032217604126 * rnn_cte_lstm_1.[State_2] + 0.472280151398981 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + -0.015385645272321303 * rnn_cte_lstm_1.[State_1] + 0.27062032217604126 * rnn_cte_lstm_1.[State_2] + 0.472280151398981 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + -0.015385645272321303 * rnn_cte_lstm_1.[State_1] + 0.27062032217604126 * rnn_cte_lstm_1.[State_2] + 0.472280151398981 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + -0.015385645272321303 * rnn_cte_lstm_1.[State_1] + 0.27062032217604126 * rnn_cte_lstm_1.[State_2] + 0.472280151398981 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_1 + -0.04045694941359315 * rnn_cte_lstm_1.[State_1] + 0.3532482969662487 * rnn_cte_lstm_1.[State_2] + 0.27696748398236526 * rnn_cte_lstm_1.[State_3]) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * rnn_cte_lstm_1.[State_4]) AS [State_1], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.23180952164283666 * rnn_cte_lstm_1.[State_1] + -0.32486672217774887 * rnn_cte_lstm_1.[State_2] + 0.2110633035672315 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.23180952164283666 * rnn_cte_lstm_1.[State_1] + -0.32486672217774887 * rnn_cte_lstm_1.[State_2] + 0.2110633035672315 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.23180952164283666 * rnn_cte_lstm_1.[State_1] + -0.32486672217774887 * rnn_cte_lstm_1.[State_2] + 0.2110633035672315 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.23180952164283666 * rnn_cte_lstm_1.[State_1] + -0.32486672217774887 * rnn_cte_lstm_1.[State_2] + 0.2110633035672315 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_2 + 0.26190236074329104 * rnn_cte_lstm_1.[State_1] + -0.026005449184779025 * rnn_cte_lstm_1.[State_2] + 0.3566024694913688 * rnn_cte_lstm_1.[State_3]) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * rnn_cte_lstm_1.[State_5]) AS [State_2], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.14150698245404936 * rnn_cte_lstm_1.[State_1] + 0.05194029925589038 * rnn_cte_lstm_1.[State_2] + -0.35345133394193534 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.14150698245404936 * rnn_cte_lstm_1.[State_1] + 0.05194029925589038 * rnn_cte_lstm_1.[State_2] + -0.35345133394193534 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.14150698245404936 * rnn_cte_lstm_1.[State_1] + 0.05194029925589038 * rnn_cte_lstm_1.[State_2] + -0.35345133394193534 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.14150698245404936 * rnn_cte_lstm_1.[State_1] + 0.05194029925589038 * rnn_cte_lstm_1.[State_2] + -0.35345133394193534 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_3 + 0.48742295059701346 * rnn_cte_lstm_1.[State_1] + -0.010040218254005445 * rnn_cte_lstm_1.[State_2] + 0.05213827104154374 * rnn_cte_lstm_1.[State_3]) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * rnn_cte_lstm_1.[State_6]) AS [State_3], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.7032096402689625 * rnn_cte_lstm_1.[State_1] + -0.1329527715586535 * rnn_cte_lstm_1.[State_2] + -0.10818526375489337 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_1 + -0.04045694941359315 * rnn_cte_lstm_1.[State_1] + 0.3532482969662487 * rnn_cte_lstm_1.[State_2] + 0.27696748398236526 * rnn_cte_lstm_1.[State_3]) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.10301105436096462 * rnn_cte_lstm_1.[State_1] + 0.31150394239051427 * rnn_cte_lstm_1.[State_2] + 0.017379429888539463 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * rnn_cte_lstm_1.[State_4] AS [State_4], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.15989646518306258 * rnn_cte_lstm_1.[State_1] + -0.2350566299639952 * rnn_cte_lstm_1.[State_2] + 0.11371235465967411 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_2 + 0.26190236074329104 * rnn_cte_lstm_1.[State_1] + -0.026005449184779025 * rnn_cte_lstm_1.[State_2] + 0.3566024694913688 * rnn_cte_lstm_1.[State_3]) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.22537033948891663 * rnn_cte_lstm_1.[State_1] + -0.09377302394092857 * rnn_cte_lstm_1.[State_2] + 0.45613906413327787 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * rnn_cte_lstm_1.[State_5] AS [State_5], CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.17186833644291813 * rnn_cte_lstm_1.[State_1] + 0.3338348230420924 * rnn_cte_lstm_1.[State_2] + -0.353492400402844 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * (lstm_input_kernel_bias.dot_prod_c_3 + 0.48742295059701346 * rnn_cte_lstm_1.[State_1] + -0.010040218254005445 * rnn_cte_lstm_1.[State_2] + 0.05213827104154374 * rnn_cte_lstm_1.[State_3]) + CASE WHEN (0.0 <= CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5 END) THEN CASE WHEN (1.0 <= 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5) THEN 1.0 ELSE 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.006109208098094443 * rnn_cte_lstm_1.[State_1] + 0.5823793412248416 * rnn_cte_lstm_1.[State_2] + -0.31968171658312583 * rnn_cte_lstm_1.[State_3]) + 0.5 END ELSE 0.0 END * rnn_cte_lstm_1.[State_6] AS [State_6] 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1.[KEY] AS [KEY], CAST(rnn_cte_lstm_1.[State_1] AS FLOAT(53)) AS output_1, CAST(rnn_cte_lstm_1.[State_2] AS FLOAT(53)) AS output_2, CAST(rnn_cte_lstm_1.[State_3] AS FLOAT(53)) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1.[KEY] AS [KEY], lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1.[KEY] AS [KEY], 0.013428397757290945 + -0.3439629295330323 * lstm_1_1.output_1 + -4.220410851496186e-09 * lstm_1_1.output_2 + -0.41801668530747044 * lstm_1_1.output_3 AS output_1 
FROM lstm_1_1)
 SELECT layer_dense_1.[KEY] AS [KEY], layer_dense_1.output_1 AS [Estimator] 
FROM layer_dense_1