#> mhdp_monster_reus:core/tick/animation/change/random/m.far
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/random/main

$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(FlyMove),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(FlyBite),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(FlyMoveBreath),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(FlyFlameSweep),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:4,IsRandomTemp:1b}"}]}\
            ]}\
        ]\
    }
