-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : KerasClassifier_SimpleRNN
-- Dataset : BinaryClass_100
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH RECURSIVE keras_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, `ADS`.`Feature_0` AS `Feature_0`, `ADS`.`Feature_1` AS `Feature_1`, `ADS`.`Feature_2` AS `Feature_2`, `ADS`.`Feature_3` AS `Feature_3`, `ADS`.`Feature_4` AS `Feature_4`, `ADS`.`Feature_5` AS `Feature_5`, `ADS`.`Feature_6` AS `Feature_6`, `ADS`.`Feature_7` AS `Feature_7`, `ADS`.`Feature_8` AS `Feature_8`, `ADS`.`Feature_9` AS `Feature_9`, `ADS`.`Feature_10` AS `Feature_10`, `ADS`.`Feature_11` AS `Feature_11`, `ADS`.`Feature_12` AS `Feature_12`, `ADS`.`Feature_13` AS `Feature_13`, `ADS`.`Feature_14` AS `Feature_14`, `ADS`.`Feature_15` AS `Feature_15`, `ADS`.`Feature_16` AS `Feature_16`, `ADS`.`Feature_17` AS `Feature_17`, `ADS`.`Feature_18` AS `Feature_18`, `ADS`.`Feature_19` AS `Feature_19`, `ADS`.`Feature_20` AS `Feature_20`, `ADS`.`Feature_21` AS `Feature_21`, `ADS`.`Feature_22` AS `Feature_22`, `ADS`.`Feature_23` AS `Feature_23`, `ADS`.`Feature_24` AS `Feature_24`, `ADS`.`Feature_25` AS `Feature_25`, `ADS`.`Feature_26` AS `Feature_26`, `ADS`.`Feature_27` AS `Feature_27`, `ADS`.`Feature_28` AS `Feature_28`, `ADS`.`Feature_29` AS `Feature_29`, `ADS`.`Feature_30` AS `Feature_30`, `ADS`.`Feature_31` AS `Feature_31`, `ADS`.`Feature_32` AS `Feature_32`, `ADS`.`Feature_33` AS `Feature_33`, `ADS`.`Feature_34` AS `Feature_34`, `ADS`.`Feature_35` AS `Feature_35`, `ADS`.`Feature_36` AS `Feature_36`, `ADS`.`Feature_37` AS `Feature_37`, `ADS`.`Feature_38` AS `Feature_38`, `ADS`.`Feature_39` AS `Feature_39`, `ADS`.`Feature_40` AS `Feature_40`, `ADS`.`Feature_41` AS `Feature_41`, `ADS`.`Feature_42` AS `Feature_42`, `ADS`.`Feature_43` AS `Feature_43`, `ADS`.`Feature_44` AS `Feature_44`, `ADS`.`Feature_45` AS `Feature_45`, `ADS`.`Feature_46` AS `Feature_46`, `ADS`.`Feature_47` AS `Feature_47`, `ADS`.`Feature_48` AS `Feature_48`, `ADS`.`Feature_49` AS `Feature_49`, `ADS`.`Feature_50` AS `Feature_50`, `ADS`.`Feature_51` AS `Feature_51`, `ADS`.`Feature_52` AS `Feature_52`, `ADS`.`Feature_53` AS `Feature_53`, `ADS`.`Feature_54` AS `Feature_54`, `ADS`.`Feature_55` AS `Feature_55`, `ADS`.`Feature_56` AS `Feature_56`, `ADS`.`Feature_57` AS `Feature_57`, `ADS`.`Feature_58` AS `Feature_58`, `ADS`.`Feature_59` AS `Feature_59`, `ADS`.`Feature_60` AS `Feature_60`, `ADS`.`Feature_61` AS `Feature_61`, `ADS`.`Feature_62` AS `Feature_62`, `ADS`.`Feature_63` AS `Feature_63`, `ADS`.`Feature_64` AS `Feature_64`, `ADS`.`Feature_65` AS `Feature_65`, `ADS`.`Feature_66` AS `Feature_66`, `ADS`.`Feature_67` AS `Feature_67`, `ADS`.`Feature_68` AS `Feature_68`, `ADS`.`Feature_69` AS `Feature_69`, `ADS`.`Feature_70` AS `Feature_70`, `ADS`.`Feature_71` AS `Feature_71`, `ADS`.`Feature_72` AS `Feature_72`, `ADS`.`Feature_73` AS `Feature_73`, `ADS`.`Feature_74` AS `Feature_74`, `ADS`.`Feature_75` AS `Feature_75`, `ADS`.`Feature_76` AS `Feature_76`, `ADS`.`Feature_77` AS `Feature_77`, `ADS`.`Feature_78` AS `Feature_78`, `ADS`.`Feature_79` AS `Feature_79`, `ADS`.`Feature_80` AS `Feature_80`, `ADS`.`Feature_81` AS `Feature_81`, `ADS`.`Feature_82` AS `Feature_82`, `ADS`.`Feature_83` AS `Feature_83`, `ADS`.`Feature_84` AS `Feature_84`, `ADS`.`Feature_85` AS `Feature_85`, `ADS`.`Feature_86` AS `Feature_86`, `ADS`.`Feature_87` AS `Feature_87`, `ADS`.`Feature_88` AS `Feature_88`, `ADS`.`Feature_89` AS `Feature_89`, `ADS`.`Feature_90` AS `Feature_90`, `ADS`.`Feature_91` AS `Feature_91`, `ADS`.`Feature_92` AS `Feature_92`, `ADS`.`Feature_93` AS `Feature_93`, `ADS`.`Feature_94` AS `Feature_94`, `ADS`.`Feature_95` AS `Feature_95`, `ADS`.`Feature_96` AS `Feature_96`, `ADS`.`Feature_97` AS `Feature_97`, `ADS`.`Feature_98` AS `Feature_98`, `ADS`.`Feature_99` AS `Feature_99` 
FROM `BinaryClass_100` AS `ADS`), 
keras_input_1 AS 
(SELECT keras_input.`KEY` AS `KEY`, keras_input.`Feature_0` AS `Feature_0`, keras_input.`Feature_1` AS `Feature_1`, keras_input.`Feature_2` AS `Feature_2`, keras_input.`Feature_3` AS `Feature_3`, keras_input.`Feature_4` AS `Feature_4`, keras_input.`Feature_5` AS `Feature_5`, keras_input.`Feature_6` AS `Feature_6`, keras_input.`Feature_7` AS `Feature_7`, keras_input.`Feature_8` AS `Feature_8`, keras_input.`Feature_9` AS `Feature_9`, keras_input.`Feature_10` AS `Feature_10`, keras_input.`Feature_11` AS `Feature_11`, keras_input.`Feature_12` AS `Feature_12`, keras_input.`Feature_13` AS `Feature_13`, keras_input.`Feature_14` AS `Feature_14`, keras_input.`Feature_15` AS `Feature_15`, keras_input.`Feature_16` AS `Feature_16`, keras_input.`Feature_17` AS `Feature_17`, keras_input.`Feature_18` AS `Feature_18`, keras_input.`Feature_19` AS `Feature_19`, keras_input.`Feature_20` AS `Feature_20`, keras_input.`Feature_21` AS `Feature_21`, keras_input.`Feature_22` AS `Feature_22`, keras_input.`Feature_23` AS `Feature_23`, keras_input.`Feature_24` AS `Feature_24`, keras_input.`Feature_25` AS `Feature_25`, keras_input.`Feature_26` AS `Feature_26`, keras_input.`Feature_27` AS `Feature_27`, keras_input.`Feature_28` AS `Feature_28`, keras_input.`Feature_29` AS `Feature_29`, keras_input.`Feature_30` AS `Feature_30`, keras_input.`Feature_31` AS `Feature_31`, keras_input.`Feature_32` AS `Feature_32`, keras_input.`Feature_33` AS `Feature_33`, keras_input.`Feature_34` AS `Feature_34`, keras_input.`Feature_35` AS `Feature_35`, keras_input.`Feature_36` AS `Feature_36`, keras_input.`Feature_37` AS `Feature_37`, keras_input.`Feature_38` AS `Feature_38`, keras_input.`Feature_39` AS `Feature_39`, keras_input.`Feature_40` AS `Feature_40`, keras_input.`Feature_41` AS `Feature_41`, keras_input.`Feature_42` AS `Feature_42`, keras_input.`Feature_43` AS `Feature_43`, keras_input.`Feature_44` AS `Feature_44`, keras_input.`Feature_45` AS `Feature_45`, keras_input.`Feature_46` AS `Feature_46`, keras_input.`Feature_47` AS `Feature_47`, keras_input.`Feature_48` AS `Feature_48`, keras_input.`Feature_49` AS `Feature_49`, keras_input.`Feature_50` AS `Feature_50`, keras_input.`Feature_51` AS `Feature_51`, keras_input.`Feature_52` AS `Feature_52`, keras_input.`Feature_53` AS `Feature_53`, keras_input.`Feature_54` AS `Feature_54`, keras_input.`Feature_55` AS `Feature_55`, keras_input.`Feature_56` AS `Feature_56`, keras_input.`Feature_57` AS `Feature_57`, keras_input.`Feature_58` AS `Feature_58`, keras_input.`Feature_59` AS `Feature_59`, keras_input.`Feature_60` AS `Feature_60`, keras_input.`Feature_61` AS `Feature_61`, keras_input.`Feature_62` AS `Feature_62`, keras_input.`Feature_63` AS `Feature_63`, keras_input.`Feature_64` AS `Feature_64`, keras_input.`Feature_65` AS `Feature_65`, keras_input.`Feature_66` AS `Feature_66`, keras_input.`Feature_67` AS `Feature_67`, keras_input.`Feature_68` AS `Feature_68`, keras_input.`Feature_69` AS `Feature_69`, keras_input.`Feature_70` AS `Feature_70`, keras_input.`Feature_71` AS `Feature_71`, keras_input.`Feature_72` AS `Feature_72`, keras_input.`Feature_73` AS `Feature_73`, keras_input.`Feature_74` AS `Feature_74`, keras_input.`Feature_75` AS `Feature_75`, keras_input.`Feature_76` AS `Feature_76`, keras_input.`Feature_77` AS `Feature_77`, keras_input.`Feature_78` AS `Feature_78`, keras_input.`Feature_79` AS `Feature_79`, keras_input.`Feature_80` AS `Feature_80`, keras_input.`Feature_81` AS `Feature_81`, keras_input.`Feature_82` AS `Feature_82`, keras_input.`Feature_83` AS `Feature_83`, keras_input.`Feature_84` AS `Feature_84`, keras_input.`Feature_85` AS `Feature_85`, keras_input.`Feature_86` AS `Feature_86`, keras_input.`Feature_87` AS `Feature_87`, keras_input.`Feature_88` AS `Feature_88`, keras_input.`Feature_89` AS `Feature_89`, keras_input.`Feature_90` AS `Feature_90`, keras_input.`Feature_91` AS `Feature_91`, keras_input.`Feature_92` AS `Feature_92`, keras_input.`Feature_93` AS `Feature_93`, keras_input.`Feature_94` AS `Feature_94`, keras_input.`Feature_95` AS `Feature_95`, keras_input.`Feature_96` AS `Feature_96`, keras_input.`Feature_97` AS `Feature_97`, keras_input.`Feature_98` AS `Feature_98`, keras_input.`Feature_99` AS `Feature_99` 
FROM keras_input), 
keras_input_1_rn AS 
(SELECT row_number() OVER (ORDER BY keras_input_1.`KEY` ASC) AS rn, keras_input_1.`KEY` AS `KEY`, keras_input_1.`Feature_0` AS `Feature_0`, keras_input_1.`Feature_1` AS `Feature_1`, keras_input_1.`Feature_2` AS `Feature_2`, keras_input_1.`Feature_3` AS `Feature_3`, keras_input_1.`Feature_4` AS `Feature_4`, keras_input_1.`Feature_5` AS `Feature_5`, keras_input_1.`Feature_6` AS `Feature_6`, keras_input_1.`Feature_7` AS `Feature_7`, keras_input_1.`Feature_8` AS `Feature_8`, keras_input_1.`Feature_9` AS `Feature_9`, keras_input_1.`Feature_10` AS `Feature_10`, keras_input_1.`Feature_11` AS `Feature_11`, keras_input_1.`Feature_12` AS `Feature_12`, keras_input_1.`Feature_13` AS `Feature_13`, keras_input_1.`Feature_14` AS `Feature_14`, keras_input_1.`Feature_15` AS `Feature_15`, keras_input_1.`Feature_16` AS `Feature_16`, keras_input_1.`Feature_17` AS `Feature_17`, keras_input_1.`Feature_18` AS `Feature_18`, keras_input_1.`Feature_19` AS `Feature_19`, keras_input_1.`Feature_20` AS `Feature_20`, keras_input_1.`Feature_21` AS `Feature_21`, keras_input_1.`Feature_22` AS `Feature_22`, keras_input_1.`Feature_23` AS `Feature_23`, keras_input_1.`Feature_24` AS `Feature_24`, keras_input_1.`Feature_25` AS `Feature_25`, keras_input_1.`Feature_26` AS `Feature_26`, keras_input_1.`Feature_27` AS `Feature_27`, keras_input_1.`Feature_28` AS `Feature_28`, keras_input_1.`Feature_29` AS `Feature_29`, keras_input_1.`Feature_30` AS `Feature_30`, keras_input_1.`Feature_31` AS `Feature_31`, keras_input_1.`Feature_32` AS `Feature_32`, keras_input_1.`Feature_33` AS `Feature_33`, keras_input_1.`Feature_34` AS `Feature_34`, keras_input_1.`Feature_35` AS `Feature_35`, keras_input_1.`Feature_36` AS `Feature_36`, keras_input_1.`Feature_37` AS `Feature_37`, keras_input_1.`Feature_38` AS `Feature_38`, keras_input_1.`Feature_39` AS `Feature_39`, keras_input_1.`Feature_40` AS `Feature_40`, keras_input_1.`Feature_41` AS `Feature_41`, keras_input_1.`Feature_42` AS `Feature_42`, keras_input_1.`Feature_43` AS `Feature_43`, keras_input_1.`Feature_44` AS `Feature_44`, keras_input_1.`Feature_45` AS `Feature_45`, keras_input_1.`Feature_46` AS `Feature_46`, keras_input_1.`Feature_47` AS `Feature_47`, keras_input_1.`Feature_48` AS `Feature_48`, keras_input_1.`Feature_49` AS `Feature_49`, keras_input_1.`Feature_50` AS `Feature_50`, keras_input_1.`Feature_51` AS `Feature_51`, keras_input_1.`Feature_52` AS `Feature_52`, keras_input_1.`Feature_53` AS `Feature_53`, keras_input_1.`Feature_54` AS `Feature_54`, keras_input_1.`Feature_55` AS `Feature_55`, keras_input_1.`Feature_56` AS `Feature_56`, keras_input_1.`Feature_57` AS `Feature_57`, keras_input_1.`Feature_58` AS `Feature_58`, keras_input_1.`Feature_59` AS `Feature_59`, keras_input_1.`Feature_60` AS `Feature_60`, keras_input_1.`Feature_61` AS `Feature_61`, keras_input_1.`Feature_62` AS `Feature_62`, keras_input_1.`Feature_63` AS `Feature_63`, keras_input_1.`Feature_64` AS `Feature_64`, keras_input_1.`Feature_65` AS `Feature_65`, keras_input_1.`Feature_66` AS `Feature_66`, keras_input_1.`Feature_67` AS `Feature_67`, keras_input_1.`Feature_68` AS `Feature_68`, keras_input_1.`Feature_69` AS `Feature_69`, keras_input_1.`Feature_70` AS `Feature_70`, keras_input_1.`Feature_71` AS `Feature_71`, keras_input_1.`Feature_72` AS `Feature_72`, keras_input_1.`Feature_73` AS `Feature_73`, keras_input_1.`Feature_74` AS `Feature_74`, keras_input_1.`Feature_75` AS `Feature_75`, keras_input_1.`Feature_76` AS `Feature_76`, keras_input_1.`Feature_77` AS `Feature_77`, keras_input_1.`Feature_78` AS `Feature_78`, keras_input_1.`Feature_79` AS `Feature_79`, keras_input_1.`Feature_80` AS `Feature_80`, keras_input_1.`Feature_81` AS `Feature_81`, keras_input_1.`Feature_82` AS `Feature_82`, keras_input_1.`Feature_83` AS `Feature_83`, keras_input_1.`Feature_84` AS `Feature_84`, keras_input_1.`Feature_85` AS `Feature_85`, keras_input_1.`Feature_86` AS `Feature_86`, keras_input_1.`Feature_87` AS `Feature_87`, keras_input_1.`Feature_88` AS `Feature_88`, keras_input_1.`Feature_89` AS `Feature_89`, keras_input_1.`Feature_90` AS `Feature_90`, keras_input_1.`Feature_91` AS `Feature_91`, keras_input_1.`Feature_92` AS `Feature_92`, keras_input_1.`Feature_93` AS `Feature_93`, keras_input_1.`Feature_94` AS `Feature_94`, keras_input_1.`Feature_95` AS `Feature_95`, keras_input_1.`Feature_96` AS `Feature_96`, keras_input_1.`Feature_97` AS `Feature_97`, keras_input_1.`Feature_98` AS `Feature_98`, keras_input_1.`Feature_99` AS `Feature_99` 
FROM keras_input_1), 
input_kernel_bias AS 
(SELECT keras_input_1_rn.rn AS rn, keras_input_1_rn.`KEY` AS `KEY`, keras_input_1_rn.`Feature_0` AS `Feature_0`, keras_input_1_rn.`Feature_1` AS `Feature_1`, keras_input_1_rn.`Feature_2` AS `Feature_2`, keras_input_1_rn.`Feature_3` AS `Feature_3`, keras_input_1_rn.`Feature_4` AS `Feature_4`, keras_input_1_rn.`Feature_5` AS `Feature_5`, keras_input_1_rn.`Feature_6` AS `Feature_6`, keras_input_1_rn.`Feature_7` AS `Feature_7`, keras_input_1_rn.`Feature_8` AS `Feature_8`, keras_input_1_rn.`Feature_9` AS `Feature_9`, keras_input_1_rn.`Feature_10` AS `Feature_10`, keras_input_1_rn.`Feature_11` AS `Feature_11`, keras_input_1_rn.`Feature_12` AS `Feature_12`, keras_input_1_rn.`Feature_13` AS `Feature_13`, keras_input_1_rn.`Feature_14` AS `Feature_14`, keras_input_1_rn.`Feature_15` AS `Feature_15`, keras_input_1_rn.`Feature_16` AS `Feature_16`, keras_input_1_rn.`Feature_17` AS `Feature_17`, keras_input_1_rn.`Feature_18` AS `Feature_18`, keras_input_1_rn.`Feature_19` AS `Feature_19`, keras_input_1_rn.`Feature_20` AS `Feature_20`, keras_input_1_rn.`Feature_21` AS `Feature_21`, keras_input_1_rn.`Feature_22` AS `Feature_22`, keras_input_1_rn.`Feature_23` AS `Feature_23`, keras_input_1_rn.`Feature_24` AS `Feature_24`, keras_input_1_rn.`Feature_25` AS `Feature_25`, keras_input_1_rn.`Feature_26` AS `Feature_26`, keras_input_1_rn.`Feature_27` AS `Feature_27`, keras_input_1_rn.`Feature_28` AS `Feature_28`, keras_input_1_rn.`Feature_29` AS `Feature_29`, keras_input_1_rn.`Feature_30` AS `Feature_30`, keras_input_1_rn.`Feature_31` AS `Feature_31`, keras_input_1_rn.`Feature_32` AS `Feature_32`, keras_input_1_rn.`Feature_33` AS `Feature_33`, keras_input_1_rn.`Feature_34` AS `Feature_34`, keras_input_1_rn.`Feature_35` AS `Feature_35`, keras_input_1_rn.`Feature_36` AS `Feature_36`, keras_input_1_rn.`Feature_37` AS `Feature_37`, keras_input_1_rn.`Feature_38` AS `Feature_38`, keras_input_1_rn.`Feature_39` AS `Feature_39`, keras_input_1_rn.`Feature_40` AS `Feature_40`, keras_input_1_rn.`Feature_41` AS `Feature_41`, keras_input_1_rn.`Feature_42` AS `Feature_42`, keras_input_1_rn.`Feature_43` AS `Feature_43`, keras_input_1_rn.`Feature_44` AS `Feature_44`, keras_input_1_rn.`Feature_45` AS `Feature_45`, keras_input_1_rn.`Feature_46` AS `Feature_46`, keras_input_1_rn.`Feature_47` AS `Feature_47`, keras_input_1_rn.`Feature_48` AS `Feature_48`, keras_input_1_rn.`Feature_49` AS `Feature_49`, keras_input_1_rn.`Feature_50` AS `Feature_50`, keras_input_1_rn.`Feature_51` AS `Feature_51`, keras_input_1_rn.`Feature_52` AS `Feature_52`, keras_input_1_rn.`Feature_53` AS `Feature_53`, keras_input_1_rn.`Feature_54` AS `Feature_54`, keras_input_1_rn.`Feature_55` AS `Feature_55`, keras_input_1_rn.`Feature_56` AS `Feature_56`, keras_input_1_rn.`Feature_57` AS `Feature_57`, keras_input_1_rn.`Feature_58` AS `Feature_58`, keras_input_1_rn.`Feature_59` AS `Feature_59`, keras_input_1_rn.`Feature_60` AS `Feature_60`, keras_input_1_rn.`Feature_61` AS `Feature_61`, keras_input_1_rn.`Feature_62` AS `Feature_62`, keras_input_1_rn.`Feature_63` AS `Feature_63`, keras_input_1_rn.`Feature_64` AS `Feature_64`, keras_input_1_rn.`Feature_65` AS `Feature_65`, keras_input_1_rn.`Feature_66` AS `Feature_66`, keras_input_1_rn.`Feature_67` AS `Feature_67`, keras_input_1_rn.`Feature_68` AS `Feature_68`, keras_input_1_rn.`Feature_69` AS `Feature_69`, keras_input_1_rn.`Feature_70` AS `Feature_70`, keras_input_1_rn.`Feature_71` AS `Feature_71`, keras_input_1_rn.`Feature_72` AS `Feature_72`, keras_input_1_rn.`Feature_73` AS `Feature_73`, keras_input_1_rn.`Feature_74` AS `Feature_74`, keras_input_1_rn.`Feature_75` AS `Feature_75`, keras_input_1_rn.`Feature_76` AS `Feature_76`, keras_input_1_rn.`Feature_77` AS `Feature_77`, keras_input_1_rn.`Feature_78` AS `Feature_78`, keras_input_1_rn.`Feature_79` AS `Feature_79`, keras_input_1_rn.`Feature_80` AS `Feature_80`, keras_input_1_rn.`Feature_81` AS `Feature_81`, keras_input_1_rn.`Feature_82` AS `Feature_82`, keras_input_1_rn.`Feature_83` AS `Feature_83`, keras_input_1_rn.`Feature_84` AS `Feature_84`, keras_input_1_rn.`Feature_85` AS `Feature_85`, keras_input_1_rn.`Feature_86` AS `Feature_86`, keras_input_1_rn.`Feature_87` AS `Feature_87`, keras_input_1_rn.`Feature_88` AS `Feature_88`, keras_input_1_rn.`Feature_89` AS `Feature_89`, keras_input_1_rn.`Feature_90` AS `Feature_90`, keras_input_1_rn.`Feature_91` AS `Feature_91`, keras_input_1_rn.`Feature_92` AS `Feature_92`, keras_input_1_rn.`Feature_93` AS `Feature_93`, keras_input_1_rn.`Feature_94` AS `Feature_94`, keras_input_1_rn.`Feature_95` AS `Feature_95`, keras_input_1_rn.`Feature_96` AS `Feature_96`, keras_input_1_rn.`Feature_97` AS `Feature_97`, keras_input_1_rn.`Feature_98` AS `Feature_98`, keras_input_1_rn.`Feature_99` AS `Feature_99`, 0.0051628292383006985 + -0.04853949049899143 * keras_input_1_rn.`Feature_0` + -0.13564737765614793 * keras_input_1_rn.`Feature_1` + -0.1865204067348039 * keras_input_1_rn.`Feature_2` + 0.11675357096359519 * keras_input_1_rn.`Feature_3` + -0.17454289798938538 * keras_input_1_rn.`Feature_4` + -0.23148473808843265 * keras_input_1_rn.`Feature_5` + 0.023869427440249155 * keras_input_1_rn.`Feature_6` + -0.23721698743693148 * keras_input_1_rn.`Feature_7` + -0.11317587512715903 * keras_input_1_rn.`Feature_8` + 0.05072350513615209 * keras_input_1_rn.`Feature_9` + -0.20035926220463535 * keras_input_1_rn.`Feature_10` + 0.08393197808396227 * keras_input_1_rn.`Feature_11` + -0.026282637875264418 * keras_input_1_rn.`Feature_12` + -0.1803615392262552 * keras_input_1_rn.`Feature_13` + -0.19694346396962434 * keras_input_1_rn.`Feature_14` + 0.033784833172420176 * keras_input_1_rn.`Feature_15` + 0.09708358332510973 * keras_input_1_rn.`Feature_16` + -0.057466318240460036 * keras_input_1_rn.`Feature_17` + 0.00031742326191018717 * keras_input_1_rn.`Feature_18` + 0.004467058162401071 * keras_input_1_rn.`Feature_19` + -0.2209919425305786 * keras_input_1_rn.`Feature_20` + 0.22442677371281788 * keras_input_1_rn.`Feature_21` + -0.18349044124904398 * keras_input_1_rn.`Feature_22` + -0.22984994924165306 * keras_input_1_rn.`Feature_23` + 0.2355517924427901 * keras_input_1_rn.`Feature_24` + 0.08239211443523013 * keras_input_1_rn.`Feature_25` + -0.13569758424152178 * keras_input_1_rn.`Feature_26` + -0.02691508887079981 * keras_input_1_rn.`Feature_27` + -0.03317436344255651 * keras_input_1_rn.`Feature_28` + -0.07990558071859778 * keras_input_1_rn.`Feature_29` + -0.16841713286798718 * keras_input_1_rn.`Feature_30` + 0.1565291063407397 * keras_input_1_rn.`Feature_31` + 0.19092215678883803 * keras_input_1_rn.`Feature_32` + 0.022968538808203393 * keras_input_1_rn.`Feature_33` + 0.12004461496162822 * keras_input_1_rn.`Feature_34` + -0.17425944879224858 * keras_input_1_rn.`Feature_35` + -0.10358695278811848 * keras_input_1_rn.`Feature_36` + 0.09749794167956678 * keras_input_1_rn.`Feature_37` + -0.10153323274589007 * keras_input_1_rn.`Feature_38` + -0.1127154579612884 * keras_input_1_rn.`Feature_39` + -0.1070789915899673 * keras_input_1_rn.`Feature_40` + 0.21298214779009494 * keras_input_1_rn.`Feature_41` + 0.18670489537210366 * keras_input_1_rn.`Feature_42` + -0.22852057434759468 * keras_input_1_rn.`Feature_43` + -0.05724610350315918 * keras_input_1_rn.`Feature_44` + -0.01924476611432899 * keras_input_1_rn.`Feature_45` + -0.13155869021683972 * keras_input_1_rn.`Feature_46` + -0.2050567438908232 * keras_input_1_rn.`Feature_47` + 0.0784208923041874 * keras_input_1_rn.`Feature_48` + -0.21347576514435337 * keras_input_1_rn.`Feature_49` + -0.1173986850085197 * keras_input_1_rn.`Feature_50` + -0.0499248403286536 * keras_input_1_rn.`Feature_51` + 0.13690581255839632 * keras_input_1_rn.`Feature_52` + -0.013986268791110335 * keras_input_1_rn.`Feature_53` + 0.006237643561941484 * keras_input_1_rn.`Feature_54` + -0.020674136954144457 * keras_input_1_rn.`Feature_55` + 0.033812806698224826 * keras_input_1_rn.`Feature_56` + 0.21979220649907477 * keras_input_1_rn.`Feature_57` + 0.10596511613974918 * keras_input_1_rn.`Feature_58` + 0.12881674976768828 * keras_input_1_rn.`Feature_59` + 0.01971755647168657 * keras_input_1_rn.`Feature_60` + 0.009284559627516783 * keras_input_1_rn.`Feature_61` + 0.07580311511447191 * keras_input_1_rn.`Feature_62` + -0.18701265406928125 * keras_input_1_rn.`Feature_63` + 0.22092769302596896 * keras_input_1_rn.`Feature_64` + 0.15943520944864692 * keras_input_1_rn.`Feature_65` + 0.06796938225382014 * keras_input_1_rn.`Feature_66` + -0.09531196358139019 * keras_input_1_rn.`Feature_67` + 0.13232517226163065 * keras_input_1_rn.`Feature_68` + -0.14280210068694993 * keras_input_1_rn.`Feature_69` + 0.059508100952171336 * keras_input_1_rn.`Feature_70` + -0.1763034198157206 * keras_input_1_rn.`Feature_71` + 0.07816715880279668 * keras_input_1_rn.`Feature_72` + 0.11299643182437809 * keras_input_1_rn.`Feature_73` + 0.2371496381192346 * keras_input_1_rn.`Feature_74` + 0.051097163600474615 * keras_input_1_rn.`Feature_75` + -0.05408321487076972 * keras_input_1_rn.`Feature_76` + 0.05554927165925618 * keras_input_1_rn.`Feature_77` + 0.06220349286204997 * keras_input_1_rn.`Feature_78` + -0.018539828555703537 * keras_input_1_rn.`Feature_79` + 0.09014154234552503 * keras_input_1_rn.`Feature_80` + -0.10193185845838719 * keras_input_1_rn.`Feature_81` + -0.19874462986233005 * keras_input_1_rn.`Feature_82` + -0.05833157755680625 * keras_input_1_rn.`Feature_83` + -0.22382911415638865 * keras_input_1_rn.`Feature_84` + 0.11820045958957248 * keras_input_1_rn.`Feature_85` + 0.1375497988732049 * keras_input_1_rn.`Feature_86` + -0.18959609877074254 * keras_input_1_rn.`Feature_87` + -0.16452953137099546 * keras_input_1_rn.`Feature_88` + -0.19679275548076305 * keras_input_1_rn.`Feature_89` + -0.03291226346368555 * keras_input_1_rn.`Feature_90` + 0.20221731006276422 * keras_input_1_rn.`Feature_91` + 0.09901484973088795 * keras_input_1_rn.`Feature_92` + 0.09459644669336051 * keras_input_1_rn.`Feature_93` + -0.016114388393977483 * keras_input_1_rn.`Feature_94` + 0.2088085384107189 * keras_input_1_rn.`Feature_95` + 0.14945947721046351 * keras_input_1_rn.`Feature_96` + 0.2439724626037867 * keras_input_1_rn.`Feature_97` + 0.11822436097902851 * keras_input_1_rn.`Feature_98` + 0.2207609722602061 * keras_input_1_rn.`Feature_99` AS dot_prod_1, -0.002760878300137765 + 0.19191147865180483 * keras_input_1_rn.`Feature_0` + -0.10485674985315264 * keras_input_1_rn.`Feature_1` + 0.11357772144076128 * keras_input_1_rn.`Feature_2` + -0.028500203487067235 * keras_input_1_rn.`Feature_3` + 0.024821608670323077 * keras_input_1_rn.`Feature_4` + -0.07929437480320475 * keras_input_1_rn.`Feature_5` + 0.19368075082596653 * keras_input_1_rn.`Feature_6` + -0.08537990728500683 * keras_input_1_rn.`Feature_7` + 0.06097014018243037 * keras_input_1_rn.`Feature_8` + 0.2492627620127118 * keras_input_1_rn.`Feature_9` + -0.13004361820510257 * keras_input_1_rn.`Feature_10` + -0.07075441553275577 * keras_input_1_rn.`Feature_11` + 0.08835897439624336 * keras_input_1_rn.`Feature_12` + 0.24313367139979322 * keras_input_1_rn.`Feature_13` + 0.1579721443094018 * keras_input_1_rn.`Feature_14` + 0.20486829050458508 * keras_input_1_rn.`Feature_15` + -0.11376321845295559 * keras_input_1_rn.`Feature_16` + 0.03538851808744199 * keras_input_1_rn.`Feature_17` + -0.02805139885596386 * keras_input_1_rn.`Feature_18` + -0.13456161941545428 * keras_input_1_rn.`Feature_19` + 0.10695706167173166 * keras_input_1_rn.`Feature_20` + -0.048486024336569025 * keras_input_1_rn.`Feature_21` + 0.05349773818035543 * keras_input_1_rn.`Feature_22` + 0.2374062378467869 * keras_input_1_rn.`Feature_23` + 0.03412713090666867 * keras_input_1_rn.`Feature_24` + 0.02085677489162525 * keras_input_1_rn.`Feature_25` + -0.02539297282175314 * keras_input_1_rn.`Feature_26` + 0.0665296910397489 * keras_input_1_rn.`Feature_27` + 0.11552950723193622 * keras_input_1_rn.`Feature_28` + 0.10925867437793343 * keras_input_1_rn.`Feature_29` + 0.18839332547932447 * keras_input_1_rn.`Feature_30` + 0.12965173912390324 * keras_input_1_rn.`Feature_31` + 0.11820668241561737 * keras_input_1_rn.`Feature_32` + 0.2320688864483226 * keras_input_1_rn.`Feature_33` + 0.18316661067635343 * keras_input_1_rn.`Feature_34` + -0.22588943402524933 * keras_input_1_rn.`Feature_35` + 0.10797195916505942 * keras_input_1_rn.`Feature_36` + 0.23028239479908785 * keras_input_1_rn.`Feature_37` + -0.22864007551983515 * keras_input_1_rn.`Feature_38` + 0.21143769547827823 * keras_input_1_rn.`Feature_39` + 0.0825244190535337 * keras_input_1_rn.`Feature_40` + -0.2474767078682429 * keras_input_1_rn.`Feature_41` + -0.09422115586569126 * keras_input_1_rn.`Feature_42` + 0.15960597362937604 * keras_input_1_rn.`Feature_43` + 0.0889145123863755 * keras_input_1_rn.`Feature_44` + -0.2207144349032661 * keras_input_1_rn.`Feature_45` + -0.18170396267688424 * keras_input_1_rn.`Feature_46` + 0.09460580852178573 * keras_input_1_rn.`Feature_47` + 0.018993132623320606 * keras_input_1_rn.`Feature_48` + -0.04445322228932383 * keras_input_1_rn.`Feature_49` + -0.04590650606517388 * keras_input_1_rn.`Feature_50` + 0.0639342206636368 * keras_input_1_rn.`Feature_51` + -0.04782935849813864 * keras_input_1_rn.`Feature_52` + 0.14178211367753216 * keras_input_1_rn.`Feature_53` + 0.20543825518912134 * keras_input_1_rn.`Feature_54` + 0.21186721698132446 * keras_input_1_rn.`Feature_55` + -0.05176058516891536 * keras_input_1_rn.`Feature_56` + -0.06565915973676645 * keras_input_1_rn.`Feature_57` + -0.023383562501651627 * keras_input_1_rn.`Feature_58` + -0.22120886455668642 * keras_input_1_rn.`Feature_59` + -0.20594670714865143 * keras_input_1_rn.`Feature_60` + -0.22144572859501158 * keras_input_1_rn.`Feature_61` + 0.010476527112547394 * keras_input_1_rn.`Feature_62` + 0.1150199450384997 * keras_input_1_rn.`Feature_63` + -0.1436955546928105 * keras_input_1_rn.`Feature_64` + 0.20949755548289264 * keras_input_1_rn.`Feature_65` + 0.21764458203555462 * keras_input_1_rn.`Feature_66` + -0.032605411752388715 * keras_input_1_rn.`Feature_67` + 0.15108138308153907 * keras_input_1_rn.`Feature_68` + 0.02488382073134702 * keras_input_1_rn.`Feature_69` + -0.17114607171637777 * keras_input_1_rn.`Feature_70` + 0.04817053185407677 * keras_input_1_rn.`Feature_71` + -0.20839834414002736 * keras_input_1_rn.`Feature_72` + -0.04773311297785155 * keras_input_1_rn.`Feature_73` + -0.1527422478835844 * keras_input_1_rn.`Feature_74` + 0.14022228427772276 * keras_input_1_rn.`Feature_75` + -0.20941953555376877 * keras_input_1_rn.`Feature_76` + 0.21131850349637274 * keras_input_1_rn.`Feature_77` + 0.08255076834604241 * keras_input_1_rn.`Feature_78` + 0.19819055325938506 * keras_input_1_rn.`Feature_79` + 0.002846387861446466 * keras_input_1_rn.`Feature_80` + 0.07351545706551134 * keras_input_1_rn.`Feature_81` + 0.021168049021858596 * keras_input_1_rn.`Feature_82` + -0.004890741258859163 * keras_input_1_rn.`Feature_83` + 0.05175063898898874 * keras_input_1_rn.`Feature_84` + 0.07686062023707307 * keras_input_1_rn.`Feature_85` + 0.019122207289276372 * keras_input_1_rn.`Feature_86` + 0.11874259584647809 * keras_input_1_rn.`Feature_87` + 0.09165461967038575 * keras_input_1_rn.`Feature_88` + 0.13768906347712717 * keras_input_1_rn.`Feature_89` + 0.03850907750758034 * keras_input_1_rn.`Feature_90` + 0.001965497911028257 * keras_input_1_rn.`Feature_91` + 0.08699809306122859 * keras_input_1_rn.`Feature_92` + 0.019874692411898785 * keras_input_1_rn.`Feature_93` + 0.10800545946065018 * keras_input_1_rn.`Feature_94` + -0.07484364787276951 * keras_input_1_rn.`Feature_95` + 0.2037035511209184 * keras_input_1_rn.`Feature_96` + 0.13234059934664308 * keras_input_1_rn.`Feature_97` + 0.16981266284930105 * keras_input_1_rn.`Feature_98` + -0.11234328202455814 * keras_input_1_rn.`Feature_99` AS dot_prod_2 
FROM keras_input_1_rn), 
rnn_cte_simple_rnn_1(rn_1, `KEY`, `PreviousState_1`, `PreviousState_2`, output_1, output_2, `State_1`, `State_2`) AS 
(SELECT input_kernel_bias.rn AS rn_1, input_kernel_bias.`KEY` AS `KEY`, CAST(0.0 AS DOUBLE) AS `PreviousState_1`, CAST(0.0 AS DOUBLE) AS `PreviousState_2`, input_kernel_bias.dot_prod_1 + 0.0 AS output_1, input_kernel_bias.dot_prod_2 + 0.0 AS output_2, input_kernel_bias.dot_prod_1 + 0.0 AS `State_1`, input_kernel_bias.dot_prod_2 + 0.0 AS `State_2` 
FROM input_kernel_bias 
WHERE input_kernel_bias.rn = 1 UNION ALL SELECT input_kernel_bias.rn AS rn, input_kernel_bias.`KEY` AS `KEY`, rnn_cte_simple_rnn_1.`State_1` AS `PreviousState_1`, rnn_cte_simple_rnn_1.`State_2` AS `PreviousState_2`, input_kernel_bias.dot_prod_1 + 0.10021264652098114 * rnn_cte_simple_rnn_1.`State_1` + 1.0219532546438501 * rnn_cte_simple_rnn_1.`State_2` AS output_1, input_kernel_bias.dot_prod_2 + 1.0190284406117285 * rnn_cte_simple_rnn_1.`State_1` + -0.15793490049272632 * rnn_cte_simple_rnn_1.`State_2` AS output_2, input_kernel_bias.dot_prod_1 + 0.10021264652098114 * rnn_cte_simple_rnn_1.`State_1` + 1.0219532546438501 * rnn_cte_simple_rnn_1.`State_2` AS `State_1`, input_kernel_bias.dot_prod_2 + 1.0190284406117285 * rnn_cte_simple_rnn_1.`State_1` + -0.15793490049272632 * rnn_cte_simple_rnn_1.`State_2` AS `State_2` 
FROM input_kernel_bias, rnn_cte_simple_rnn_1 
WHERE input_kernel_bias.rn = rnn_cte_simple_rnn_1.rn_1 + 1), 
simple_rnn_1 AS 
(SELECT rnn_cte_simple_rnn_1.`KEY` AS `KEY`, CAST(rnn_cte_simple_rnn_1.output_1 AS DOUBLE) AS output_1, CAST(rnn_cte_simple_rnn_1.output_2 AS DOUBLE) AS output_2 
FROM rnn_cte_simple_rnn_1), 
simple_rnn_1_1 AS 
(SELECT simple_rnn_1.`KEY` AS `KEY`, simple_rnn_1.output_1 AS output_1, simple_rnn_1.output_2 AS output_2 
FROM simple_rnn_1), 
layer_dense_1 AS 
(SELECT simple_rnn_1_1.`KEY` AS `KEY`, 0.005237867480826934 + 0.8586249065297957 * simple_rnn_1_1.output_1 + -0.8964240863330086 * simple_rnn_1_1.output_2 AS output_1, -0.005237867480826934 + -0.4370781845831744 * simple_rnn_1_1.output_1 + -0.8946162407997663 * simple_rnn_1_1.output_2 AS output_2 
FROM simple_rnn_1_1), 
layer_dense_1_1 AS 
(SELECT layer_dense_1.`KEY` AS `KEY`, layer_dense_1.output_1 AS output_1, layer_dense_1.output_2 AS output_2 
FROM layer_dense_1), 
score_soft_max_step1 AS 
(SELECT layer_dense_1_1.`KEY` AS `KEY`, layer_dense_1_1.output_1 AS `Score_0`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_1))) AS `exp_Score_0`, layer_dense_1_1.output_2 AS `Score_1`, exp(least(100.0, greatest(-100.0, layer_dense_1_1.output_2))) AS `exp_Score_1` 
FROM layer_dense_1_1), 
score_class_union_soft AS 
(SELECT soft_scu.`KEY` AS `KEY`, soft_scu.class AS class, soft_scu.`exp_Score` AS `exp_Score` 
FROM (SELECT score_soft_max_step1.`KEY` AS `KEY`, 0 AS class, score_soft_max_step1.`exp_Score_0` AS `exp_Score` 
FROM score_soft_max_step1 UNION ALL SELECT score_soft_max_step1.`KEY` AS `KEY`, 1 AS class, score_soft_max_step1.`exp_Score_1` AS `exp_Score` 
FROM score_soft_max_step1) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_step1.`KEY` AS `KEY`, score_soft_max_step1.`Score_0` AS `Score_0`, score_soft_max_step1.`exp_Score_0` AS `exp_Score_0`, score_soft_max_step1.`Score_1` AS `Score_1`, score_soft_max_step1.`exp_Score_1` AS `exp_Score_1`, sum_exp_t.`KEY_sum` AS `KEY_sum`, sum_exp_t.`sum_ExpScore` AS `sum_ExpScore` 
FROM score_soft_max_step1 LEFT OUTER JOIN (SELECT score_class_union_soft.`KEY` AS `KEY_sum`, sum(score_class_union_soft.`exp_Score`) AS `sum_ExpScore` 
FROM score_class_union_soft GROUP BY score_class_union_soft.`KEY`) AS sum_exp_t ON score_soft_max_step1.`KEY` = sum_exp_t.`KEY_sum`), 
layer_softmax AS 
(SELECT score_soft_max.`KEY` AS `KEY`, score_soft_max.`exp_Score_0` / score_soft_max.`sum_ExpScore` AS output_1, score_soft_max.`exp_Score_1` / score_soft_max.`sum_ExpScore` AS output_2 
FROM score_soft_max), 
orig_cte AS 
(SELECT layer_softmax.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, layer_softmax.output_1 AS `Proba_0`, layer_softmax.output_2 AS `Proba_1`, NULL AS `LogProba_0`, NULL AS `LogProba_1`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM layer_softmax), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 0 AS class, orig_cte.`LogProba_0` AS `LogProba`, orig_cte.`Proba_0` AS `Proba`, orig_cte.`Score_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 1 AS class, orig_cte.`LogProba_1` AS `LogProba`, orig_cte.`Proba_1` AS `Proba`, orig_cte.`Score_1` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_0` AS `Score_0`, orig_cte.`Score_1` AS `Score_1`, orig_cte.`Proba_0` AS `Proba_0`, orig_cte.`Proba_1` AS `Proba_1`, orig_cte.`LogProba_0` AS `LogProba_0`, orig_cte.`LogProba_1` AS `LogProba_1`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Proba` AS `max_Proba` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Proba`) AS `max_Proba` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba` 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.`KEY_u` = score_max.`KEY`), 
arg_max_cte AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba`, `arg_max_t_Proba`.`KEY_Proba` AS `KEY_Proba`, `arg_max_t_Proba`.`arg_max_Proba` AS `arg_max_Proba` 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Proba`, max(union_with_max.class) AS `arg_max_Proba` 
FROM union_with_max 
WHERE union_with_max.`max_Proba` <= union_with_max.`Proba` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Proba` ON score_max.`KEY` = `arg_max_t_Proba`.`KEY_Proba`)
 SELECT arg_max_cte.`KEY` AS `KEY`, arg_max_cte.`Score_0` AS `Score_0`, arg_max_cte.`Score_1` AS `Score_1`, arg_max_cte.`Proba_0` AS `Proba_0`, arg_max_cte.`Proba_1` AS `Proba_1`, CASE WHEN (arg_max_cte.`Proba_0` IS NULL OR arg_max_cte.`Proba_0` > 0.0) THEN ln(arg_max_cte.`Proba_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (arg_max_cte.`Proba_1` IS NULL OR arg_max_cte.`Proba_1` > 0.0) THEN ln(arg_max_cte.`Proba_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, arg_max_cte.`arg_max_Proba` AS `Decision`, arg_max_cte.`max_Proba` AS `DecisionProba` 
FROM arg_max_cte