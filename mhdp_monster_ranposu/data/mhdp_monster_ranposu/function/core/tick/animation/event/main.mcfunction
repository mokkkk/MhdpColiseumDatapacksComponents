#> mhdp_monster_ranposu:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_ranposu:core/tick/tick

# 待機
    execute if entity @s[tag=aj.ranposu_aj.animation.idle.playing] run function mhdp_monster_ranposu:core/tick/animation/event/idle/main

# 軸合わせ
    execute if entity @s[tag=aj.ranposu_aj.animation.turn_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_right/main
    execute if entity @s[tag=aj.ranposu_aj.animation.turn_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_left/main

# 咆哮
    execute if entity @s[tag=aj.ranposu_aj.animation.voice.playing] run function mhdp_monster_ranposu:core/tick/animation/event/voice/main

# 噛みつき
    execute if entity @s[tag=aj.ranposu_aj.animation.bite.playing] run function mhdp_monster_ranposu:core/tick/animation/event/bite/main

# 強嚙みつき
    execute if entity @s[tag=aj.ranposu_aj.animation.bite_strong.playing] run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/main

# 尻尾攻撃
    execute if entity @s[tag=aj.ranposu_aj.animation.tail_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/tail_right/main
    execute if entity @s[tag=aj.ranposu_aj.animation.tail_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/tail_left/main

# 移動ひっかき
    execute if entity @s[tag=aj.ranposu_aj.animation.move_claw.playing] run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/main

# タックル
    execute if entity @s[tag=aj.ranposu_aj.animation.tackle.playing] run function mhdp_monster_ranposu:core/tick/animation/event/tackle/main

# 急襲
    execute if entity @s[tag=aj.ranposu_aj.animation.jump.playing] run function mhdp_monster_ranposu:core/tick/animation/event/jump/main

# 回り込み急襲
    execute if entity @s[tag=aj.ranposu_aj.animation.step_jump_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_right/main
    execute if entity @s[tag=aj.ranposu_aj.animation.step_jump_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/main
