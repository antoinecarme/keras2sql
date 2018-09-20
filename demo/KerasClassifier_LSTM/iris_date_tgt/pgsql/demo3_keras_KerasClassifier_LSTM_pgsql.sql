-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_LSTM
-- Dataset : iris_date_tgt
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3" 
FROM iris_date_tgt AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3" 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1."KEY" ASC) AS rn, keras_input_1."KEY" AS "KEY", keras_input_1."Feature_0" AS "Feature_0", keras_input_1."Feature_1" AS "Feature_1", keras_input_1."Feature_2" AS "Feature_2", keras_input_1."Feature_3" AS "Feature_3" 
FROM keras_input_1), 
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", 0.0 + -0.07977186227617139 * keras_input_1_rn."Feature_0" + 0.06407865802912294 * keras_input_1_rn."Feature_1" + -0.054359132956321665 * keras_input_1_rn."Feature_2" + -0.012854597867053785 * keras_input_1_rn."Feature_3" AS dot_prod_i_1, 0.0 + 0.44783934898548305 * keras_input_1_rn."Feature_0" + 0.4857470596700777 * keras_input_1_rn."Feature_1" + 0.2177566704947801 * keras_input_1_rn."Feature_2" + -0.05338620029492036 * keras_input_1_rn."Feature_3" AS dot_prod_i_2, 0.0 + -0.378834269310854 * keras_input_1_rn."Feature_0" + -0.5947360746917778 * keras_input_1_rn."Feature_1" + -0.44771291896500787 * keras_input_1_rn."Feature_2" + 0.012224205431599855 * keras_input_1_rn."Feature_3" AS dot_prod_i_3, 1.0 + -0.2283105461114897 * keras_input_1_rn."Feature_0" + -0.22062014088424453 * keras_input_1_rn."Feature_1" + 0.6022551430623415 * keras_input_1_rn."Feature_2" + -0.3393095033599692 * keras_input_1_rn."Feature_3" AS dot_prod_f_1, 1.0 + -0.44480107780780753 * keras_input_1_rn."Feature_0" + -0.2908629892559031 * keras_input_1_rn."Feature_1" + -0.552333678280358 * keras_input_1_rn."Feature_2" + -0.5478213958305708 * keras_input_1_rn."Feature_3" AS dot_prod_f_2, 1.0 + 0.26367587964017847 * keras_input_1_rn."Feature_0" + 0.15784326417919892 * keras_input_1_rn."Feature_1" + 0.45037319692407674 * keras_input_1_rn."Feature_2" + 0.2589452412257085 * keras_input_1_rn."Feature_3" AS dot_prod_f_3, 0.0 + 0.3051190675499984 * keras_input_1_rn."Feature_0" + 0.15301114991127307 * keras_input_1_rn."Feature_1" + 0.04281484124344892 * keras_input_1_rn."Feature_2" + 0.5718754278691192 * keras_input_1_rn."Feature_3" AS dot_prod_c_1, 0.0 + -0.08248246089466438 * keras_input_1_rn."Feature_0" + 0.6050381152715105 * keras_input_1_rn."Feature_1" + 0.5573442244755313 * keras_input_1_rn."Feature_2" + -0.12951711237504243 * keras_input_1_rn."Feature_3" AS dot_prod_c_2, 0.0 + -0.4846040888531703 * keras_input_1_rn."Feature_0" + -0.5235510035996684 * keras_input_1_rn."Feature_1" + 0.26900032613124025 * keras_input_1_rn."Feature_2" + -0.4825366546619857 * keras_input_1_rn."Feature_3" AS dot_prod_c_3, 0.0 + 0.10090713818814001 * keras_input_1_rn."Feature_0" + -0.3135517847005039 * keras_input_1_rn."Feature_1" + -0.30838936457159694 * keras_input_1_rn."Feature_2" + 0.1494208550049828 * keras_input_1_rn."Feature_3" AS dot_prod_o_1, 0.0 + -0.5614391043503655 * keras_input_1_rn."Feature_0" + 0.1970986226502205 * keras_input_1_rn."Feature_1" + -0.11747589830010613 * keras_input_1_rn."Feature_2" + -0.5820726942311354 * keras_input_1_rn."Feature_3" AS dot_prod_o_2, 0.0 + -0.21797837907769524 * keras_input_1_rn."Feature_0" + -0.16337893967151507 * keras_input_1_rn."Feature_1" + 0.06636456179235906 * keras_input_1_rn."Feature_2" + 0.6014305994906037 * keras_input_1_rn."Feature_3" AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", "PreviousState_3", "PreviousState_4", "PreviousState_5", "PreviousState_6", "State_1", "State_2", "State_3", "State_4", "State_5", "State_6") AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS FLOAT) AS "PreviousState_1", CAST(0.0 AS FLOAT) AS "PreviousState_2", CAST(0.0 AS FLOAT) AS "PreviousState_3", CAST(0.0 AS FLOAT) AS "PreviousState_4", CAST(0.0 AS FLOAT) AS "PreviousState_5", CAST(0.0 AS FLOAT) AS "PreviousState_6", greatest(lstm_input_kernel_bias.dot_prod_o_1 + 0.0, 0) * ((exp(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0) - exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0))) / (exp(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0) + exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0)))) AS "State_1", greatest(lstm_input_kernel_bias.dot_prod_o_2 + 0.0, 0) * ((exp(greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0) - exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0))) / (exp(greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0) + exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0)))) AS "State_2", greatest(lstm_input_kernel_bias.dot_prod_o_3 + 0.0, 0) * ((exp(greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0) - exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0))) / (exp(greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0) + exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0)))) AS "State_3", greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0 AS "State_4", greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0 AS "State_5", greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + 0.0)))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0 AS "State_6" 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias."KEY" AS "KEY", rnn_cte_lstm_1."State_1" AS "PreviousState_1", rnn_cte_lstm_1."State_2" AS "PreviousState_2", rnn_cte_lstm_1."State_3" AS "PreviousState_3", rnn_cte_lstm_1."State_4" AS "PreviousState_4", rnn_cte_lstm_1."State_5" AS "PreviousState_5", rnn_cte_lstm_1."State_6" AS "PreviousState_6", greatest(lstm_input_kernel_bias.dot_prod_o_1 + -0.15164751198979584 * rnn_cte_lstm_1."State_1" + 0.08253020083536827 * rnn_cte_lstm_1."State_2" + -0.08763056336675054 * rnn_cte_lstm_1."State_3", 0) * ((exp(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4") - exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4"))) / (exp(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4") + exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4")))) AS "State_1", greatest(lstm_input_kernel_bias.dot_prod_o_2 + 0.08662667743445306 * rnn_cte_lstm_1."State_1" + 0.6291438223603882 * rnn_cte_lstm_1."State_2" + -0.21097102613985744 * rnn_cte_lstm_1."State_3", 0) * ((exp(greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5") - exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5"))) / (exp(greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5") + exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5")))) AS "State_2", greatest(lstm_input_kernel_bias.dot_prod_o_3 + 0.6248732477230643 * rnn_cte_lstm_1."State_1" + -0.3162233397893954 * rnn_cte_lstm_1."State_2" + -0.47679471737944495 * rnn_cte_lstm_1."State_3", 0) * ((exp(greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6") - exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6"))) / (exp(greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6") + exp(-(greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6")))) AS "State_3", greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4" AS "State_4", greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5" AS "State_5", greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * ((exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") - exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3"))) / (exp(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + exp(-(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3")))) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6" AS "State_6" 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1."KEY" AS "KEY", CAST(rnn_cte_lstm_1."State_1" AS FLOAT) AS output_1, CAST(rnn_cte_lstm_1."State_2" AS FLOAT) AS output_2, CAST(rnn_cte_lstm_1."State_3" AS FLOAT) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1."KEY" AS "KEY", lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1."KEY" AS "KEY", -0.051152154396682095 + -0.5182396232281188 * lstm_1_1.output_1 + -0.2008461043012133 * lstm_1_1.output_2 + 0.5286108108063203 * lstm_1_1.output_3 AS output_1, -0.0007802743954776191 + 0.9386855134594749 * lstm_1_1.output_1 + -0.4546380219915114 * lstm_1_1.output_2 + -0.27474160630476874 * lstm_1_1.output_3 AS output_2, 0.04270282781462942 + -0.4551124262717887 * lstm_1_1.output_1 + 0.34144295018040927 * lstm_1_1.output_2 + 0.8839938302622135 * lstm_1_1.output_3 AS output_3 
FROM lstm_1_1), 
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
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1."KEY" AS "KEY", score_soft_max_step1."Score_0" AS "Score_0", score_soft_max_step1."exp_Score_0" AS "exp_Score_0", score_soft_max_step1."Score_1" AS "Score_1", score_soft_max_step1."exp_Score_1" AS "exp_Score_1", score_soft_max_step1."Score_2" AS "Score_2", score_soft_max_step1."exp_Score_2" AS "exp_Score_2", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpScore" AS "sum_ExpScore" 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_Score") AS "sum_ExpScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_step1."KEY" = sum_exp_t."KEY_sum"), 
layer_softmax AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."exp_Score_0" / score_soft_max."sum_ExpScore" AS output_1, score_soft_max."exp_Score_1" / score_soft_max."sum_ExpScore" AS output_2, score_soft_max."exp_Score_2" / score_soft_max."sum_ExpScore" AS output_3 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_1789-07-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Score_1789-08-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Score_1789-09-14T00:00:00.000000000", layer_softmax.output_1 AS "Proba_1789-07-14T00:00:00.000000000", layer_softmax.output_2 AS "Proba_1789-08-14T00:00:00.000000000", layer_softmax.output_3 AS "Proba_1789-09-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "LogProba_1789-07-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "LogProba_1789-08-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "LogProba_1789-09-14T00:00:00.000000000", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", '1789-07-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-08-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-09-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", arg_max_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", arg_max_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", arg_max_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", arg_max_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", arg_max_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-07-14T00:00:00.000000000" IS NULL OR arg_max_cte."Proba_1789-07-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."Proba_1789-07-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-08-14T00:00:00.000000000" IS NULL OR arg_max_cte."Proba_1789-08-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."Proba_1789-08-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-09-14T00:00:00.000000000" IS NULL OR arg_max_cte."Proba_1789-09-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."Proba_1789-09-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte