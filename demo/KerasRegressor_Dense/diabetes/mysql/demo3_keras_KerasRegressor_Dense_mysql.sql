-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasRegressor_Dense
-- Dataset : diabetes
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3`, `ADS`.`Feature_4` AS `Feature_4`, `ADS`.`Feature_5` AS `Feature_5`, `ADS`.`Feature_6` AS `Feature_6`, `ADS`.`Feature_7` AS `Feature_7`, `ADS`.`Feature_8` AS `Feature_8`, `ADS`.`Feature_9` AS `Feature_9` 
FROM diabetes AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3`, keras_input.`Feature_4` AS `Feature_4`, keras_input.`Feature_5` AS `Feature_5`, keras_input.`Feature_6` AS `Feature_6`, keras_input.`Feature_7` AS `Feature_7`, keras_input.`Feature_8` AS `Feature_8`, keras_input.`Feature_9` AS `Feature_9` 
FROM keras_input), 
layer_dense_1 AS 
(SELECT keras_input_1.`KEY` AS `KEY`, 4.295641397921041 + 1.0526724768247178 * keras_input_1.`Feature_0` + 0.6014615946345874 * keras_input_1.`Feature_1` + 1.0699674793564413 * keras_input_1.`Feature_2` + 1.7548384530394412 * keras_input_1.`Feature_3` + 1.2252348864007176 * keras_input_1.`Feature_4` + 0.03375402017499633 * keras_input_1.`Feature_5` + -1.733508040708217 * keras_input_1.`Feature_6` + 1.404641907941868 * keras_input_1.`Feature_7` + 2.0373118769960636 * keras_input_1.`Feature_8` + 0.6307033586561239 * keras_input_1.`Feature_9` AS output_1, -4.333365359606852 + -1.0027961339936728 * keras_input_1.`Feature_0` + -0.09916916726239818 * keras_input_1.`Feature_1` + -1.3624332355889008 * keras_input_1.`Feature_2` + -1.0495609176472918 * keras_input_1.`Feature_3` + -1.0573166723405842 * keras_input_1.`Feature_4` + -1.0821159337186754 * keras_input_1.`Feature_5` + 1.409166094532033 * keras_input_1.`Feature_6` + -1.209325983467842 * keras_input_1.`Feature_7` + -1.5100870105352353 * keras_input_1.`Feature_8` + -1.0594503536292692 * keras_input_1.`Feature_9` AS output_2, 4.054344799312677 + 0.1928695720975582 * keras_input_1.`Feature_0` + 0.20175349442367974 * keras_input_1.`Feature_1` + 1.3353747266446763 * keras_input_1.`Feature_2` + 0.7742481393319068 * keras_input_1.`Feature_3` + 0.8159072069489393 * keras_input_1.`Feature_4` + 0.10093162407606017 * keras_input_1.`Feature_5` + -1.4549610400913182 * keras_input_1.`Feature_6` + 1.1927805281371102 * keras_input_1.`Feature_7` + 0.87041601901728 * keras_input_1.`Feature_8` + 0.30596694952162756 * keras_input_1.`Feature_9` AS output_3, 4.043550862654967 + 1.0910401624898387 * keras_input_1.`Feature_0` + -0.1627916653167315 * keras_input_1.`Feature_1` + 1.3850617591061576 * keras_input_1.`Feature_2` + 1.6814123204148594 * keras_input_1.`Feature_3` + -0.04490989423134591 * keras_input_1.`Feature_4` + 0.8769003070782841 * keras_input_1.`Feature_5` + -1.3473184805162741 * keras_input_1.`Feature_6` + 1.0769423188815423 * keras_input_1.`Feature_7` + 1.0416751417566712 * keras_input_1.`Feature_8` + 1.1453706613521626 * keras_input_1.`Feature_9` AS output_4 
FROM keras_input_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2, layer_dense_1.output_3 AS output_3, layer_dense_1.output_4 AS output_4 
FROM layer_dense_1), 
layer_dense_2 AS 
(SELECT layer_dense_1_1.`KEY` AS `KEY`, 3.2221308866729177 + 4.875325695446866 * layer_dense_1_1.output_1 + -4.873205126840281 * layer_dense_1_1.output_2 + 5.612605311644341 * layer_dense_1_1.output_3 + 5.5254107198896225 * layer_dense_1_1.output_4 AS output_1 
FROM layer_dense_1_1)
 SELECT layer_dense_2.`KEY` AS `KEY`, layer_dense_2.output_1 AS `Estimator` 
FROM layer_dense_2