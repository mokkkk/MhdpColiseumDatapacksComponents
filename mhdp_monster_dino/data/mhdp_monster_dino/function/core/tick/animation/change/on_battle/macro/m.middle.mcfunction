#> mhdp_monster_ranposu:core/tick/animation/change/random/m.near
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

# {Breath:0,BreathTriple:0,BreathMove:0,MoveBite:3,MoveTail:2,TailJump:2,TailFlame:2,Round:1,Step:2}

$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Breath),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BreathTriple),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BreathMove),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(MoveBite),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:4,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(MoveTail),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:5,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailJump),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:6,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(TailFlame),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:7,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Round),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:8,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(Step),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:9,IsRandomTemp:1b}"}]}\
            ]}\
        ]\
    }

return 1