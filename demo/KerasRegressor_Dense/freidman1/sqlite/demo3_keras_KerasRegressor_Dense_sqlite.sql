-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_Dense
-- Dataset : freidman1
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT "ADS"."KEY" AS "KEY", "ADS"."Feature_0" AS "Feature_0", "ADS"."Feature_1" AS "Feature_1", "ADS"."Feature_2" AS "Feature_2", "ADS"."Feature_3" AS "Feature_3", "ADS"."Feature_4" AS "Feature_4", "ADS"."Feature_5" AS "Feature_5", "ADS"."Feature_6" AS "Feature_6", "ADS"."Feature_7" AS "Feature_7", "ADS"."Feature_8" AS "Feature_8", "ADS"."Feature_9" AS "Feature_9" 
FROM freidman1 AS "ADS"), 
keras_input_1 AS 
(SELECT keras_input."KEY" AS "KEY", keras_input."Feature_0" AS "Feature_0", keras_input."Feature_1" AS "Feature_1", keras_input."Feature_2" AS "Feature_2", keras_input."Feature_3" AS "Feature_3", keras_input."Feature_4" AS "Feature_4", keras_input."Feature_5" AS "Feature_5", keras_input."Feature_6" AS "Feature_6", keras_input."Feature_7" AS "Feature_7", keras_input."Feature_8" AS "Feature_8", keras_input."Feature_9" AS "Feature_9" 
FROM keras_input), 
layer_dense_1 AS 
(SELECT keras_input_1."KEY" AS "KEY", 0.5824321729862851 + 1.0606468400187243 * keras_input_1."Feature_0" + 1.0135523942379978 * keras_input_1."Feature_1" + 0.15408826213816462 * keras_input_1."Feature_2" + 1.1850203931023768 * keras_input_1."Feature_3" + 1.1344147061062 * keras_input_1."Feature_4" + -0.007103608918924301 * keras_input_1."Feature_5" + 0.07732915014819586 * keras_input_1."Feature_6" + 0.7443805145253642 * keras_input_1."Feature_7" + 0.9665838174216186 * keras_input_1."Feature_8" + 0.11485394242166055 * keras_input_1."Feature_9" AS output_1, -0.6008380545609878 + -1.0245533160254463 * keras_input_1."Feature_0" + -0.5268591210412782 * keras_input_1."Feature_1" + -0.45103293202267614 * keras_input_1."Feature_2" + -0.48892181403684665 * keras_input_1."Feature_3" + -0.9785164486057237 * keras_input_1."Feature_4" + -1.0534323556855996 * keras_input_1."Feature_5" + -0.42726280550737483 * keras_input_1."Feature_6" + -0.5564341000192379 * keras_input_1."Feature_7" + -0.4441103181578762 * keras_input_1."Feature_8" + -0.5514512961537102 * keras_input_1."Feature_9" AS output_2, 0.47037726145955894 + 0.12383080415647085 * keras_input_1."Feature_0" + 0.5152206642051695 * keras_input_1."Feature_1" + 0.40454338110395066 * keras_input_1."Feature_2" + 0.15640631192702195 * keras_input_1."Feature_3" + 0.6569932441725698 * keras_input_1."Feature_4" + -0.009854906198316714 * keras_input_1."Feature_5" + 0.19173690776081054 * keras_input_1."Feature_6" + 0.49744306118523474 * keras_input_1."Feature_7" + -0.21500726097843512 * keras_input_1."Feature_8" + -0.24926566866025568 * keras_input_1."Feature_9" AS output_3, 0.5289666970585564 + 1.0771454641664293 * keras_input_1."Feature_0" + 0.20464806869018387 * keras_input_1."Feature_1" + 0.5015200581393938 * keras_input_1."Feature_2" + 1.119483596430517 * keras_input_1."Feature_3" + -0.1518243476930998 * keras_input_1."Feature_4" + 0.8187256310746787 * keras_input_1."Feature_5" + 0.34633941958819264 * keras_input_1."Feature_6" + 0.43318047190399467 * keras_input_1."Feature_7" + 0.009736763632345134 * keras_input_1."Feature_8" + 0.6404173013802035 * keras_input_1."Feature_9" AS output_4 
FROM keras_input_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1."KEY" AS "KEY", layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2, layer_dense_1.output_3 AS output_3, layer_dense_1.output_4 AS output_4 
FROM layer_dense_1), 
layer_dense_2 AS 
(SELECT layer_dense_1_1."KEY" AS "KEY", 0.466354452832874 + 1.046303589483474 * layer_dense_1_1.output_1 + -0.9894484114980385 * layer_dense_1_1.output_2 + 1.1552603775519839 * layer_dense_1_1.output_3 + 1.6330573793486718 * layer_dense_1_1.output_4 AS output_1 
FROM layer_dense_1_1)
 SELECT layer_dense_2."KEY" AS "KEY", layer_dense_2.output_1 AS "Estimator" 
FROM layer_dense_2