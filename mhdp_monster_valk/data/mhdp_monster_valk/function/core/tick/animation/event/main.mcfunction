#> mhdp_monster_valk:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_valk:core/tick/main

## 非発見時・警戒時共通

# 待機
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_idle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_idle/main

## 彗龍形態

# 2連突き
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_r_to_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/main
# 翼槍回転斬り
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/main
# 翼槍叩きつけ
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_r_to_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/main
# 振りむき翼槍叩きつけ
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/main
# 翼槍突き上げ
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_upper_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_upper_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/main
# 嚙みつき
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_bite.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_bite/main
# 突進(体当たり)
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_dashattack.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/main
# 蛇行突進
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_tackle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/main
# 移動
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_move.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_move/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_move_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_move_start/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_moveback.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_moveback/main
# 軸合わせ (旋回)
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_r/main
# 警戒
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_search.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_search/main
# 咆哮
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_voice.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_voice/main
# 滑空突進
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_flytackle_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_flytackle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_flytackle_repeat.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_flytackle_end.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/main

## 怯み

# 怯み・部位別
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_head.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_head/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_tail.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_tail/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_tail_break.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_tail_break/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_body_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_body_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_body_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_body_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_wing_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_wing_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_wing_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_wing_r/main
# 怯み・ダウン
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_down_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_down_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_down_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_down_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_down_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_down_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_down_end_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_end_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_down_end_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_end_r/main
# 飛行中怯み
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_flying.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_flying/main
# 怯み・反撃硬直
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter_head_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_head_start/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter_wing_l_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_wing_l_start/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter_wing_r_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_wing_r_start/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter_mirror.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_mirror/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter_end.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_counter_end_mirror.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end_mirror/main
