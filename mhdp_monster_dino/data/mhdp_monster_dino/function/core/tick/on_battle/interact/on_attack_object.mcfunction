#> mhdp_monster_ranposu:core/tick/on_battle/interact/on_attack_object
#
# tick処理 戦闘中 建築物を攻撃した
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# オブジェクト発射時の処理
    # 火炎
        execute if entity @s[tag=Mns.Dino.Object.Flame] if data storage api: Return{IsRemainObject:true} as @n[type=item_display,tag=Asset.Object,tag=This] run function assets:object/10031.dino_tail_flame/tick/on_hit_object

# 建築を破壊できなかった場合、攻撃キャンセル
    execute unless entity @s[\
        tag=!animated_java_ranposu.ranposu.animation.bite_strong.playing,\
        tag=!animated_java_ranposu.ranposu.animation.move_claw.playing\
    ] if data storage api: Return{IsRemainObject:true} run function mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/cancel_attack
    execute unless entity @s[\
        tag=!animated_java_ranposu.ranposu.animation.tackle.playing\
    ] if data storage api: Return{IsRemainObject:true} run function mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/cancel_attack_tackle

# temp
    # say 建築殴った
    # execute if data storage api: Return{IsWall:true} run say 壁を殴った
    # execute if data storage api: Return{IsRemainObject:true} run say こわせませんでした
