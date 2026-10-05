#> mhdp_monster_valk:core/tick/animation/change/on_battle/macro/m.move
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/on_battle/main


$loot spawn ~ ~10 ~ loot {\
    "pools":[\
            {"rolls":1,"entries":[\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(MoveBack),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:1,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(JetTackle),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:2,IsRandomTemp:1b}"}]},\
                {"type":"minecraft:item","name":"minecraft:paper","weight":$(BombForward),"modifier":[{"type":"minecraft:set_custom_data","tag":"{Id:3,IsRandomTemp:1b}"}]}\
        ]}\
    ]\
}

return 1
