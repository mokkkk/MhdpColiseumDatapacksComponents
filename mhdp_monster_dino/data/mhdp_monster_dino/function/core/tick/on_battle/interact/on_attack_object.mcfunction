#> mhdp_monster_dino:core/tick/on_battle/interact/on_attack_object
#
# tick処理 戦闘中 建築物を攻撃した
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# オブジェクトの処理
    # 火炎
        execute if entity @s[tag=Mns.Dino.Object.Flame] if data storage api: Return{IsRemainObject:true} as @n[type=item_display,tag=Asset.Object,tag=This] run function assets:object/10031.dino_tail_flame/tick/on_hit_object

# 攻撃キャンセル
    # 尻尾攻撃
        execute unless entity @s[\
            tag=!animated_java_dino.dino.animation.tail_attack_r.playing,\
            tag=!animated_java_dino.dino.animation.tail_attack_l.playing,\
            tag=!animated_java_dino.dino.animation.tail_attack_anger_r.playing,\
            tag=!animated_java_dino.dino.animation.tail_attack_anger_l.playing,\
            tag=!animated_java_dino.dino.animation.tail_attack_r_to_step_r.playing,\
            tag=!animated_java_dino.dino.animation.tail_attack_l_to_step_l.playing,\
            tag=!animated_java_dino.dino.animation.tail_side_rtail_side_r.playing,\
            tag=!animated_java_dino.dino.animation.tail_side_rtail_side_l.playing,\
            tag=!animated_java_dino.dino.animation.tail_back_r.playing,\
            tag=!animated_java_dino.dino.animation.tail_back_l.playing,\
            tag=!animated_java_dino.dino.animation.step_l_to_jumptail_r.playing,\
            tag=!animated_java_dino.dino.animation.step_r_to_jumptail_l.playing,\
            tag=!animated_java_dino.dino.animation.jump_tail_r.playing,\
            tag=!animated_java_dino.dino.animation.jump_tail_l.playing,\
            tag=!animated_java_dino.dino.animation.jump_tail_anger_r.playing,\
            tag=!animated_java_dino.dino.animation.jump_tail_anger_l.playing,\
            tag=!animated_java_dino.dino.animation.tail_flame_r.playing,\
            tag=!animated_java_dino.dino.animation.tail_flame_l.playing\
        ] run function mhdp_monster_dino:core/tick/on_battle/interact/reaction/cancel_attack_tail
    # 大回転
        execute unless entity @s[\
            tag=!animated_java_dino.dino.animation.roundforce.playing\
        ] run function mhdp_monster_dino:core/tick/on_battle/interact/reaction/cancel_attack_round

# temp
    # say 建築殴った
    # execute if data storage api: Return{IsWall:true} run say 壁を殴った
    # execute if data storage api: Return{IsRemainObject:true} run say こわせませんでした
