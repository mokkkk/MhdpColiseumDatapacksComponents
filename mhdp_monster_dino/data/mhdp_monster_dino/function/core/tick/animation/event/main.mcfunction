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

# # 移動
#     execute if entity @s[tag=animated_java_dino.dino.animation.move.playing] run function mhdp_monster_dino:core/tick/animation/event/move/main

# 尻尾たたきつけ
    execute if entity @s[tag=animated_java_dino.dino.animation.tail_attack_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/main