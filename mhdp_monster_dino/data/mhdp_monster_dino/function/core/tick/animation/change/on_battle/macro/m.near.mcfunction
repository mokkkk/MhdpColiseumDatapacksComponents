#> mhdp_monster_ranposu:core/tick/animation/change/on_battle/m.near
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

# {BreathBack:0,MoveBreath:0,Bite:4,MoveBack:1,Tail:3,TailSide:3,TailBack:0,TailFlame:2,Round:2,Step:2}

$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BreathBack),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(MoveBreath),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Bite),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(MoveBack),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:4,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Tail),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:5,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailSide),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:6,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailBack),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:7,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailFlame),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:8,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Round),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:9,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Step),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:10,IsRandomTemp:1b}"}]}\
            ]}\
        ]\
    }

return 1