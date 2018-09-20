-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_LSTM
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
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", keras_input_1_rn."Feature_4" AS "Feature_4", keras_input_1_rn."Feature_5" AS "Feature_5", keras_input_1_rn."Feature_6" AS "Feature_6", keras_input_1_rn."Feature_7" AS "Feature_7", keras_input_1_rn."Feature_8" AS "Feature_8", keras_input_1_rn."Feature_9" AS "Feature_9", 0.5569960531847676 + 0.4857726867768036 * keras_input_1_rn."Feature_0" + 0.4967621279959176 * keras_input_1_rn."Feature_1" + -0.19176711412616934 * keras_input_1_rn."Feature_2" + -0.16574306598996916 * keras_input_1_rn."Feature_3" + -0.3246673004103576 * keras_input_1_rn."Feature_4" + 0.19398976780255597 * keras_input_1_rn."Feature_5" + 0.07252701290921255 * keras_input_1_rn."Feature_6" + -0.044335596708850275 * keras_input_1_rn."Feature_7" + -0.13919010534848736 * keras_input_1_rn."Feature_8" + 0.16723742763100657 * keras_input_1_rn."Feature_9" AS dot_prod_i_1, 0.19385050296847178 + -0.43636426219183105 * keras_input_1_rn."Feature_0" + -0.08545798316074675 * keras_input_1_rn."Feature_1" + 0.05264032335868606 * keras_input_1_rn."Feature_2" + -0.14030696841059243 * keras_input_1_rn."Feature_3" + 0.3575714616058074 * keras_input_1_rn."Feature_4" + -0.2093244718593399 * keras_input_1_rn."Feature_5" + 0.007313788779698687 * keras_input_1_rn."Feature_6" + -0.07045699340367499 * keras_input_1_rn."Feature_7" + -0.508443334528228 * keras_input_1_rn."Feature_8" + -0.021775289195083203 * keras_input_1_rn."Feature_9" AS dot_prod_i_2, 0.06775532618830721 + -0.2597578305811873 * keras_input_1_rn."Feature_0" + -0.1933513643302198 * keras_input_1_rn."Feature_1" + -0.26647330499320726 * keras_input_1_rn."Feature_2" + -0.6314760478440884 * keras_input_1_rn."Feature_3" + -0.48932420118274844 * keras_input_1_rn."Feature_4" + 0.37090528653938104 * keras_input_1_rn."Feature_5" + -0.02201700815747512 * keras_input_1_rn."Feature_6" + 0.004374350117898097 * keras_input_1_rn."Feature_7" + -0.3510109871839086 * keras_input_1_rn."Feature_8" + 0.3128227439828905 * keras_input_1_rn."Feature_9" AS dot_prod_i_3, 1.1325803588184287 + 0.4788096378140792 * keras_input_1_rn."Feature_0" + 0.48122087573648625 * keras_input_1_rn."Feature_1" + -0.0650215298118948 * keras_input_1_rn."Feature_2" + 0.1769856474116955 * keras_input_1_rn."Feature_3" + 0.18934646927614215 * keras_input_1_rn."Feature_4" + 0.363028951407033 * keras_input_1_rn."Feature_5" + -0.13676744081836611 * keras_input_1_rn."Feature_6" + 0.35970731813969836 * keras_input_1_rn."Feature_7" + 0.3351349126254813 * keras_input_1_rn."Feature_8" + 0.059058259880388854 * keras_input_1_rn."Feature_9" AS dot_prod_f_1, 1.2911217672553008 + 0.3699058165801305 * keras_input_1_rn."Feature_0" + 0.44317188254704803 * keras_input_1_rn."Feature_1" + 0.2610987566631189 * keras_input_1_rn."Feature_2" + -0.03004707388676798 * keras_input_1_rn."Feature_3" + -0.1995445187779936 * keras_input_1_rn."Feature_4" + 0.4291595165183779 * keras_input_1_rn."Feature_5" + 0.11202004926359187 * keras_input_1_rn."Feature_6" + -0.38638024971728196 * keras_input_1_rn."Feature_7" + -0.5138873581288104 * keras_input_1_rn."Feature_8" + -0.026939547465222445 * keras_input_1_rn."Feature_9" AS dot_prod_f_2, 1.0635380900422333 + 0.053210101022403894 * keras_input_1_rn."Feature_0" + -0.3601761701570812 * keras_input_1_rn."Feature_1" + -0.08937770670614523 * keras_input_1_rn."Feature_2" + 0.27978330440623234 * keras_input_1_rn."Feature_3" + -0.27068492776370784 * keras_input_1_rn."Feature_4" + 0.17904965975593257 * keras_input_1_rn."Feature_5" + 0.3706078859296537 * keras_input_1_rn."Feature_6" + -0.022839080726736585 * keras_input_1_rn."Feature_7" + -0.03964449424742704 * keras_input_1_rn."Feature_8" + -0.18222113585873878 * keras_input_1_rn."Feature_9" AS dot_prod_f_3, -0.6081762275199817 + 0.009227513493046551 * keras_input_1_rn."Feature_0" + 0.19857671231979218 * keras_input_1_rn."Feature_1" + -0.018028247226955885 * keras_input_1_rn."Feature_2" + -0.46575108108212426 * keras_input_1_rn."Feature_3" + -0.14490639148530823 * keras_input_1_rn."Feature_4" + 0.15592456694487206 * keras_input_1_rn."Feature_5" + 0.34478528308121265 * keras_input_1_rn."Feature_6" + -0.616062395096785 * keras_input_1_rn."Feature_7" + -0.33693206919524854 * keras_input_1_rn."Feature_8" + -0.008045323356178694 * keras_input_1_rn."Feature_9" AS dot_prod_c_1, 0.45759997682868536 + -0.22207926373321796 * keras_input_1_rn."Feature_0" + -0.4724267255581466 * keras_input_1_rn."Feature_1" + 0.11491646776832777 * keras_input_1_rn."Feature_2" + -0.24902500941238437 * keras_input_1_rn."Feature_3" + -0.019173127244252318 * keras_input_1_rn."Feature_4" + 0.49830992475055425 * keras_input_1_rn."Feature_5" + 0.08517391587213974 * keras_input_1_rn."Feature_6" + -0.3106102528181652 * keras_input_1_rn."Feature_7" + -0.20702057259464252 * keras_input_1_rn."Feature_8" + -0.301839040444159 * keras_input_1_rn."Feature_9" AS dot_prod_c_2, -0.08173109556372884 + -0.25485128143017777 * keras_input_1_rn."Feature_0" + -0.4342053803919376 * keras_input_1_rn."Feature_1" + 0.2575727289746642 * keras_input_1_rn."Feature_2" + 0.37916568916248683 * keras_input_1_rn."Feature_3" + 0.45568185282230567 * keras_input_1_rn."Feature_4" + -0.3309148346844901 * keras_input_1_rn."Feature_5" + 0.14824521597093318 * keras_input_1_rn."Feature_6" + 0.14228551455680896 * keras_input_1_rn."Feature_7" + -0.013425043019360395 * keras_input_1_rn."Feature_8" + 0.3824796094230218 * keras_input_1_rn."Feature_9" AS dot_prod_c_3, 0.11721118539552174 + -0.009182021770659925 * keras_input_1_rn."Feature_0" + -0.4356556550513752 * keras_input_1_rn."Feature_1" + 0.05582573799023851 * keras_input_1_rn."Feature_2" + -0.06368281052800212 * keras_input_1_rn."Feature_3" + -0.30172415322859436 * keras_input_1_rn."Feature_4" + 0.382936556464099 * keras_input_1_rn."Feature_5" + -0.4218488158199851 * keras_input_1_rn."Feature_6" + 0.5364062117339565 * keras_input_1_rn."Feature_7" + 0.12772789643041219 * keras_input_1_rn."Feature_8" + -0.36236145968674366 * keras_input_1_rn."Feature_9" AS dot_prod_o_1, 0.2721771233903459 + 0.05307657977302915 * keras_input_1_rn."Feature_0" + -0.4155939354424495 * keras_input_1_rn."Feature_1" + -0.43044258333484053 * keras_input_1_rn."Feature_2" + -0.34316446380821275 * keras_input_1_rn."Feature_3" + -0.2366554871878829 * keras_input_1_rn."Feature_4" + -0.4091352848639538 * keras_input_1_rn."Feature_5" + -0.33318612751422017 * keras_input_1_rn."Feature_6" + 0.015825679450947948 * keras_input_1_rn."Feature_7" + 0.47917503101644315 * keras_input_1_rn."Feature_8" + 0.04353277493330563 * keras_input_1_rn."Feature_9" AS dot_prod_o_2, 0.06087717874661547 + 0.08772001759090621 * keras_input_1_rn."Feature_0" + 0.29584964409467174 * keras_input_1_rn."Feature_1" + -0.3774506793125521 * keras_input_1_rn."Feature_2" + -0.10971310585129052 * keras_input_1_rn."Feature_3" + 0.47053796875585147 * keras_input_1_rn."Feature_4" + 0.4433915957865046 * keras_input_1_rn."Feature_5" + -0.4413133302865697 * keras_input_1_rn."Feature_6" + -0.20850177013272966 * keras_input_1_rn."Feature_7" + -0.1616797547567129 * keras_input_1_rn."Feature_8" + 0.37499007681014307 * keras_input_1_rn."Feature_9" AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", "PreviousState_3", "PreviousState_4", "PreviousState_5", "PreviousState_6", "State_1", "State_2", "State_3", "State_4", "State_5", "State_6") AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS FLOAT) AS "PreviousState_1", CAST(0.0 AS FLOAT) AS "PreviousState_2", CAST(0.0 AS FLOAT) AS "PreviousState_3", CAST(0.0 AS FLOAT) AS "PreviousState_4", CAST(0.0 AS FLOAT) AS "PreviousState_5", CAST(0.0 AS FLOAT) AS "PreviousState_6", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5)) * 0.0) AS "State_1", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5)) * 0.0) AS "State_2", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + 0.0) + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5)) * 0.0) AS "State_3", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + 0.0) + 0.5)) * 0.0 AS "State_4", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + 0.0) + 0.5)) * 0.0 AS "State_5", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + 0.0) + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + 0.0) + 0.5)) * 0.0 AS "State_6" 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias."KEY" AS "KEY", rnn_cte_lstm_1."State_1" AS "PreviousState_1", rnn_cte_lstm_1."State_2" AS "PreviousState_2", rnn_cte_lstm_1."State_3" AS "PreviousState_3", rnn_cte_lstm_1."State_4" AS "PreviousState_4", rnn_cte_lstm_1."State_5" AS "PreviousState_5", rnn_cte_lstm_1."State_6" AS "PreviousState_6", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_1 + -0.08425964772032445 * rnn_cte_lstm_1."State_1" + 0.39482886510348647 * rnn_cte_lstm_1."State_2" + 0.32103700655199274 * rnn_cte_lstm_1."State_3") + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.6306560692930561 * rnn_cte_lstm_1."State_1" + 0.16991611826984163 * rnn_cte_lstm_1."State_2" + -0.4550106100479614 * rnn_cte_lstm_1."State_3") + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.03577805729863978 * rnn_cte_lstm_1."State_1" + -0.05437718408490483 * rnn_cte_lstm_1."State_2" + 0.578034549396689 * rnn_cte_lstm_1."State_3") + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.1896563413513523 * rnn_cte_lstm_1."State_1" + 0.41660077046064087 * rnn_cte_lstm_1."State_2" + -0.14632233889567145 * rnn_cte_lstm_1."State_3") + 0.5)) * rnn_cte_lstm_1."State_4") AS "State_1", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_2 + -0.2725029576936558 * rnn_cte_lstm_1."State_1" + 0.250891509038353 * rnn_cte_lstm_1."State_2" + 0.24372783251090105 * rnn_cte_lstm_1."State_3") + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.14457592841101358 * rnn_cte_lstm_1."State_1" + 0.3164703116306216 * rnn_cte_lstm_1."State_2" + 0.17520879838787384 * rnn_cte_lstm_1."State_3") + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.1920197649898378 * rnn_cte_lstm_1."State_1" + 0.5171011799922436 * rnn_cte_lstm_1."State_2" + 0.3116846215944685 * rnn_cte_lstm_1."State_3") + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.24588563006375747 * rnn_cte_lstm_1."State_1" + 0.5194917282895323 * rnn_cte_lstm_1."State_2" + 0.4922209052254207 * rnn_cte_lstm_1."State_3") + 0.5)) * rnn_cte_lstm_1."State_5") AS "State_2", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_o_3 + -0.4041029869109766 * rnn_cte_lstm_1."State_1" + -0.04350972200160068 * rnn_cte_lstm_1."State_2" + -0.9978711223383752 * rnn_cte_lstm_1."State_3") + 0.5)) * (greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.41244668205476614 * rnn_cte_lstm_1."State_1" + 0.27331521700600026 * rnn_cte_lstm_1."State_2" + -0.9497246338592538 * rnn_cte_lstm_1."State_3") + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.48750775312104183 * rnn_cte_lstm_1."State_1" + -0.19483846375997171 * rnn_cte_lstm_1."State_2" + -0.22879489087366925 * rnn_cte_lstm_1."State_3") + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + -0.25029120418689493 * rnn_cte_lstm_1."State_1" + 0.4920108359916619 * rnn_cte_lstm_1."State_2" + -0.9492270620333277 * rnn_cte_lstm_1."State_3") + 0.5)) * rnn_cte_lstm_1."State_6") AS "State_3", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_1 + 0.6306560692930561 * rnn_cte_lstm_1."State_1" + 0.16991611826984163 * rnn_cte_lstm_1."State_2" + -0.4550106100479614 * rnn_cte_lstm_1."State_3") + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_1 + 0.03577805729863978 * rnn_cte_lstm_1."State_1" + -0.05437718408490483 * rnn_cte_lstm_1."State_2" + 0.578034549396689 * rnn_cte_lstm_1."State_3") + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_1 + -0.1896563413513523 * rnn_cte_lstm_1."State_1" + 0.41660077046064087 * rnn_cte_lstm_1."State_2" + -0.14632233889567145 * rnn_cte_lstm_1."State_3") + 0.5)) * rnn_cte_lstm_1."State_4" AS "State_4", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_2 + -0.14457592841101358 * rnn_cte_lstm_1."State_1" + 0.3164703116306216 * rnn_cte_lstm_1."State_2" + 0.17520879838787384 * rnn_cte_lstm_1."State_3") + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_2 + 0.1920197649898378 * rnn_cte_lstm_1."State_1" + 0.5171011799922436 * rnn_cte_lstm_1."State_2" + 0.3116846215944685 * rnn_cte_lstm_1."State_3") + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_2 + -0.24588563006375747 * rnn_cte_lstm_1."State_1" + 0.5194917282895323 * rnn_cte_lstm_1."State_2" + 0.4922209052254207 * rnn_cte_lstm_1."State_3") + 0.5)) * rnn_cte_lstm_1."State_5" AS "State_5", greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_i_3 + -0.41244668205476614 * rnn_cte_lstm_1."State_1" + 0.27331521700600026 * rnn_cte_lstm_1."State_2" + -0.9497246338592538 * rnn_cte_lstm_1."State_3") + 0.5)) * (lstm_input_kernel_bias.dot_prod_c_3 + 0.48750775312104183 * rnn_cte_lstm_1."State_1" + -0.19483846375997171 * rnn_cte_lstm_1."State_2" + -0.22879489087366925 * rnn_cte_lstm_1."State_3") + greatest(0.0, least(1.0, 0.2 * (lstm_input_kernel_bias.dot_prod_f_3 + -0.25029120418689493 * rnn_cte_lstm_1."State_1" + 0.4920108359916619 * rnn_cte_lstm_1."State_2" + -0.9492270620333277 * rnn_cte_lstm_1."State_3") + 0.5)) * rnn_cte_lstm_1."State_6" AS "State_6" 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1."KEY" AS "KEY", CAST(rnn_cte_lstm_1."State_1" AS FLOAT) AS output_1, CAST(rnn_cte_lstm_1."State_2" AS FLOAT) AS output_2, CAST(rnn_cte_lstm_1."State_3" AS FLOAT) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1."KEY" AS "KEY", lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1."KEY" AS "KEY", 0.07696181702144218 + -0.33352446112111833 * lstm_1_1.output_1 + 0.1533856965490941 * lstm_1_1.output_2 + -0.12826903022702413 * lstm_1_1.output_3 AS output_1 
FROM lstm_1_1)
 SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS "Estimator" 
FROM layer_dense_1