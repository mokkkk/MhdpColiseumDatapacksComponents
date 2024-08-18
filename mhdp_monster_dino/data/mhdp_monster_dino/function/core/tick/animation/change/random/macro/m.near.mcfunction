#> mhdp_monster_dino:core/tick/animation/change/random/m.near
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/random/main

# {BreathBack:0,BreathMove:0,Bite:3,BiteDouble:2,Tail:4,TailSide:3,TailBack:0,TailFlame:2,Round:1,Step:2}

$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BreathBack),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BreathMove),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Bite),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BiteDouble),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:4,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Tail),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:5,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailSide),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:6,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailBack),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:7,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailFlame),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:8,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Round),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:9,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Step),"functions":[{"function":"minecraft:set_custom_data","tag":"{Id:10,IsRandomTemp:1b}"}]}\
            ]}\
        ]\
    }
