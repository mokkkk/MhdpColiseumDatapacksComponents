#> mhdp_monster_ranposu:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_ranposu:core/tick/tick

## 非発見時

# 待機
    execute if entity @s[tag=animated_java.ranposu.animation.idle_relax.playing] run function mhdp_monster_ranposu:core/tick/animation/event/idle_relax/main
# 移動
    execute if entity @s[tag=animated_java.ranposu.animation.walk_relax.playing] run function mhdp_monster_ranposu:core/tick/animation/event/walk_relax/main
# 生態行動
    execute if entity @s[tag=animated_java.ranposu.animation.ecology_relax.playing] run function mhdp_monster_ranposu:core/tick/animation/event/ecology_relax/main

## 警戒時

# 警戒
    execute if entity @s[tag=animated_java.ranposu.animation.search.playing] run function mhdp_monster_ranposu:core/tick/animation/event/search/main

## 戦闘時

# 待機
    execute if entity @s[tag=animated_java.ranposu.animation.idle.playing] run function mhdp_monster_ranposu:core/tick/animation/event/idle/main

# 咆哮
    execute if entity @s[tag=animated_java.ranposu.animation.voice.playing] run function mhdp_monster_ranposu:core/tick/animation/event/voice/main

# 軸合わせ
    execute if entity @s[tag=animated_java.ranposu.animation.turn_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_right/main
    execute if entity @s[tag=animated_java.ranposu.animation.turn_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_left/main

# # 怯み
#     # 通常
#         execute if entity @s[tag=animated_java.ranposu.animation.damage.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage/main
#     # 大怯み
#         execute if entity @s[tag=animated_java.ranposu.animation.damage_down.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_down/main
#     # 空中
#         execute if entity @s[tag=animated_java.ranposu.animation.damage_flying.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_flying/main
#     # ダウン
#         execute if entity @s[tag=animated_java.ranposu.animation.down.playing] run function mhdp_monster_ranposu:core/tick/animation/event/down/main
#         execute if entity @s[tag=animated_java.ranposu.animation.down_end.playing] run function mhdp_monster_ranposu:core/tick/animation/event/down_end/main
#     # 怒り
#         execute if entity @s[tag=animated_java.ranposu.animation.anger.playing] run function mhdp_monster_ranposu:core/tick/animation/event/anger/main
#     # 麻痺
#         execute if entity @s[tag=animated_java.ranposu.animation.state_paralysis_start.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_start/main
#         execute if entity @s[tag=animated_java.ranposu.animation.state_paralysis.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis/main
#         execute if entity @s[tag=animated_java.ranposu.animation.state_paralysis_end.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_end/main
#     # スタン
#         execute if entity @s[tag=animated_java.ranposu.animation.state_stun.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_stun/main
#         execute if entity @s[tag=animated_java.ranposu.animation.state_stun_end.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_stun_end/main
#     # 相殺
#         execute if entity @s[tag=animated_java.ranposu.animation.damage_counter_start.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_counter_start/main
#         execute if entity @s[tag=animated_java.ranposu.animation.damage_counter.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_counter/main
#         execute if entity @s[tag=animated_java.ranposu.animation.damage_counter_end.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_counter_end/main
    # 建築物攻撃時の怯み
        execute if entity @s[tag=animated_java.ranposu.animation.interrupt_object.playing] run function mhdp_monster_ranposu:core/tick/animation/event/interrupt_object/main

# # 討伐
#     # 通常
#         execute if entity @s[tag=animated_java.ranposu.animation.death.playing] run function mhdp_monster_ranposu:core/tick/animation/event/death/main
#     # 空中
#         execute if entity @s[tag=animated_java.ranposu.animation.death_flying.playing] run function mhdp_monster_ranposu:core/tick/animation/event/death_flying/main

# 移動
    execute if entity @s[tag=animated_java.ranposu.animation.move.playing] run function mhdp_monster_ranposu:core/tick/animation/event/move/main

# 建築物の上に乗る
    execute if entity @s[tag=animated_java.ranposu.animation.climb_object.playing] run function mhdp_monster_ranposu:core/tick/animation/event/climb_object/main

# # バックステップ
#     execute if entity @s[tag=animated_java.ranposu.animation.step_back.playing] run function mhdp_monster_ranposu:core/tick/animation/event/step_back/main

# 噛みつき
    execute if entity @s[tag=animated_java.ranposu.animation.bite.playing] run function mhdp_monster_ranposu:core/tick/animation/event/bite/main

# 強嚙みつき
    execute if entity @s[tag=animated_java.ranposu.animation.bite_strong.playing] run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/main

# # 尻尾攻撃
#     execute if entity @s[tag=animated_java.ranposu.animation.tail_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/tail_right/main
#     execute if entity @s[tag=animated_java.ranposu.animation.tail_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/tail_left/main

# # 移動ひっかき
#     execute if entity @s[tag=animated_java.ranposu.animation.move_claw.playing] run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/main

# # タックル
#     execute if entity @s[tag=animated_java.ranposu.animation.tackle.playing] run function mhdp_monster_ranposu:core/tick/animation/event/tackle/main

# 急襲
    execute if entity @s[tag=animated_java.ranposu.animation.jump.playing] run function mhdp_monster_ranposu:core/tick/animation/event/jump/main

# # 回り込み急襲
#     execute if entity @s[tag=animated_java.ranposu.animation.step_jump_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_right/main
#     execute if entity @s[tag=animated_java.ranposu.animation.step_jump_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/main
