#> mhdp_monster_dino:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_dino:core/tick/tick

## 非発見時

# 待機
    execute if entity @s[tag=animated_java_dino.dino.animation.idle_relax.playing] run function mhdp_monster_dino:core/tick/animation/event/idle_relax/main
# 移動
    execute if entity @s[tag=animated_java_dino.dino.animation.walk_relax.playing] run function mhdp_monster_dino:core/tick/animation/event/walk_relax/main
    execute if entity @s[tag=animated_java_dino.dino.animation.walk_relax_stop.playing] run function mhdp_monster_dino:core/tick/animation/event/walk_relax_stop/main
# 生態行動
    execute if entity @s[tag=animated_java_dino.dino.animation.ecology_relax_short.playing] run function mhdp_monster_dino:core/tick/animation/event/ecology_relax_short/main
    execute if entity @s[tag=animated_java_dino.dino.animation.ecology_relax_long.playing] run function mhdp_monster_dino:core/tick/animation/event/ecology_relax_long/main

## 警戒時

# 警戒
    execute if entity @s[tag=animated_java_dino.dino.animation.search.playing] run function mhdp_monster_dino:core/tick/animation/event/search/main

# ## 戦闘時

# 待機
    execute if entity @s[tag=animated_java_dino.dino.animation.idle.playing] run function mhdp_monster_dino:core/tick/animation/event/idle/main

# # 咆哮
#     execute if entity @s[tag=animated_java_dino.dino.animation.voice.playing] run function mhdp_monster_dino:core/tick/animation/event/voice/main

# # 軸合わせ
#     execute if entity @s[tag=animated_java_dino.dino.animation.turn_right.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_right/main
#     execute if entity @s[tag=animated_java_dino.dino.animation.turn_left.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_left/main

# # 怯み
#     # 通常
#         execute if entity @s[tag=animated_java_dino.dino.animation.damage.playing] run function mhdp_monster_dino:core/tick/animation/event/damage/main
#     # 大怯み
#         execute if entity @s[tag=animated_java_dino.dino.animation.damage_down.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_down/main
#     # 空中
#         execute if entity @s[tag=animated_java_dino.dino.animation.damage_flying.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_flying/main
#     # ダウン
#         execute if entity @s[tag=animated_java_dino.dino.animation.down.playing] run function mhdp_monster_dino:core/tick/animation/event/down/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.down_end.playing] run function mhdp_monster_dino:core/tick/animation/event/down_end/main
#     # 怒り
#         execute if entity @s[tag=animated_java_dino.dino.animation.anger.playing] run function mhdp_monster_dino:core/tick/animation/event/anger/main
#     # 麻痺
#         execute if entity @s[tag=animated_java_dino.dino.animation.state_paralysis_start.playing] run function mhdp_monster_dino:core/tick/animation/event/state_paralysis_start/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.state_paralysis.playing] run function mhdp_monster_dino:core/tick/animation/event/state_paralysis/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.state_paralysis_end.playing] run function mhdp_monster_dino:core/tick/animation/event/state_paralysis_end/main
#     # スタン
#         execute if entity @s[tag=animated_java_dino.dino.animation.state_stun.playing] run function mhdp_monster_dino:core/tick/animation/event/state_stun/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.state_stun_end.playing] run function mhdp_monster_dino:core/tick/animation/event/state_stun_end/main
#     # 相殺
#         execute if entity @s[tag=animated_java_dino.dino.animation.damage_counter_start.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_start/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.damage_counter.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.damage_counter_end.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_end/main
#     # 建築物攻撃時の怯み
#         execute if entity @s[tag=animated_java_dino.dino.animation.interrupt_object.playing] run function mhdp_monster_dino:core/tick/animation/event/interrupt_object/main
#         execute if entity @s[tag=animated_java_dino.dino.animation.interrupt_object_tackle.playing] run function mhdp_monster_dino:core/tick/animation/event/interrupt_object_tackle/main

# # 討伐
#     # 通常
#         execute if entity @s[tag=animated_java_dino.dino.animation.death.playing] run function mhdp_monster_dino:core/tick/animation/event/death/main
#     # 空中
#         execute if entity @s[tag=animated_java_dino.dino.animation.death_flying.playing] run function mhdp_monster_dino:core/tick/animation/event/death_flying/main

# 移動
    # execute if entity @s[tag=animated_java_dino.dino.animation.move.playing] run function mhdp_monster_dino:core/tick/animation/event/move/main

# 車庫入れ
    # execute if entity @s[tag=animated_java_dino.dino.animation.move_back.playing] run function mhdp_monster_dino:core/tick/animation/event/move_back/main

# サイドステップ
    # execute if entity @s[tag=animated_java_dino.dino.animation.step_side_r.playing] run function mhdp_monster_dino:core/tick/animation/event/step_side_r/main
    # execute if entity @s[tag=animated_java_dino.dino.animation.step_side_l.playing] run function mhdp_monster_dino:core/tick/animation/event/step_side_l/main

# ブレス
    # execute if entity @s[tag=animated_java_dino.dino.animation.breath.playing] run function mhdp_monster_dino:core/tick/animation/event/breath/main

# 3連ブレス
    # execute if entity @s[tag=animated_java_dino.dino.animation.breath_triple.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_triple/main

# バックジャンプブレス
    # execute if entity @s[tag=animated_java_dino.dino.animation.breath_backstep.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/main

# 移動ブレス
    # execute if entity @s[tag=animated_java_dino.dino.animation.breath_move_r.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_move_r/main
    # execute if entity @s[tag=animated_java_dino.dino.animation.breath_move_l.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_move_l/main

# 嚙みつき
    execute if entity @s[tag=animated_java_dino.dino.animation.bite.playing] run function mhdp_monster_dino:core/tick/animation/event/bite/main
    # 噛みつき→尻尾コンボ
        # execute if entity @s[tag=animated_java_dino.dino.animation.bite_to_tail.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/main

# 2連嚙みつき
    # execute if entity @s[tag=animated_java_dino.dino.animation.bite_double_normal.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/main
    # execute if entity @s[tag=animated_java_dino.dino.animation.bite_double_anger.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/main

# 尻尾たたきつけ
    # 通常時
        execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/main
        execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_l/main
    # 怒り時
        # execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_anger_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_r/main
        # execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_anger_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/main
    # 尻尾攻撃→ステップコンボ
        # execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_r_to_step_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/main
        # execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_l_to_step_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_l_to_step_l/main

# 尻尾攻撃・側面
    # execute if entity @s[tag=animated_java_dino.dino.animation.tail_side_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/main
    # execute if entity @s[tag=animated_java_dino.dino.animation.tail_side_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/main

# 尻尾攻撃・背面
    # execute if entity @s[tag=animated_java_dino.dino.animation.tail_back_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_back_r/main
    # execute if entity @s[tag=animated_java_dino.dino.animation.tail_back_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/main

# 尻尾攻撃・飛びかかり
    # 通常時
        # execute if entity @s[tag=animated_java_dino.dino.animation.jump_tail_r.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/main
        # execute if entity @s[tag=animated_java_dino.dino.animation.jump_tail_l.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_l/main
    # 怒り時2回攻撃
        # execute if entity @s[tag=animated_java_dino.dino.animation.jump_tail_anger_r.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/main
        # execute if entity @s[tag=animated_java_dino.dino.animation.jump_tail_anger_l.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/main

# 火炎
    # execute if entity @s[tag=animated_java_dino.dino.animation.tail_flame_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_flame_r/main
    # execute if entity @s[tag=animated_java_dino.dino.animation.tail_flame_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/main

# 大回転斬り
    # execute if entity @s[tag=animated_java_dino.dino.animation.roundforce.playing] run function mhdp_monster_dino:core/tick/animation/event/roundforce/main

# 研ぎ
    # execute if entity @s[tag=animated_java_dino.dino.animation.polish.playing] run function mhdp_monster_dino:core/tick/animation/event/polish/main
