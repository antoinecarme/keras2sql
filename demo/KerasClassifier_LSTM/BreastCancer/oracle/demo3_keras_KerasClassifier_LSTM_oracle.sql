-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_LSTM
-- Dataset : BreastCancer
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9", "ADS"."Feature_10" AS "Feature_10", "ADS"."Feature_11" AS "Feature_11", "ADS"."Feature_12" AS "Feature_12", "ADS"."Feature_13" AS "Feature_13", "ADS"."Feature_14" AS "Feature_14", "ADS"."Feature_15" AS "Feature_15", "ADS"."Feature_16" AS "Feature_16", "ADS"."Feature_17" AS "Feature_17", "ADS"."Feature_18" AS "Feature_18", "ADS"."Feature_19" AS "Feature_19", "ADS"."Feature_20" AS "Feature_20", "ADS"."Feature_21" AS "Feature_21", "ADS"."Feature_22" AS "Feature_22", "ADS"."Feature_23" AS "Feature_23", "ADS"."Feature_24" AS "Feature_24", "ADS"."Feature_25" AS "Feature_25", "ADS"."Feature_26" AS "Feature_26", "ADS"."Feature_27" AS "Feature_27", "ADS"."Feature_28" AS "Feature_28", "ADS"."Feature_29" AS "Feature_29" 
FROM "BREASTCANCER" "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9", keras_input."Feature_10" AS "Feature_10", keras_input."Feature_11" AS "Feature_11", keras_input."Feature_12" AS "Feature_12", keras_input."Feature_13" AS "Feature_13", keras_input."Feature_14" AS "Feature_14", keras_input."Feature_15" AS "Feature_15", keras_input."Feature_16" AS "Feature_16", keras_input."Feature_17" AS "Feature_17", keras_input."Feature_18" AS "Feature_18", keras_input."Feature_19" AS "Feature_19", keras_input."Feature_20" AS "Feature_20", keras_input."Feature_21" AS "Feature_21", keras_input."Feature_22" AS "Feature_22", keras_input."Feature_23" AS "Feature_23", keras_input."Feature_24" AS "Feature_24", keras_input."Feature_25" AS "Feature_25", keras_input."Feature_26" AS "Feature_26", keras_input."Feature_27" AS "Feature_27", keras_input."Feature_28" AS "Feature_28", keras_input."Feature_29" AS "Feature_29" 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1."KEY" ASC) AS rn, keras_input_1."KEY" AS "KEY", keras_input_1."Feature_0" AS "Feature_0", keras_input_1."Feature_1" AS "Feature_1", keras_input_1."Feature_2" AS "Feature_2", keras_input_1."Feature_3" AS "Feature_3", keras_input_1."Feature_4" AS "Feature_4", keras_input_1."Feature_5" AS "Feature_5", keras_input_1."Feature_6" AS "Feature_6", keras_input_1."Feature_7" AS "Feature_7", keras_input_1."Feature_8" AS "Feature_8", keras_input_1."Feature_9" AS "Feature_9", keras_input_1."Feature_10" AS "Feature_10", keras_input_1."Feature_11" AS "Feature_11", keras_input_1."Feature_12" AS "Feature_12", keras_input_1."Feature_13" AS "Feature_13", keras_input_1."Feature_14" AS "Feature_14", keras_input_1."Feature_15" AS "Feature_15", keras_input_1."Feature_16" AS "Feature_16", keras_input_1."Feature_17" AS "Feature_17", keras_input_1."Feature_18" AS "Feature_18", keras_input_1."Feature_19" AS "Feature_19", keras_input_1."Feature_20" AS "Feature_20", keras_input_1."Feature_21" AS "Feature_21", keras_input_1."Feature_22" AS "Feature_22", keras_input_1."Feature_23" AS "Feature_23", keras_input_1."Feature_24" AS "Feature_24", keras_input_1."Feature_25" AS "Feature_25", keras_input_1."Feature_26" AS "Feature_26", keras_input_1."Feature_27" AS "Feature_27", keras_input_1."Feature_28" AS "Feature_28", keras_input_1."Feature_29" AS "Feature_29" 
FROM keras_input_1), 
lstm_input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn."KEY" AS "KEY", keras_input_1_rn."Feature_0" AS "Feature_0", keras_input_1_rn."Feature_1" AS "Feature_1", keras_input_1_rn."Feature_2" AS "Feature_2", keras_input_1_rn."Feature_3" AS "Feature_3", keras_input_1_rn."Feature_4" AS "Feature_4", keras_input_1_rn."Feature_5" AS "Feature_5", keras_input_1_rn."Feature_6" AS "Feature_6", keras_input_1_rn."Feature_7" AS "Feature_7", keras_input_1_rn."Feature_8" AS "Feature_8", keras_input_1_rn."Feature_9" AS "Feature_9", keras_input_1_rn."Feature_10" AS "Feature_10", keras_input_1_rn."Feature_11" AS "Feature_11", keras_input_1_rn."Feature_12" AS "Feature_12", keras_input_1_rn."Feature_13" AS "Feature_13", keras_input_1_rn."Feature_14" AS "Feature_14", keras_input_1_rn."Feature_15" AS "Feature_15", keras_input_1_rn."Feature_16" AS "Feature_16", keras_input_1_rn."Feature_17" AS "Feature_17", keras_input_1_rn."Feature_18" AS "Feature_18", keras_input_1_rn."Feature_19" AS "Feature_19", keras_input_1_rn."Feature_20" AS "Feature_20", keras_input_1_rn."Feature_21" AS "Feature_21", keras_input_1_rn."Feature_22" AS "Feature_22", keras_input_1_rn."Feature_23" AS "Feature_23", keras_input_1_rn."Feature_24" AS "Feature_24", keras_input_1_rn."Feature_25" AS "Feature_25", keras_input_1_rn."Feature_26" AS "Feature_26", keras_input_1_rn."Feature_27" AS "Feature_27", keras_input_1_rn."Feature_28" AS "Feature_28", keras_input_1_rn."Feature_29" AS "Feature_29", 0.0 + -0.0492362623277115 * keras_input_1_rn."Feature_0" + 0.03955020637987583 * keras_input_1_rn."Feature_1" + -0.033551185264780736 * keras_input_1_rn."Feature_2" + -0.007934030053207808 * keras_input_1_rn."Feature_3" + 0.36915264827187877 * keras_input_1_rn."Feature_4" + -0.2770895881524792 * keras_input_1_rn."Feature_5" + -0.16518230761439526 * keras_input_1_rn."Feature_6" + 0.2989994161131677 * keras_input_1_rn."Feature_7" + 0.10358951591406623 * keras_input_1_rn."Feature_8" + -3.140265129303321e-05 * keras_input_1_rn."Feature_9" + 0.03137145023085841 * keras_input_1_rn."Feature_10" + 0.10623051068296718 * keras_input_1_rn."Feature_11" + 0.12611254729174637 * keras_input_1_rn."Feature_12" + 0.08385673573764224 * keras_input_1_rn."Feature_13" + -0.3379087080262065 * keras_input_1_rn."Feature_14" + -0.0490584013972572 * keras_input_1_rn."Feature_15" + 0.2419056488924014 * keras_input_1_rn."Feature_16" + 0.3439778056409136 * keras_input_1_rn."Feature_17" + -0.2781405017973735 * keras_input_1_rn."Feature_18" + -0.19224512314896097 * keras_input_1_rn."Feature_19" + -0.10313626493579514 * keras_input_1_rn."Feature_20" + -0.1344636600447577 * keras_input_1_rn."Feature_21" + -0.346554818313074 * keras_input_1_rn."Feature_22" + 0.29404407567546686 * keras_input_1_rn."Feature_23" + 0.27780519991869446 * keras_input_1_rn."Feature_24" + 0.24737568586558178 * keras_input_1_rn."Feature_25" + -0.04770175819738537 * keras_input_1_rn."Feature_26" + -0.2779335437950915 * keras_input_1_rn."Feature_27" + 0.22758999922089995 * keras_input_1_rn."Feature_28" + -0.03310831547624804 * keras_input_1_rn."Feature_29" AS dot_prod_i_1, 0.0 + 0.27641244717320956 * keras_input_1_rn."Feature_0" + 0.2998095941653166 * keras_input_1_rn."Feature_1" + 0.13440233493574394 * keras_input_1_rn."Feature_2" + -0.032950678189013705 * keras_input_1_rn."Feature_3" + 0.05118947096786869 * keras_input_1_rn."Feature_4" + 0.30961882105054617 * keras_input_1_rn."Feature_5" + 0.17320102858531694 * keras_input_1_rn."Feature_6" + -0.15288794318002233 * keras_input_1_rn."Feature_7" + 0.04817917938957833 * keras_input_1_rn."Feature_8" + 0.3299642633404428 * keras_input_1_rn."Feature_9" + -0.3204679062071203 * keras_input_1_rn."Feature_10" + 0.3421339867541857 * keras_input_1_rn."Feature_11" + -0.331191619962235 * keras_input_1_rn."Feature_12" + 0.13904019291233383 * keras_input_1_rn."Feature_13" + 0.07292265303011347 * keras_input_1_rn."Feature_14" + 0.05436795430830593 * keras_input_1_rn."Feature_15" + 0.3123463328657746 * keras_input_1_rn."Feature_16" + -0.20243451853534403 * keras_input_1_rn."Feature_17" + -0.10107303529182088 * keras_input_1_rn."Feature_18" + 0.15865901580303066 * keras_input_1_rn."Feature_19" + -0.14552280304516324 * keras_input_1_rn."Feature_20" + -0.2761500222567304 * keras_input_1_rn."Feature_21" + -0.14382542886523655 * keras_input_1_rn."Feature_22" + -0.04481070491346073 * keras_input_1_rn."Feature_23" + -0.21268923667758846 * keras_input_1_rn."Feature_24" + 0.03200798519916426 * keras_input_1_rn."Feature_25" + 0.26859882491869747 * keras_input_1_rn."Feature_26" + 0.2800799798769843 * keras_input_1_rn."Feature_27" + 0.11559942952238833 * keras_input_1_rn."Feature_28" + -0.2396693532171809 * keras_input_1_rn."Feature_29" AS dot_prod_i_2, 0.0 + -0.23382158734042433 * keras_input_1_rn."Feature_0" + -0.3670790746729849 * keras_input_1_rn."Feature_1" + -0.2763344128704292 * keras_input_1_rn."Feature_2" + 0.007544943394882597 * keras_input_1_rn."Feature_3" + 0.12934779087478032 * keras_input_1_rn."Feature_4" + 0.23861348871600907 * keras_input_1_rn."Feature_5" + 0.13411271533550784 * keras_input_1_rn."Feature_6" + -0.3637102779107733 * keras_input_1_rn."Feature_7" + -0.33437853639995097 * keras_input_1_rn."Feature_8" + -0.04374407605716413 * keras_input_1_rn."Feature_9" + 0.018901995228410906 * keras_input_1_rn."Feature_10" + -0.14158922780774602 * keras_input_1_rn."Feature_11" + 0.1617295140720909 * keras_input_1_rn."Feature_12" + -0.012722215397468817 * keras_input_1_rn."Feature_13" + 0.18065260912051428 * keras_input_1_rn."Feature_14" + 0.30064081589057856 * keras_input_1_rn."Feature_15" + 0.3530748670612557 * keras_input_1_rn."Feature_16" + 0.08973152505298865 * keras_input_1_rn."Feature_17" + -0.004747590837882398 * keras_input_1_rn."Feature_18" + 0.22076582551952229 * keras_input_1_rn."Feature_19" + -0.18087119170965785 * keras_input_1_rn."Feature_20" + 0.21129200900777423 * keras_input_1_rn."Feature_21" + 0.33957771979539775 * keras_input_1_rn."Feature_22" + -0.17782378402245463 * keras_input_1_rn."Feature_23" + 0.24450819710983251 * keras_input_1_rn."Feature_24" + 0.3027432771435635 * keras_input_1_rn."Feature_25" + 0.08400207008540539 * keras_input_1_rn."Feature_26" + 0.10331286690893726 * keras_input_1_rn."Feature_27" + 0.05405339975154605 * keras_input_1_rn."Feature_28" + 0.16340659910465816 * keras_input_1_rn."Feature_29" AS dot_prod_i_3, 1.0 + -0.1409163283867101 * keras_input_1_rn."Feature_0" + -0.13616970723019042 * keras_input_1_rn."Feature_1" + 0.3717199444256729 * keras_input_1_rn."Feature_2" + -0.20942637216966772 * keras_input_1_rn."Feature_3" + 0.0320860832167541 * keras_input_1_rn."Feature_4" + 0.20411080248428326 * keras_input_1_rn."Feature_5" + 0.3749431760423203 * keras_input_1_rn."Feature_6" + 0.256589608127604 * keras_input_1_rn."Feature_7" + -0.06408461320750658 * keras_input_1_rn."Feature_8" + 0.3424432199229619 * keras_input_1_rn."Feature_9" + -0.3505483489609699 * keras_input_1_rn."Feature_10" + -0.057977281450716234 * keras_input_1_rn."Feature_11" + -0.05896607143180699 * keras_input_1_rn."Feature_12" + 0.29172006793155614 * keras_input_1_rn."Feature_13" + 0.11981712879983536 * keras_input_1_rn."Feature_14" + 0.02035779055515563 * keras_input_1_rn."Feature_15" + 0.2313161851880342 * keras_input_1_rn."Feature_16" + 0.10550747107758957 * keras_input_1_rn."Feature_17" + 0.33307465619291443 * keras_input_1_rn."Feature_18" + -0.34687870138674126 * keras_input_1_rn."Feature_19" + -0.24732107943745268 * keras_input_1_rn."Feature_20" + -0.11594269007777713 * keras_input_1_rn."Feature_21" + 0.2793069232967773 * keras_input_1_rn."Feature_22" + 0.013113124924695851 * keras_input_1_rn."Feature_23" + 0.16791859379136476 * keras_input_1_rn."Feature_24" + 0.08108331502871158 * keras_input_1_rn."Feature_25" + -0.3668322524962725 * keras_input_1_rn."Feature_26" + -0.05043679648597027 * keras_input_1_rn."Feature_27" + 0.295693318516821 * keras_input_1_rn."Feature_28" + -0.2202698549484995 * keras_input_1_rn."Feature_29" AS dot_prod_f_1, 1.0 + -0.2745371854899752 * keras_input_1_rn."Feature_0" + -0.17952453448869518 * keras_input_1_rn."Feature_1" + -0.3409077474221743 * keras_input_1_rn."Feature_2" + -0.33812270623026497 * keras_input_1_rn."Feature_3" + -0.2234625549991761 * keras_input_1_rn."Feature_4" + 0.29852706180155564 * keras_input_1_rn."Feature_5" + -0.15990157717143388 * keras_input_1_rn."Feature_6" + -0.1072818299956872 * keras_input_1_rn."Feature_7" + -0.16057812610100436 * keras_input_1_rn."Feature_8" + 0.046429805851846084 * keras_input_1_rn."Feature_9" + 0.12064699007989005 * keras_input_1_rn."Feature_10" + 0.20505371229778901 * keras_input_1_rn."Feature_11" + 0.36353631363487404 * keras_input_1_rn."Feature_12" + 0.1371272817438398 * keras_input_1_rn."Feature_13" + 0.17940179309871473 * keras_input_1_rn."Feature_14" + 0.14823345247943598 * keras_input_1_rn."Feature_15" + 0.18966537336922118 * keras_input_1_rn."Feature_16" + -0.28826621651751483 * keras_input_1_rn."Feature_17" + 0.23698703516385589 * keras_input_1_rn."Feature_18" + -0.06514252193311576 * keras_input_1_rn."Feature_19" + 0.027932091054943375 * keras_input_1_rn."Feature_20" + 0.27503650058958296 * keras_input_1_rn."Feature_21" + 0.10821217657965532 * keras_input_1_rn."Feature_22" + -0.1563664449733158 * keras_input_1_rn."Feature_23" + 0.2602923199002287 * keras_input_1_rn."Feature_24" + 0.20025400518662295 * keras_input_1_rn."Feature_25" + -0.31596619177583063 * keras_input_1_rn."Feature_26" + 0.09395479506943738 * keras_input_1_rn."Feature_27" + -0.21362701372459325 * keras_input_1_rn."Feature_28" + 0.2745908554538694 * keras_input_1_rn."Feature_29" AS dot_prod_f_2, 1.0 + 0.16274428613072356 * keras_input_1_rn."Feature_0" + 0.09742297772720743 * keras_input_1_rn."Feature_1" + 0.27797637207408776 * keras_input_1_rn."Feature_2" + 0.15982447271147526 * keras_input_1_rn."Feature_3" + -0.027561027791632553 * keras_input_1_rn."Feature_4" + 0.1821655559480193 * keras_input_1_rn."Feature_5" + -0.3552994593926998 * keras_input_1_rn."Feature_6" + 0.15658992160227037 * keras_input_1_rn."Feature_7" + -0.09166314412432697 * keras_input_1_rn."Feature_8" + -0.07667096289269587 * keras_input_1_rn."Feature_9" + 0.014736398378641824 * keras_input_1_rn."Feature_10" + 0.2351291511743029 * keras_input_1_rn."Feature_11" + -0.23474524650483644 * keras_input_1_rn."Feature_12" + 0.0064130141765996185 * keras_input_1_rn."Feature_13" + 0.06000576187711437 * keras_input_1_rn."Feature_14" + 0.13633142322869385 * keras_input_1_rn."Feature_15" + 0.2602570443328851 * keras_input_1_rn."Feature_16" + 0.05606556596828355 * keras_input_1_rn."Feature_17" + -0.323751074683277 * keras_input_1_rn."Feature_18" + -0.3238174952344027 * keras_input_1_rn."Feature_19" + 0.27029160259844975 * keras_input_1_rn."Feature_20" + 0.3373384833955019 * keras_input_1_rn."Feature_21" + -0.0016249477648050958 * keras_input_1_rn."Feature_22" + -0.2685261922891103 * keras_input_1_rn."Feature_23" + -0.2013882802339612 * keras_input_1_rn."Feature_24" + 0.01324192324662804 * keras_input_1_rn."Feature_25" + 0.025970196749532826 * keras_input_1_rn."Feature_26" + 0.16218952575794177 * keras_input_1_rn."Feature_27" + 0.36361642938303995 * keras_input_1_rn."Feature_28" + 0.0587160129394137 * keras_input_1_rn."Feature_29" AS dot_prod_f_3, 0.0 + 0.18832357704109826 * keras_input_1_rn."Feature_0" + 0.09444053205144509 * keras_input_1_rn."Feature_1" + 0.026425893727837213 * keras_input_1_rn."Feature_2" + 0.352969177124839 * keras_input_1_rn."Feature_3" + -0.04183920586065876 * keras_input_1_rn."Feature_4" + 0.022030319120934283 * keras_input_1_rn."Feature_5" + -0.18385133518596627 * keras_input_1_rn."Feature_6" + -0.05479825264087296 * keras_input_1_rn."Feature_7" + -0.06936811699110484 * keras_input_1_rn."Feature_8" + 0.3768682696765199 * keras_input_1_rn."Feature_9" + -0.2953749852394521 * keras_input_1_rn."Feature_10" + -0.2295838540263037 * keras_input_1_rn."Feature_11" + 0.07687952235098178 * keras_input_1_rn."Feature_12" + -0.1553126334450026 * keras_input_1_rn."Feature_13" + -0.2997727486612541 * keras_input_1_rn."Feature_14" + 0.14754010984027188 * keras_input_1_rn."Feature_15" + 0.34569001191798987 * keras_input_1_rn."Feature_16" + 0.2842459528104764 * keras_input_1_rn."Feature_17" + 0.21206936373371676 * keras_input_1_rn."Feature_18" + 0.35779626375021156 * keras_input_1_rn."Feature_19" + 0.13146928467403352 * keras_input_1_rn."Feature_20" + 0.12446076760794866 * keras_input_1_rn."Feature_21" + 0.17877791405958743 * keras_input_1_rn."Feature_22" + 0.3007910137618145 * keras_input_1_rn."Feature_23" + -0.10760617686531598 * keras_input_1_rn."Feature_24" + 0.27660732250347453 * keras_input_1_rn."Feature_25" + -0.03914733337436077 * keras_input_1_rn."Feature_26" + 0.2595221090790355 * keras_input_1_rn."Feature_27" + 0.2860103542333624 * keras_input_1_rn."Feature_28" + -0.02528968316683744 * keras_input_1_rn."Feature_29" AS dot_prod_c_1, 0.0 + -0.05090928011665585 * keras_input_1_rn."Feature_0" + 0.3734376321645776 * keras_input_1_rn."Feature_1" + 0.3440003236743945 * keras_input_1_rn."Feature_2" + -0.07993969726754302 * keras_input_1_rn."Feature_3" + 0.1016682075262978 * keras_input_1_rn."Feature_4" + 0.37554620704300923 * keras_input_1_rn."Feature_5" + 0.3386460180062125 * keras_input_1_rn."Feature_6" + -0.32290144149679045 * keras_input_1_rn."Feature_7" + 0.0900653278326734 * keras_input_1_rn."Feature_8" + -0.13265224496438155 * keras_input_1_rn."Feature_9" + 0.18475000089686966 * keras_input_1_rn."Feature_10" + 0.04460719022957721 * keras_input_1_rn."Feature_11" + 0.219811126125947 * keras_input_1_rn."Feature_12" + 0.11052667452124121 * keras_input_1_rn."Feature_13" + 0.18983374033069877 * keras_input_1_rn."Feature_14" + 0.03204707364948339 * keras_input_1_rn."Feature_15" + -0.17212650800670362 * keras_input_1_rn."Feature_16" + -0.12764164557555635 * keras_input_1_rn."Feature_17" + 0.2481224993579223 * keras_input_1_rn."Feature_18" + 0.22997197521185753 * keras_input_1_rn."Feature_19" + -0.026233493622879245 * keras_input_1_rn."Feature_20" + 0.3370632974397145 * keras_input_1_rn."Feature_21" + 0.37343763011902176 * keras_input_1_rn."Feature_22" + -0.07756495541580205 * keras_input_1_rn."Feature_23" + 0.0452702562063087 * keras_input_1_rn."Feature_24" + 0.10422750086330945 * keras_input_1_rn."Feature_25" + -0.22803490329359102 * keras_input_1_rn."Feature_26" + 0.13767536387985135 * keras_input_1_rn."Feature_27" + -0.006327778004303286 * keras_input_1_rn."Feature_28" + 0.35540953386010565 * keras_input_1_rn."Feature_29" AS dot_prod_c_2, 0.0 + -0.2991041372614857 * keras_input_1_rn."Feature_0" + -0.32314269492577635 * keras_input_1_rn."Feature_1" + 0.16603060585178253 * keras_input_1_rn."Feature_2" + -0.29782808917538184 * keras_input_1_rn."Feature_3" + -0.027698404215677874 * keras_input_1_rn."Feature_4" + 0.1707849422123323 * keras_input_1_rn."Feature_5" + -0.1672479215804621 * keras_input_1_rn."Feature_6" + -0.19928829851289995 * keras_input_1_rn."Feature_7" + 0.21199684751879067 * keras_input_1_rn."Feature_8" + 0.15519546505991955 * keras_input_1_rn."Feature_9" + 0.3466366201283354 * keras_input_1_rn."Feature_10" + 0.08452452235174046 * keras_input_1_rn."Feature_11" + -0.07956678953335677 * keras_input_1_rn."Feature_12" + -0.31936131857598477 * keras_input_1_rn."Feature_13" + -0.2603924032429347 * keras_input_1_rn."Feature_14" + -0.01508970301168544 * keras_input_1_rn."Feature_15" + -0.33959601902066416 * keras_input_1_rn."Feature_16" + -0.04037130129666405 * keras_input_1_rn."Feature_17" + -0.10575704969479449 * keras_input_1_rn."Feature_18" + -0.07045328536147677 * keras_input_1_rn."Feature_19" + 0.23885095968357273 * keras_input_1_rn."Feature_20" + -0.28190046723336304 * keras_input_1_rn."Feature_21" + 0.1901239845337419 * keras_input_1_rn."Feature_22" + -0.06670317659688724 * keras_input_1_rn."Feature_23" + 0.33826202272541306 * keras_input_1_rn."Feature_24" + -0.12729753603627347 * keras_input_1_rn."Feature_25" + 0.16180812487191376 * keras_input_1_rn."Feature_26" + -0.33174224759627663 * keras_input_1_rn."Feature_27" + -0.21355487247463803 * keras_input_1_rn."Feature_28" + 0.19903692666020567 * keras_input_1_rn."Feature_29" AS dot_prod_c_3, 0.0 + 0.062281237830070946 * keras_input_1_rn."Feature_0" + -0.1935283630635214 * keras_input_1_rn."Feature_1" + -0.19034204818431308 * keras_input_1_rn."Feature_2" + 0.09222455392587542 * keras_input_1_rn."Feature_3" + 0.15607875028781437 * keras_input_1_rn."Feature_4" + 0.29700648173798516 * keras_input_1_rn."Feature_5" + 0.1272898186996836 * keras_input_1_rn."Feature_6" + -0.28863637740594134 * keras_input_1_rn."Feature_7" + -0.07335113921766812 * keras_input_1_rn."Feature_8" + -0.02829795872504881 * keras_input_1_rn."Feature_9" + -0.2239326704636529 * keras_input_1_rn."Feature_10" + -0.2587264112353895 * keras_input_1_rn."Feature_11" + -0.3296897177276863 * keras_input_1_rn."Feature_12" + 0.04427966511095205 * keras_input_1_rn."Feature_13" + 0.143044369603066 * keras_input_1_rn."Feature_14" + 0.1573387325205936 * keras_input_1_rn."Feature_15" + 0.09542859947715693 * keras_input_1_rn."Feature_16" + 0.2596969656678695 * keras_input_1_rn."Feature_17" + 0.05023739208965172 * keras_input_1_rn."Feature_18" + -0.010621678266894252 * keras_input_1_rn."Feature_19" + 0.2593609529551316 * keras_input_1_rn."Feature_20" + 0.0025819167707545887 * keras_input_1_rn."Feature_21" + -0.3245118468528591 * keras_input_1_rn."Feature_22" + -0.2911795288926902 * keras_input_1_rn."Feature_23" + -0.0582810195705149 * keras_input_1_rn."Feature_24" + 0.2145815009599199 * keras_input_1_rn."Feature_25" + 0.1190616062615914 * keras_input_1_rn."Feature_26" + -0.3688051491610632 * keras_input_1_rn."Feature_27" + -0.33544355986364915 * keras_input_1_rn."Feature_28" + 0.0895341358652968 * keras_input_1_rn."Feature_29" AS dot_prod_o_1, 0.0 + -0.34652773840391154 * keras_input_1_rn."Feature_0" + 0.12165191099137307 * keras_input_1_rn."Feature_1" + -0.07250769859004957 * keras_input_1_rn."Feature_2" + -0.3592630665652984 * keras_input_1_rn."Feature_3" + -0.12875220481531033 * keras_input_1_rn."Feature_4" + -0.2613403300276185 * keras_input_1_rn."Feature_5" + 0.31368654171260557 * keras_input_1_rn."Feature_6" + -0.3251940531412592 * keras_input_1_rn."Feature_7" + -0.024081759993227703 * keras_input_1_rn."Feature_8" + 0.20341116787289482 * keras_input_1_rn."Feature_9" + 0.24265960504018602 * keras_input_1_rn."Feature_10" + -0.27415159100241915 * keras_input_1_rn."Feature_11" + 0.0534955725940498 * keras_input_1_rn."Feature_12" + -0.08652366968852054 * keras_input_1_rn."Feature_13" + -0.3139841830538181 * keras_input_1_rn."Feature_14" + 0.32733505644017535 * keras_input_1_rn."Feature_15" + -0.18007726798712284 * keras_input_1_rn."Feature_16" + 0.047607270143762426 * keras_input_1_rn."Feature_17" + 0.1274039471706635 * keras_input_1_rn."Feature_18" + 0.285146843290647 * keras_input_1_rn."Feature_19" + 0.06294986614914039 * keras_input_1_rn."Feature_20" + -0.30892140732197215 * keras_input_1_rn."Feature_21" + 0.16693831615196097 * keras_input_1_rn."Feature_22" + -0.23471288299145907 * keras_input_1_rn."Feature_23" + 0.13606099637959612 * keras_input_1_rn."Feature_24" + 0.11035145465831614 * keras_input_1_rn."Feature_25" + -0.23909303397133694 * keras_input_1_rn."Feature_26" + -0.17739572134649859 * keras_input_1_rn."Feature_27" + -0.0763072673981709 * keras_input_1_rn."Feature_28" + 0.3054986384051168 * keras_input_1_rn."Feature_29" AS dot_prod_o_2, 0.0 + -0.13453917644398056 * keras_input_1_rn."Feature_0" + -0.10083967081827716 * keras_input_1_rn."Feature_1" + 0.040961096813309006 * keras_input_1_rn."Feature_2" + 0.3712110250844375 * keras_input_1_rn."Feature_3" + 0.1740138480539547 * keras_input_1_rn."Feature_4" + -0.3611546128796133 * keras_input_1_rn."Feature_5" + -0.3718799042023108 * keras_input_1_rn."Feature_6" + 0.1528487281629085 * keras_input_1_rn."Feature_7" + 0.22370584780460046 * keras_input_1_rn."Feature_8" + -0.3454780351064775 * keras_input_1_rn."Feature_9" + 0.33051884109426344 * keras_input_1_rn."Feature_10" + 0.07812474364126287 * keras_input_1_rn."Feature_11" + 0.35860825839850374 * keras_input_1_rn."Feature_12" + -0.012619215570959186 * keras_input_1_rn."Feature_13" + 0.22435961945205618 * keras_input_1_rn."Feature_14" + -0.12007751879368267 * keras_input_1_rn."Feature_15" + 0.2628180706548947 * keras_input_1_rn."Feature_16" + -0.36084818031248517 * keras_input_1_rn."Feature_17" + -0.28664857752142575 * keras_input_1_rn."Feature_18" + 0.010359278956983575 * keras_input_1_rn."Feature_19" + 0.18967678591000048 * keras_input_1_rn."Feature_20" + -0.3621848802700105 * keras_input_1_rn."Feature_21" + 0.09986575731495118 * keras_input_1_rn."Feature_22" + -0.145917504157644 * keras_input_1_rn."Feature_23" + 0.24278056876606513 * keras_input_1_rn."Feature_24" + 0.11953685321235413 * keras_input_1_rn."Feature_25" + -0.029088147352364258 * keras_input_1_rn."Feature_26" + 0.09952052918913212 * keras_input_1_rn."Feature_27" + -0.2243964084968786 * keras_input_1_rn."Feature_28" + -0.1575111326585865 * keras_input_1_rn."Feature_29" AS dot_prod_o_3 
FROM keras_input_1_rn), 
rnn_cte_lstm_1(rn_1, "KEY", "PreviousState_1", "PreviousState_2", "PreviousState_3", "PreviousState_4", "PreviousState_5", "PreviousState_6", "State_1", "State_2", "State_3", "State_4", "State_5", "State_6") AS 
(SELECT lstm_input_kernel_bias.rn AS rn_1, lstm_input_kernel_bias."KEY" AS "KEY", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_1", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_2", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_3", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_4", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_5", CAST(0.0 AS BINARY_DOUBLE) AS "PreviousState_6", greatest(lstm_input_kernel_bias.dot_prod_o_1 + 0.0, 0) * tanh(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0) AS "State_1", greatest(lstm_input_kernel_bias.dot_prod_o_2 + 0.0, 0) * tanh(greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0) AS "State_2", greatest(lstm_input_kernel_bias.dot_prod_o_3 + 0.0, 0) * tanh(greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0) AS "State_3", greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.0) + greatest(lstm_input_kernel_bias.dot_prod_f_1 + 0.0, 0) * 0.0 AS "State_4", greatest(lstm_input_kernel_bias.dot_prod_i_2 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.0) + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.0, 0) * 0.0 AS "State_5", greatest(lstm_input_kernel_bias.dot_prod_i_3 + 0.0, 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + 0.0) + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.0, 0) * 0.0 AS "State_6" 
FROM lstm_input_kernel_bias 
WHERE lstm_input_kernel_bias.rn = 1 UNION ALL SELECT lstm_input_kernel_bias.rn AS rn, lstm_input_kernel_bias."KEY" AS "KEY", rnn_cte_lstm_1."State_1" AS "PreviousState_1", rnn_cte_lstm_1."State_2" AS "PreviousState_2", rnn_cte_lstm_1."State_3" AS "PreviousState_3", rnn_cte_lstm_1."State_4" AS "PreviousState_4", rnn_cte_lstm_1."State_5" AS "PreviousState_5", rnn_cte_lstm_1."State_6" AS "PreviousState_6", greatest(lstm_input_kernel_bias.dot_prod_o_1 + -0.15164751198979584 * rnn_cte_lstm_1."State_1" + 0.08253020083536827 * rnn_cte_lstm_1."State_2" + -0.08763056336675054 * rnn_cte_lstm_1."State_3", 0) * tanh(greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4") AS "State_1", greatest(lstm_input_kernel_bias.dot_prod_o_2 + 0.08662667743445306 * rnn_cte_lstm_1."State_1" + 0.6291438223603882 * rnn_cte_lstm_1."State_2" + -0.21097102613985744 * rnn_cte_lstm_1."State_3", 0) * tanh(greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5") AS "State_2", greatest(lstm_input_kernel_bias.dot_prod_o_3 + 0.6248732477230643 * rnn_cte_lstm_1."State_1" + -0.3162233397893954 * rnn_cte_lstm_1."State_2" + -0.47679471737944495 * rnn_cte_lstm_1."State_3", 0) * tanh(greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6") AS "State_3", greatest(lstm_input_kernel_bias.dot_prod_i_1 + 0.11780271360136857 * rnn_cte_lstm_1."State_1" + 0.2487056155077179 * rnn_cte_lstm_1."State_2" + -0.09242046264251788 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_1 + 0.030292966530713852 * rnn_cte_lstm_1."State_1" + -0.023239700724073803 * rnn_cte_lstm_1."State_2" + 0.523162297866245 * rnn_cte_lstm_1."State_3") + greatest(lstm_input_kernel_bias.dot_prod_f_1 + -0.4168294149364666 * rnn_cte_lstm_1."State_1" + 0.1545536618879541 * rnn_cte_lstm_1."State_2" + -0.024703716341743575 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_4" AS "State_4", greatest(lstm_input_kernel_bias.dot_prod_i_2 + -0.19559477723174404 * rnn_cte_lstm_1."State_1" + -0.31837677772831285 * rnn_cte_lstm_1."State_2" + -0.11491617670326393 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_2 + 0.17448831523202973 * rnn_cte_lstm_1."State_1" + 0.37700792218247725 * rnn_cte_lstm_1."State_2" + 0.13475197118706184 * rnn_cte_lstm_1."State_3") + greatest(lstm_input_kernel_bias.dot_prod_f_2 + 0.33552079367368043 * rnn_cte_lstm_1."State_1" + -0.06965585875573488 * rnn_cte_lstm_1."State_2" + 0.5835326918567338 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_5" AS "State_5", greatest(lstm_input_kernel_bias.dot_prod_i_3 + -0.08246075095429538 * rnn_cte_lstm_1."State_1" + 0.28885285275698036 * rnn_cte_lstm_1."State_2" + -0.19409292248622836 * rnn_cte_lstm_1."State_3", 0) * tanh(lstm_input_kernel_bias.dot_prod_c_3 + -0.07157507510853936 * rnn_cte_lstm_1."State_1" + -0.17480802516909186 * rnn_cte_lstm_1."State_2" + -0.16245894120828017 * rnn_cte_lstm_1."State_3") + greatest(lstm_input_kernel_bias.dot_prod_f_3 + 0.4441732904955501 * rnn_cte_lstm_1."State_1" + 0.22077978616056787 * rnn_cte_lstm_1."State_2" + 0.041098765644672824 * rnn_cte_lstm_1."State_3", 0) * rnn_cte_lstm_1."State_6" AS "State_6" 
FROM lstm_input_kernel_bias, rnn_cte_lstm_1 
WHERE lstm_input_kernel_bias.rn = rnn_cte_lstm_1.rn_1 + 1), 
lstm_1 AS 
(SELECT rnn_cte_lstm_1."KEY" AS "KEY", CAST(rnn_cte_lstm_1."State_1" AS BINARY_DOUBLE) AS output_1, CAST(rnn_cte_lstm_1."State_2" AS BINARY_DOUBLE) AS output_2, CAST(rnn_cte_lstm_1."State_3" AS BINARY_DOUBLE) AS output_3 
FROM rnn_cte_lstm_1), 
lstm_1_1 AS 
(SELECT lstm_1."KEY" AS "KEY", lstm_1.output_1 AS output_1, lstm_1.output_2 AS output_2, lstm_1.output_3 AS output_3 
FROM lstm_1), 
layer_dense_1 AS 
(SELECT lstm_1_1."KEY" AS "KEY", -0.3053786911277658 + -0.5677030636700379 * lstm_1_1.output_1 + -0.498550684139931 * lstm_1_1.output_2 + -0.4980310002885612 * lstm_1_1.output_3 AS output_1, 0.30537869112776583 + 1.0282784602501474 * lstm_1_1.output_1 + -0.22001588382561976 * lstm_1_1.output_2 + 0.3740320118298457 * lstm_1_1.output_3 AS output_2 
FROM lstm_1_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2 
FROM layer_dense_1), 
score_soft_max_step1 AS 
(SELECT layer_dense_1_1."KEY" AS "KEY", layer_dense_1_1.output_1 AS "Score_0", exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_1))) AS "exp_Score_0", layer_dense_1_1.output_2 AS "Score_1", exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_2))) AS "exp_Score_1" 
FROM layer_dense_1_1), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_Score" AS "exp_Score" 
FROM (SELECT score_soft_max_step1."KEY" AS "KEY", 0 AS class, score_soft_max_step1."exp_Score_0" AS "exp_Score" 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1."KEY" AS "KEY", 1 AS class, score_soft_max_step1."exp_Score_1" AS "exp_Score" 
FROM score_soft_max_step1) soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1."KEY" AS "KEY", score_soft_max_step1."Score_0" AS "Score_0", score_soft_max_step1."exp_Score_0" AS "exp_Score_0", score_soft_max_step1."Score_1" AS "Score_1", score_soft_max_step1."exp_Score_1" AS "exp_Score_1", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpScore" AS "sum_ExpScore" 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_Score") AS "sum_ExpScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") sum_exp_t ON score_soft_max_step1."KEY" = sum_exp_t."KEY_sum"), 
layer_softmax AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."exp_Score_0" / score_soft_max."sum_ExpScore" AS output_1, score_soft_max."exp_Score_1" / score_soft_max."sum_ExpScore" AS output_2 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax."KEY" AS "KEY", CAST(NULL AS BINARY_DOUBLE) AS "Score_0", CAST(NULL AS BINARY_DOUBLE) AS "Score_1", layer_softmax.output_1 AS "Proba_0", layer_softmax.output_2 AS "Proba_1", CAST(NULL AS BINARY_DOUBLE) AS "LogProba_0", CAST(NULL AS BINARY_DOUBLE) AS "LogProba_1", CAST(NULL AS NUMBER(19)) AS "Decision", CAST(NULL AS BINARY_DOUBLE) AS "DecisionProba" 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte