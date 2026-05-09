#> mhdp_monster_ranposu:core/tick/animation/change/random/m.near
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Move),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Jump),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(StepJump),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]}\
            ]}\
        ]\
    }
