#> mhdp_monster_ranposu:core/tick/on_battle/interact/on_search_object
#
# tick処理 戦闘中 サーチ中、建築物を発見した
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 移動中
    execute unless entity @s[\
        tag=!animated_java_ranposu.ranposu.animation.move.playing\
    ] run function mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/climb_object

# サーチ終了
    tag @s remove Mns.State.IsSearchObject
