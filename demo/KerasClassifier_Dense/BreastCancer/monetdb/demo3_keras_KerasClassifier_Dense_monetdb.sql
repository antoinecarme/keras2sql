-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_Dense
-- Dataset : BreastCancer
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9", "ADS"."Feature_10" AS "Feature_10", "ADS"."Feature_11" AS "Feature_11", "ADS"."Feature_12" AS "Feature_12", "ADS"."Feature_13" AS "Feature_13", "ADS"."Feature_14" AS "Feature_14", "ADS"."Feature_15" AS "Feature_15", "ADS"."Feature_16" AS "Feature_16", "ADS"."Feature_17" AS "Feature_17", "ADS"."Feature_18" AS "Feature_18", "ADS"."Feature_19" AS "Feature_19", "ADS"."Feature_20" AS "Feature_20", "ADS"."Feature_21" AS "Feature_21", "ADS"."Feature_22" AS "Feature_22", "ADS"."Feature_23" AS "Feature_23", "ADS"."Feature_24" AS "Feature_24", "ADS"."Feature_25" AS "Feature_25", "ADS"."Feature_26" AS "Feature_26", "ADS"."Feature_27" AS "Feature_27", "ADS"."Feature_28" AS "Feature_28", "ADS"."Feature_29" AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9", keras_input."Feature_10" AS "Feature_10", keras_input."Feature_11" AS "Feature_11", keras_input."Feature_12" AS "Feature_12", keras_input."Feature_13" AS "Feature_13", keras_input."Feature_14" AS "Feature_14", keras_input."Feature_15" AS "Feature_15", keras_input."Feature_16" AS "Feature_16", keras_input."Feature_17" AS "Feature_17", keras_input."Feature_18" AS "Feature_18", keras_input."Feature_19" AS "Feature_19", keras_input."Feature_20" AS "Feature_20", keras_input."Feature_21" AS "Feature_21", keras_input."Feature_22" AS "Feature_22", keras_input."Feature_23" AS "Feature_23", keras_input."Feature_24" AS "Feature_24", keras_input."Feature_25" AS "Feature_25", keras_input."Feature_26" AS "Feature_26", keras_input."Feature_27" AS "Feature_27", keras_input."Feature_28" AS "Feature_28", keras_input."Feature_29" AS "Feature_29" 
FROM keras_input), 
layer_dense_1 AS 
(SELECT keras_input_1."KEY" AS "KEY", 0.0 + -0.0547230460581859 * keras_input_1."Feature_0" + -0.30513102205560794 * keras_input_1."Feature_1" + -0.3324356623703734 * keras_input_1."Feature_2" + 0.04395759675930094 * keras_input_1."Feature_3" + -0.19953036451083253 * keras_input_1."Feature_4" + -0.3591530254691348 * keras_input_1."Feature_5" + -0.03729005756633075 * keras_input_1."Feature_6" + -0.3788977774065563 * keras_input_1."Feature_7" + 0.18453270133752464 * keras_input_1."Feature_8" + -0.008818181387102553 * keras_input_1."Feature_9" + -0.3758023771829488 * keras_input_1."Feature_10" + -0.33101741421571973 * keras_input_1."Feature_11" + 0.41029022957564265 * keras_input_1."Feature_12" + -0.2483647440195161 * keras_input_1."Feature_13" + -0.03078505511941937 * keras_input_1."Feature_14" + -0.3079678590098344 * keras_input_1."Feature_15" + 0.3317942788558692 * keras_input_1."Feature_16" + 0.18981685076996524 * keras_input_1."Feature_17" + -0.18358987055953738 * keras_input_1."Feature_18" + -0.17772066681438645 * keras_input_1."Feature_19" + -0.18588567212650334 * keras_input_1."Feature_20" + 0.33231927132134276 * keras_input_1."Feature_21" + -0.11923708759582713 * keras_input_1."Feature_22" + -0.22149656011238125 * keras_input_1."Feature_23" + 0.115133309932832 * keras_input_1."Feature_24" + -0.1784726089091596 * keras_input_1."Feature_25" + 0.2356213226289431 * keras_input_1."Feature_26" + -3.490209556566981e-05 * keras_input_1."Feature_27" + 0.0516038440771972 * keras_input_1."Feature_28" + 0.17249011563811567 * keras_input_1."Feature_29" AS output_1, 0.4850209376242174 + 0.5064306587389629 * keras_input_1."Feature_0" + 0.43405409318601534 * keras_input_1."Feature_1" + 0.2387159779876074 * keras_input_1."Feature_2" + 0.2952691743266556 * keras_input_1."Feature_3" + 0.47522532074580437 * keras_input_1."Feature_4" + -0.30180237521604425 * keras_input_1."Feature_5" + -0.26427591063646666 * keras_input_1."Feature_6" + -0.08268789650731494 * keras_input_1."Feature_7" + 0.18152256638963762 * keras_input_1."Feature_8" + 0.41383723924751475 * keras_input_1."Feature_9" + 0.23239286551150196 * keras_input_1."Feature_10" + 0.34786034847380926 * keras_input_1."Feature_11" + 0.006094980899836491 * keras_input_1."Feature_12" + -0.14345967072913038 * keras_input_1."Feature_13" + 0.5130309702279205 * keras_input_1."Feature_14" + 0.28524422705413754 * keras_input_1."Feature_15" + 0.09589597013504668 * keras_input_1."Feature_16" + 0.23700858711754022 * keras_input_1."Feature_17" + 0.5038847177004389 * keras_input_1."Feature_18" + -0.22621907031653812 * keras_input_1."Feature_19" + 0.3580723144335158 * keras_input_1."Feature_20" + 0.1176385445673054 * keras_input_1."Feature_21" + 0.34204789615369335 * keras_input_1."Feature_22" + -0.32786413792329405 * keras_input_1."Feature_23" + 0.4339013435088863 * keras_input_1."Feature_24" + -0.22206168961178893 * keras_input_1."Feature_25" + -0.36509876733175256 * keras_input_1."Feature_26" + 0.15284277787982342 * keras_input_1."Feature_27" + 0.3137232250005807 * keras_input_1."Feature_28" + 0.306512164494172 * keras_input_1."Feature_29" AS output_2, 0.0 + -0.2598781647612305 * keras_input_1."Feature_0" + 0.20930995353930526 * keras_input_1."Feature_1" + -0.3851440481590603 * keras_input_1."Feature_2" + -0.4079855813713974 * keras_input_1."Feature_3" + 0.10496478288324662 * keras_input_1."Feature_4" + 0.13520853967220026 * keras_input_1."Feature_5" + -0.30712852861008627 * keras_input_1."Feature_6" + 0.029370738785410466 * keras_input_1."Feature_7" + -0.08058780138725385 * keras_input_1."Feature_8" + 0.008385735744042944 * keras_input_1."Feature_9" + 0.3923033070292833 * keras_input_1."Feature_10" + -0.3992985740429115 * keras_input_1."Feature_11" + 0.1437620319441133 * keras_input_1."Feature_12" + -0.046501677444798994 * keras_input_1."Feature_13" + -0.14310007504846062 * keras_input_1."Feature_14" + 0.2652040653736094 * keras_input_1."Feature_15" + 0.024485330748855283 * keras_input_1."Feature_16" + -0.29046353725582635 * keras_input_1."Feature_17" + 0.1490579493919616 * keras_input_1."Feature_18" + -0.20433933462041157 * keras_input_1."Feature_19" + 0.34864309877377797 * keras_input_1."Feature_20" + -0.40424137310570596 * keras_input_1."Feature_21" + -0.06090485267170315 * keras_input_1."Feature_22" + -0.3614329826551726 * keras_input_1."Feature_23" + -0.37164096507757405 * keras_input_1."Feature_24" + -0.0770983515322069 * keras_input_1."Feature_25" + -0.026765379802801748 * keras_input_1."Feature_26" + -0.04861882230044251 * keras_input_1."Feature_27" + 0.41886566332167785 * keras_input_1."Feature_28" + 0.22607887321277875 * keras_input_1."Feature_29" AS output_3, -0.21274852960321602 + -0.25268404669041145 * keras_input_1."Feature_0" + -0.13539586134317738 * keras_input_1."Feature_1" + -0.22345047050677552 * keras_input_1."Feature_2" + -0.1268817314437161 * keras_input_1."Feature_3" + 0.35656934368068005 * keras_input_1."Feature_4" + 0.17451705574456614 * keras_input_1."Feature_5" + 1.0038463123350772 * keras_input_1."Feature_6" + 0.8933225707423548 * keras_input_1."Feature_7" + -0.02377254548861011 * keras_input_1."Feature_8" + -0.35915055401400237 * keras_input_1."Feature_9" + -0.10309542364024384 * keras_input_1."Feature_10" + 0.42517555336216745 * keras_input_1."Feature_11" + 0.10719100638894369 * keras_input_1."Feature_12" + 0.20510949243639615 * keras_input_1."Feature_13" + 0.2022825072077886 * keras_input_1."Feature_14" + 0.47028212264047775 * keras_input_1."Feature_15" + 0.6810255178155821 * keras_input_1."Feature_16" + -0.20257941559359197 * keras_input_1."Feature_17" + 0.4800942186405304 * keras_input_1."Feature_18" + 0.5310566449834383 * keras_input_1."Feature_19" + -0.5098625876183485 * keras_input_1."Feature_20" + 0.2204907328354823 * keras_input_1."Feature_21" + -0.426265383309865 * keras_input_1."Feature_22" + 0.18477674385163126 * keras_input_1."Feature_23" + -0.10412477007663892 * keras_input_1."Feature_24" + 0.3899872871632272 * keras_input_1."Feature_25" + 0.651206665945009 * keras_input_1."Feature_26" + 0.7043153594371254 * keras_input_1."Feature_27" + -0.16328515933930624 * keras_input_1."Feature_28" + -0.409215183750522 * keras_input_1."Feature_29" AS output_4 
FROM keras_input_1), 
activation_relu AS 
(SELECT layer_dense_1."KEY" AS "KEY", CASE WHEN (layer_dense_1.output_1 <= 0) THEN 0 ELSE layer_dense_1.output_1 END AS output_1, CASE WHEN (layer_dense_1.output_2 <= 0) THEN 0 ELSE layer_dense_1.output_2 END AS output_2, CASE WHEN (layer_dense_1.output_3 <= 0) THEN 0 ELSE layer_dense_1.output_3 END AS output_3, CASE WHEN (layer_dense_1.output_4 <= 0) THEN 0 ELSE layer_dense_1.output_4 END AS output_4 
FROM layer_dense_1), 
activation_relu_1 AS 
(SELECT activation_relu."KEY" AS "KEY", activation_relu.output_1 AS output_1, activation_relu.output_2 AS output_2, activation_relu.output_3 AS output_3, activation_relu.output_4 AS output_4 
FROM activation_relu), 
activation_relu_1_1 AS 
(SELECT activation_relu_1."KEY" AS "KEY", activation_relu_1.output_1 AS output_1, activation_relu_1.output_2 AS output_2, activation_relu_1.output_3 AS output_3, activation_relu_1.output_4 AS output_4 
FROM activation_relu_1), 
layer_dense_2 AS 
(SELECT activation_relu_1_1."KEY" AS "KEY", -0.4229099352676133 + 0.6810246141391381 * activation_relu_1_1.output_1 + -0.6175017885367786 * activation_relu_1_1.output_2 + -0.361540348881519 * activation_relu_1_1.output_3 + 0.6897943122729806 * activation_relu_1_1.output_4 AS output_1, 0.4229099352676134 + -0.8172269217113834 * activation_relu_1_1.output_1 + -0.5521296719351658 * activation_relu_1_1.output_2 + 0.915890454932454 * activation_relu_1_1.output_3 + 0.5877490832539658 * activation_relu_1_1.output_4 AS output_2 
FROM activation_relu_1_1), 
layer_dense_2_1 AS 
(SELECT layer_dense_2."KEY" AS "KEY", layer_dense_2.output_1 AS output_1, layer_dense_2.output_2 AS output_2 
FROM layer_dense_2), 
score_soft_max_step1 AS 
(SELECT layer_dense_2_1."KEY" AS "KEY", layer_dense_2_1.output_1 AS "Score_0", exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= layer_dense_2_1.output_1) THEN layer_dense_2_1.output_1 ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= layer_dense_2_1.output_1) THEN layer_dense_2_1.output_1 ELSE -100.0 END END) AS "exp_Score_0", layer_dense_2_1.output_2 AS "Score_1", exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= layer_dense_2_1.output_2) THEN layer_dense_2_1.output_2 ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= layer_dense_2_1.output_2) THEN layer_dense_2_1.output_2 ELSE -100.0 END END) AS "exp_Score_1" 
FROM layer_dense_2_1), 
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
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", layer_softmax.output_1 AS "Proba_0", layer_softmax.output_2 AS "Proba_1", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
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
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", log(CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 1e-100) THEN arg_max_cte."Proba_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 1e-100) THEN arg_max_cte."Proba_1" ELSE 1e-100 END) AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte