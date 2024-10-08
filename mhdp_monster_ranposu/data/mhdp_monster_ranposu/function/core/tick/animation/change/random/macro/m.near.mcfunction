#> mhdp_monster_ranposu:core/tick/animation/change/random/m.near
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Bite),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BiteStrong),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Tail),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(MoveClaw),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:4,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Tackle),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:5,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BackStep),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:6,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(StepJump),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:7,IsRandomTemp:1b}"}]}\
            ]}\
        ]\
    }
