-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_LSTM
-- Dataset : BinaryClass_10
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9" 
FROM "BinaryClass_10" AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9" 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT (SELECT count(t."KEY") AS count_1 
FROM (SELECT keras_input_1."KEY" AS "KEY" 
FROM keras_input_1) AS t 
WHERE t."KEY" <= keras_input_1."KEY") AS rn, keras_input_1."KEY" AS "KEY", keras_input_1."Feature_0" AS "Feature_0", keras_input_1."Feature_1" AS "Feature_1", keras_input_1."Feature_2" AS "Feature_2", keras_input_1."Feature_3" AS "Feature_3", keras_input_1."Feature_4" AS "Feature_4", keras_input_1."Feature_5" AS "Feature_5", keras_input_1."Feature_6" AS "Feature_6", keras_input_1."Feature_7" AS "Feature_7", keras_input_1."Feature_8" AS "Feature_8", keras_input_1."Feature_9" AS "Feature_9" 
FROM keras_input_1), 
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", keras_input_1_rn."Feature_4" AS "Feature_4", keras_input_1_rn."Feature_5" AS "Feature_5", keras_input_1_rn."Feature_6" AS "Feature_6", keras_input_1_rn."Feature_7" AS "Feature_7", keras_input_1_rn."Feature_8" AS "Feature_8", keras_input_1_rn."Feature_9" AS "Feature_9", 0.12307072940858885 + -0.016295115511083556 * keras_input_1_rn."Feature_0" + 0.06624450875091845 * keras_input_1_rn."Feature_1" + -0.09800239979299913 * keras_input_1_rn."Feature_2" + -0.012362352237377527 * keras_input_1_rn."Feature_3" + 0.6061579632434527 * keras_input_1_rn."Feature_4" + -0.4023012984208115 * keras_input_1_rn."Feature_5" + -0.19907330195636663 * keras_input_1_rn."Feature_6" + 0.4632655561587989 * keras_input_1_rn."Feature_7" + 0.11720323191143608 * keras_input_1_rn."Feature_8" + -0.04845934950506519 * keras_input_1_rn."Feature_9" AS dot_prod_i_1, 0.12790884364788765 + 0.22339315427019527 * keras_input_1_rn."Feature_0" + 0.45746194164615384 * keras_input_1_rn."Feature_1" + 0.24546447441599603 * keras_input_1_rn."Feature_2" + -0.050623936250964424 * keras_input_1_rn."Feature_3" + 0.01770886246464201 * keras_input_1_rn."Feature_4" + 0.4788249354793985 * keras_input_1_rn."Feature_5" + 0.19697038753669865 * keras_input_1_rn."Feature_6" + -0.36598614400094626 * keras_input_1_rn."Feature_7" + 0.017227271658282584 * keras_input_1_rn."Feature_8" + 0.6077779481343358 * keras_input_1_rn."Feature_9" AS dot_prod_i_2, 0.09277205951285025 + -0.36954400343618565 * keras_input_1_rn."Feature_0" + -0.5740048121833017 * keras_input_1_rn."Feature_1" + -0.38716022921312854 * keras_input_1_rn."Feature_2" + 0.050582311534017814 * keras_input_1_rn."Feature_3" + 0.26680193697961824 * keras_input_1_rn."Feature_4" + 0.2995381531491264 * keras_input_1_rn."Feature_5" + 0.0653109768295145 * keras_input_1_rn."Feature_6" + -0.5562609702515103 * keras_input_1_rn."Feature_7" + -0.5457094883477874 * keras_input_1_rn."Feature_8" + -0.0011187290385889451 * keras_input_1_rn."Feature_9" AS dot_prod_i_3, 0.9629744600717444 + -0.16322102919861617 * keras_input_1_rn."Feature_0" + -0.20002500098691742 * keras_input_1_rn."Feature_1" + 0.51657812298431 * keras_input_1_rn."Feature_2" + -0.32769544453607546 * keras_input_1_rn."Feature_3" + 0.01664090120498486 * keras_input_1_rn."Feature_4" + 0.24778561402879634 * keras_input_1_rn."Feature_5" + 0.4889816580274014 * keras_input_1_rn."Feature_6" + 0.3624369529423046 * keras_input_1_rn."Feature_7" + -0.133327231888462 * keras_input_1_rn."Feature_8" + 0.4749810495427877 * keras_input_1_rn."Feature_9" AS dot_prod_f_1, 1.2552339215810173 + -0.6321053001614346 * keras_input_1_rn."Feature_0" + -0.11655347305442673 * keras_input_1_rn."Feature_1" + -0.4024417417436294 * keras_input_1_rn."Feature_2" + -0.4229632263528634 * keras_input_1_rn."Feature_3" + -0.40071174620563055 * keras_input_1_rn."Feature_4" + 0.3965706554753225 * keras_input_1_rn."Feature_5" + -0.33060052378462845 * keras_input_1_rn."Feature_6" + -0.39801925863103177 * keras_input_1_rn."Feature_7" + -0.27456016931376254 * keras_input_1_rn."Feature_8" + 0.31141568993047014 * keras_input_1_rn."Feature_9" AS dot_prod_f_2, 0.9794227116379571 + 0.1802047807909727 * keras_input_1_rn."Feature_0" + 0.14052913610346346 * keras_input_1_rn."Feature_1" + 0.34144422780697853 * keras_input_1_rn."Feature_2" + 0.2044498775173398 * keras_input_1_rn."Feature_3" + -0.011882267444573397 * keras_input_1_rn."Feature_4" + 0.27530878468591086 * keras_input_1_rn."Feature_5" + -0.5381010798178606 * keras_input_1_rn."Feature_6" + 0.1703808300927238 * keras_input_1_rn."Feature_7" + -0.1725778273703081 * keras_input_1_rn."Feature_8" + -0.0569466989797636 * keras_input_1_rn."Feature_9" AS dot_prod_f_3, -0.09653277323412719 + 0.057562237828976036 * keras_input_1_rn."Feature_0" + 0.06673871107532636 * keras_input_1_rn."Feature_1" + 0.10334513343463865 * keras_input_1_rn."Feature_2" + 0.33806287606298824 * keras_input_1_rn."Feature_3" + -0.11380822829099596 * keras_input_1_rn."Feature_4" + -0.029211507961255274 * keras_input_1_rn."Feature_5" + -0.2745379725381135 * keras_input_1_rn."Feature_6" + -0.29980222720137184 * keras_input_1_rn."Feature_7" + -0.04428228555836805 * keras_input_1_rn."Feature_8" + 0.7539523809422225 * keras_input_1_rn."Feature_9" AS dot_prod_c_1, 0.21748631770958327 + -0.2483349976862582 * keras_input_1_rn."Feature_0" + 0.5843268751216072 * keras_input_1_rn."Feature_1" + 0.47634678275125697 * keras_input_1_rn."Feature_2" + -0.12202095937283033 * keras_input_1_rn."Feature_3" + 0.04127974012632448 * keras_input_1_rn."Feature_4" + 0.4707546736624365 * keras_input_1_rn."Feature_5" + 0.3864963907197333 * keras_input_1_rn."Feature_6" + -0.6205432512495775 * keras_input_1_rn."Feature_7" + 0.10609851179278151 * keras_input_1_rn."Feature_8" + -0.011430491417043036 * keras_input_1_rn."Feature_9" AS dot_prod_c_2, 0.07425542869351272 + -0.5459024219996443 * keras_input_1_rn."Feature_0" + -0.4935570965452585 * keras_input_1_rn."Feature_1" + 0.20792557952570095 * keras_input_1_rn."Feature_2" + -0.3318136427407139 * keras_input_1_rn."Feature_3" + 0.015858109313710123 * keras_input_1_rn."Feature_4" + 0.1469862560019459 * keras_input_1_rn."Feature_5" + -0.30857716030166205 * keras_input_1_rn."Feature_6" + -0.4247853639105941 * keras_input_1_rn."Feature_7" + 0.26307146254658426 * keras_input_1_rn."Feature_8" + 0.365299618024286 * keras_input_1_rn."Feature_9" AS dot_prod_c_3, -0.0302391776925038 + 0.26523990954754734 * keras_input_1_rn."Feature_0" + -0.25448521494696047 * keras_input_1_rn."Feature_1" + -0.24070271337831003 * keras_input_1_rn."Feature_2" + 0.09003240880246965 * keras_input_1_rn."Feature_3" + 0.2243250907186032 * keras_input_1_rn."Feature_4" + 0.2688105904148112 * keras_input_1_rn."Feature_5" + 0.11663912415925695 * keras_input_1_rn."Feature_6" + -0.23958683763341398 * keras_input_1_rn."Feature_7" + -0.12758457999330225 * keras_input_1_rn."Feature_8" + -0.1779804705922848 * keras_input_1_rn."Feature_9" AS dot_prod_o_1, 0.06073244496888123 + -0.911441543117071 * keras_input_1_rn."Feature_0" + 0.1876243228702539 * keras_input_1_rn."Feature_1" + -0.05534791929253556 * keras_input_1_rn."Feature_2" + -0.32120573320638 * keras_input_1_rn."Feature_3" + -0.1992486302033126 * keras_input_1_rn."Feature_4" + -0.3464358944339925 * keras_input_1_rn."Feature_5" + 0.2172533764135385 * keras_input_1_rn."Feature_6" + -0.9109439591138703 * keras_input_1_rn."Feature_7" + -0.07778595911791257 * keras_input_1_rn."Feature_8" + 0.7569091995711427 * keras_input_1_rn."Feature_9" AS dot_prod_o_2, -0.08147840264365136 + -0.31360524563368575 * keras_input_1_rn."Feature_0" + -0.13453712609121654 * keras_input_1_rn."Feature_1" + 0.04169416968833159 * keras_input_1_rn."Feature_2" + 0.44508458453438937 * keras_input_1_rn."Feature_3" + 0.2188069060069084 * keras_input_1_rn."Feature_4" + -0.4687338132122748 * keras_input_1_rn."Feature_5" + -0.5499084275786156 * keras_input_1_rn."Feature_6" + 0.07503673156965432 * keras_input_1_rn."Feature_7" + 0.23518267167054985 * keras_input_1_rn."Feature_8" + -0.33380278677396563 * keras_input_1_rn."Feature_9" AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", "PreviousState_3", "PreviousState_4", "PreviousState_5", "PreviousState_6", "State_1", "State_2", "State_3", "State_4", "State_5", "State_6") AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS FLOAT) AS "PreviousState_1", CAST(0.0 AS FLOAT) AS "PreviousState_2", CAST(0.0 AS FLOAT) AS "PreviousState_3", CAST(0.0 AS FLOAT) AS "PreviousState_4", CAST(0.0 AS FLOAT) AS "PreviousState_5", CAST(0.0 AS FLOAT) AS "PreviousState_6", max(lstm_input_kernel_bias.dot_prod_o_1 + 0.0, 0) * tanh(max(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + max(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0) AS "State_1", max(lstm_input_kernel_bias.dot_prod_o_2 + 0.0, 0) * tanh(max(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + max(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0) AS "State_2", max(lstm_input_kernel_bias.dot_prod_o_3 + 0.0, 0) * tanh(max(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + max(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0) AS "State_3", max(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + max(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0 AS "State_4", max(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + max(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0 AS "State_5", max(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + max(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0 AS "State_6" 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias."KEY" AS "KEY", rnn_cte_lstm_1."State_1" AS "PreviousState_1", rnn_cte_lstm_1."State_2" AS "PreviousState_2", rnn_cte_lstm_1."State_3" AS "PreviousState_3", rnn_cte_lstm_1."State_4" AS "PreviousState_4", rnn_cte_lstm_1."State_5" AS "PreviousState_5", rnn_cte_lstm_1."State_6" AS "PreviousState_6", max(lstm_input_kernel_bias.dot_prod_o_1 + -0.16762967890746974 * rnn_cte_lstm_1."State_1" + 0.005597990616175263 * rnn_cte_lstm_1."State_2" + -0.10286906133596868 * rnn_cte_lstm_1."State_3", 0) * tanh(max(lstm_input_kernel_bias.dot_prod_i_1 + -0.0010420017965313228 * rnn_cte_lstm_1."State_1" + 0.358987024424689 * rnn_cte_lstm_1."State_2" + -0.10766710892979788 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.03752604996332553 * rnn_cte_lstm_1."State_1" + 0.02768146440695024 * rnn_cte_lstm_1."State_2" + 0.5511533055326917 * rnn_cte_lstm_1."State_3") + max(lstm_input_kernel_bias.dot_prod_f_1 + -0.4259157138539399 * rnn_cte_lstm_1."State_1" + 0.0991669923954855 * rnn_cte_lstm_1."State_2" + -0.06459371139877969 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4") AS "State_1", max(lstm_input_kernel_bias.dot_prod_o_2 + -0.010162474643468361 * rnn_cte_lstm_1."State_1" + 0.6840958315865961 * rnn_cte_lstm_1."State_2" + -0.1115831865241463 * rnn_cte_lstm_1."State_3", 0) * tanh(max(lstm_input_kernel_bias.dot_prod_i_2 + -0.22544763722654454 * rnn_cte_lstm_1."State_1" + -0.09265259124431588 * rnn_cte_lstm_1."State_2" + -0.09813266285523749 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.12334792443351204 * rnn_cte_lstm_1."State_1" + 0.6045807466478506 * rnn_cte_lstm_1."State_2" + 0.18266193343544845 * rnn_cte_lstm_1."State_3") + max(lstm_input_kernel_bias.dot_prod_f_2 + 0.2848339411487133 * rnn_cte_lstm_1."State_1" + 0.18421729591972258 * rnn_cte_lstm_1."State_2" + 0.6611715830649668 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5") AS "State_2", max(lstm_input_kernel_bias.dot_prod_o_3 + 0.6158746863068318 * rnn_cte_lstm_1."State_1" + -0.1937623995342916 * rnn_cte_lstm_1."State_2" + -0.5173639956779246 * rnn_cte_lstm_1."State_3", 0) * tanh(max(lstm_input_kernel_bias.dot_prod_i_3 + -0.10835679523865967 * rnn_cte_lstm_1."State_1" + 0.41875671163957484 * rnn_cte_lstm_1."State_2" + -0.10909998742113919 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + -0.03299774415662299 * rnn_cte_lstm_1."State_1" + -0.0802289482449878 * rnn_cte_lstm_1."State_2" + -0.06476944451637492 * rnn_cte_lstm_1."State_3") + max(lstm_input_kernel_bias.dot_prod_f_3 + 0.4119753810521627 * rnn_cte_lstm_1."State_1" + 0.31885557417834964 * rnn_cte_lstm_1."State_2" + 0.038521182546093054 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6") AS "State_3", max(lstm_input_kernel_bias.dot_prod_i_1 + -0.0010420017965313228 * rnn_cte_lstm_1."State_1" + 0.358987024424689 * rnn_cte_lstm_1."State_2" + -0.10766710892979788 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.03752604996332553 * rnn_cte_lstm_1."State_1" + 0.02768146440695024 * rnn_cte_lstm_1."State_2" + 0.5511533055326917 * rnn_cte_lstm_1."State_3") + max(lstm_input_kernel_bias.dot_prod_f_1 + -0.4259157138539399 * rnn_cte_lstm_1."State_1" + 0.0991669923954855 * rnn_cte_lstm_1."State_2" + -0.06459371139877969 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4" AS "State_4", max(lstm_input_kernel_bias.dot_prod_i_2 + -0.22544763722654454 * rnn_cte_lstm_1."State_1" + -0.09265259124431588 * rnn_cte_lstm_1."State_2" + -0.09813266285523749 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.12334792443351204 * rnn_cte_lstm_1."State_1" + 0.6045807466478506 * rnn_cte_lstm_1."State_2" + 0.18266193343544845 * rnn_cte_lstm_1."State_3") + max(lstm_input_kernel_bias.dot_prod_f_2 + 0.2848339411487133 * rnn_cte_lstm_1."State_1" + 0.18421729591972258 * rnn_cte_lstm_1."State_2" + 0.6611715830649668 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5" AS "State_5", max(lstm_input_kernel_bias.dot_prod_i_3 + -0.10835679523865967 * rnn_cte_lstm_1."State_1" + 0.41875671163957484 * rnn_cte_lstm_1."State_2" + -0.10909998742113919 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + -0.03299774415662299 * rnn_cte_lstm_1."State_1" + -0.0802289482449878 * rnn_cte_lstm_1."State_2" + -0.06476944451637492 * rnn_cte_lstm_1."State_3") + max(lstm_input_kernel_bias.dot_prod_f_3 + 0.4119753810521627 * rnn_cte_lstm_1."State_1" + 0.31885557417834964 * rnn_cte_lstm_1."State_2" + 0.038521182546093054 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6" AS "State_6" 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1."KEY" AS "KEY", CAST(rnn_cte_lstm_1."State_1" AS FLOAT) AS output_1, CAST(rnn_cte_lstm_1."State_2" AS FLOAT) AS output_2, CAST(rnn_cte_lstm_1."State_3" AS FLOAT) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1."KEY" AS "KEY", lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1."KEY" AS "KEY", 0.0774961068156797 + -0.4737753467989032 * lstm_1_1.output_1 + -0.5775076731312051 * lstm_1_1.output_2 + -0.4040671886359914 * lstm_1_1.output_3 AS output_1, -0.07749610681567967 + 0.9343507433790119 * lstm_1_1.output_1 + -0.14105889483434347 * lstm_1_1.output_2 + 0.2800682001772759 * lstm_1_1.output_3 AS output_2 
FROM lstm_1_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2 
FROM layer_dense_1), 
score_soft_max_step1 AS 
(SELECT layer_dense_1_1."KEY" AS "KEY", layer_dense_1_1.output_1 AS "Score_0", exp(min(100.0, max(-100.0, layer_dense_1_1.output_1))) AS "exp_Score_0", layer_dense_1_1.output_2 AS "Score_1", exp(min(100.0, max(-100.0, layer_dense_1_1.output_2))) AS "exp_Score_1" 
FROM layer_dense_1_1), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_Score" AS "exp_Score" 
FROM (SELECT score_soft_max_step1."KEY" AS "KEY", 0 AS class, score_soft_max_step1."exp_Score_0" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 1 AS class, score_soft_max_step1."exp_Score_1" AS "exp_Score" 
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1."KEY" AS "KEY", score_soft_max_step1."Score_0" AS "Score_0", score_soft_max_step1."exp_Score_0" AS "exp_Score_0", score_soft_max_step1."Score_1" AS "Score_1", score_soft_max_step1."exp_Score_1" AS "exp_Score_1", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpScore" AS "sum_ExpScore" 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_Score") AS "sum_ExpScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_step1."KEY" = sum_exp_t."KEY_sum"), 
layer_softmax AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."exp_Score_0" / score_soft_max."sum_ExpScore" AS output_1, score_soft_max."exp_Score_1" / score_soft_max."sum_ExpScore" AS output_2 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", layer_softmax.output_1 AS "Proba_0", layer_softmax.output_2 AS "Proba_1", CAST(NULL AS FLOAT) AS "LogProba_0", CAST(NULL AS FLOAT) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte