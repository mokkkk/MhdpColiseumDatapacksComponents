#> mhdp_monster_ranposu:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_ranposu:core/tick/tick

# 待機
    execute if entity @s[tag=aj.ranposu_aj.animation.idle.playing] run function mhdp_monster_ranposu:core/tick/animation/event/idle/main

# 警戒中
    execute if entity @s[tag=aj.ranposu_aj.animation.search.playing] run function mhdp_monster_ranposu:core/tick/animation/event/search/main

# 軸合わせ
    execute if entity @s[tag=aj.ranposu_aj.animation.turn_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_right/main
    execute if entity @s[tag=aj.ranposu_aj.animation.turn_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_left/main

# 怯み
    # 通常
        execute if entity @s[tag=aj.ranposu_aj.animation.damage.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage/main
    # 大怯み
        execute if entity @s[tag=aj.ranposu_aj.animation.damage_down.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_down/main
    # 空中
        execute if entity @s[tag=aj.ranposu_aj.animation.damage_flying.playing] run function mhdp_monster_ranposu:core/tick/animation/event/damage_flying/main
    # ダウン
        execute if entity @s[tag=aj.ranposu_aj.animation.down.playing] run function mhdp_monster_ranposu:core/tick/animation/event/down/main
        execute if entity @s[tag=aj.ranposu_aj.animation.down_end.playing] run function mhdp_monster_ranposu:core/tick/animation/event/down_end/main
    # 怒り
        execute if entity @s[tag=aj.ranposu_aj.animation.anger.playing] run function mhdp_monster_ranposu:core/tick/animation/event/anger/main
    # 麻痺
        execute if entity @s[tag=aj.ranposu_aj.animation.state_paralysis_start.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_start/main
        execute if entity @s[tag=aj.ranposu_aj.animation.state_paralysis.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis/main
        execute if entity @s[tag=aj.ranposu_aj.animation.state_paralysis_end.playing] run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_end/main

# 討伐
    # 通常
        execute if entity @s[tag=aj.ranposu_aj.animation.death.playing] run function mhdp_monster_ranposu:core/tick/animation/event/death/main
    # 空中
        execute if entity @s[tag=aj.ranposu_aj.animation.death_flying.playing] run function mhdp_monster_ranposu:core/tick/animation/event/death_flying/main

# 移動
    execute if entity @s[tag=aj.ranposu_aj.animation.move.playing] run function mhdp_monster_ranposu:core/tick/animation/event/move/main

# バックステップ
    execute if entity @s[tag=aj.ranposu_aj.animation.step_back.playing] run function mhdp_monster_ranposu:core/tick/animation/event/step_back/main

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
