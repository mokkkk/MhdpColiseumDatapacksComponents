#> mhdp_monster_ranposu:core/tick/on_battle/interact/on_attack_object
#
# tick処理 戦闘中 建築物を攻撃した
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 建築を破壊できなかった場合、攻撃キャンセル
    execute unless entity @s[\
        tag=!animated_java.ranposu.animation.bite_strong.playing,\
        tag=!animated_java.ranposu.animation.move_claw.playing\
    ] if data storage api: Return{IsRemainObject:true} run function mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/cancel_attack
    execute unless entity @s[\
        tag=!animated_java.ranposu.animation.tackle.playing\
    ] if data storage api: Return{IsRemainObject:true} run function mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/cancel_attack_tackle

# temp
    # say 建築殴った
    # execute if data storage api: Return{IsWall:true} run say 壁を殴った
    # execute if data storage api: Return{IsRemainObject:true} run say こわせませんでした
