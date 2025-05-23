#> mhdp_monster_dino:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_dino:core/tick/tick

# 待機
    execute if entity @s[tag=aj.dino_aj.animation.idle.playing] run function mhdp_monster_dino:core/tick/animation/event/idle/main

# 警戒
    execute if entity @s[tag=aj.dino_aj.animation.search.playing] run function mhdp_monster_dino:core/tick/animation/event/search/main

# 咆哮
    execute if entity @s[tag=aj.dino_aj.animation.voice.playing] run function mhdp_monster_dino:core/tick/animation/event/voice/main
    execute if entity @s[tag=aj.dino_aj.animation.anger.playing] run function mhdp_monster_dino:core/tick/animation/event/anger/main

# 軸合わせ
    execute if entity @s[tag=aj.dino_aj.animation.turn_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_r/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_big_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_big_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_big_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_big_r/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_bite_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_bite_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_bite_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_bite_r/main

# 怯み
    execute if entity @s[tag=aj.dino_aj.animation.damage_head.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_head/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_head_heat.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_head_heat/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_tail_forward.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_tail_forward/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_tail_back.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_tail_back/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_tail_break.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_tail_break/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_right.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_right/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_left.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_left/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_down_right.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_down_right/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_down_left.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_down_left/main
    execute if entity @s[tag=aj.dino_aj.animation.down_right.playing] run function mhdp_monster_dino:core/tick/animation/event/down_right/main
    execute if entity @s[tag=aj.dino_aj.animation.down_left.playing] run function mhdp_monster_dino:core/tick/animation/event/down_left/main
    execute if entity @s[tag=aj.dino_aj.animation.down_end_right.playing] run function mhdp_monster_dino:core/tick/animation/event/down_end_right/main
    execute if entity @s[tag=aj.dino_aj.animation.down_end_left.playing] run function mhdp_monster_dino:core/tick/animation/event/down_end_left/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_flying.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_flying/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter_head_start.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_head_start/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter_tail_right_start.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_tail_right_start/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter_tail_left_start.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_tail_left_start/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter_mirror.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_mirror/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter_end.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_end/main
    execute if entity @s[tag=aj.dino_aj.animation.damage_counter_end_mirror.playing] run function mhdp_monster_dino:core/tick/animation/event/damage_counter_end_mirror/main

# 状態異常
    # 麻痺
        execute if entity @s[tag=aj.dino_aj.animation.state_paralysis_start.playing] run function mhdp_monster_dino:core/tick/animation/event/state_paralysis_start/main
        execute if entity @s[tag=aj.dino_aj.animation.state_paralysis.playing] run function mhdp_monster_dino:core/tick/animation/event/state_paralysis/main
        execute if entity @s[tag=aj.dino_aj.animation.state_paralysis_end.playing] run function mhdp_monster_dino:core/tick/animation/event/state_paralysis_end/main

# 討伐
    execute if entity @s[tag=aj.dino_aj.animation.death.playing] run function mhdp_monster_dino:core/tick/animation/event/death/main
    execute if entity @s[tag=aj.dino_aj.animation.death_flying.playing] run function mhdp_monster_dino:core/tick/animation/event/death_flying/main

# 移動
    execute if entity @s[tag=aj.dino_aj.animation.move.playing] run function mhdp_monster_dino:core/tick/animation/event/move/main

# 車庫入れ
    execute if entity @s[tag=aj.dino_aj.animation.move_back.playing] run function mhdp_monster_dino:core/tick/animation/event/move_back/main

# サイドステップ
    execute if entity @s[tag=aj.dino_aj.animation.step_side_r.playing] run function mhdp_monster_dino:core/tick/animation/event/step_side_r/main
    execute if entity @s[tag=aj.dino_aj.animation.step_side_l.playing] run function mhdp_monster_dino:core/tick/animation/event/step_side_l/main

# ブレス
    execute if entity @s[tag=aj.dino_aj.animation.breath.playing] run function mhdp_monster_dino:core/tick/animation/event/breath/main

# 3連ブレス
    execute if entity @s[tag=aj.dino_aj.animation.breath_triple.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_triple/main

# バックジャンプブレス
    execute if entity @s[tag=aj.dino_aj.animation.breath_backstep.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/main

# 移動ブレス
    execute if entity @s[tag=aj.dino_aj.animation.breath_move_r.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_move_r/main
    execute if entity @s[tag=aj.dino_aj.animation.breath_move_l.playing] run function mhdp_monster_dino:core/tick/animation/event/breath_move_l/main

# 嚙みつき
    execute if entity @s[tag=aj.dino_aj.animation.bite.playing] run function mhdp_monster_dino:core/tick/animation/event/bite/main
    # 噛みつき→尻尾コンボ
        execute if entity @s[tag=aj.dino_aj.animation.bite_to_tail.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/main

# 2連嚙みつき
    execute if entity @s[tag=aj.dino_aj.animation.bite_double_normal.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/main
    execute if entity @s[tag=aj.dino_aj.animation.bite_double_anger.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/main

# 尻尾攻撃
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_l/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_anger_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_anger_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/main
    # 尻尾攻撃→ステップコンボ
        execute if entity @s[tag=aj.dino_aj.animation.tail_attack_r_to_step_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/main
        execute if entity @s[tag=aj.dino_aj.animation.tail_attack_l_to_step_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_l_to_step_l/main

# 尻尾攻撃・側面
    execute if entity @s[tag=aj.dino_aj.animation.tail_side_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_side_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/main

# 尻尾攻撃・背面
    execute if entity @s[tag=aj.dino_aj.animation.tail_back_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_back_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_back_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/main

# 尻尾攻撃・飛びかかり
    execute if entity @s[tag=aj.dino_aj.animation.jump_tail_r.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/main
    execute if entity @s[tag=aj.dino_aj.animation.jump_tail_l.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_l/main
    execute if entity @s[tag=aj.dino_aj.animation.jump_tail_anger_r.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/main
    execute if entity @s[tag=aj.dino_aj.animation.jump_tail_anger_l.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/main

# 火炎
    execute if entity @s[tag=aj.dino_aj.animation.tail_flame_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_flame_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_flame_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/main

# 大回転斬り
    execute if entity @s[tag=aj.dino_aj.animation.roundforce.playing] run function mhdp_monster_dino:core/tick/animation/event/roundforce/main

# 研ぎ
    execute if entity @s[tag=aj.dino_aj.animation.polish.playing] run function mhdp_monster_dino:core/tick/animation/event/polish/main
