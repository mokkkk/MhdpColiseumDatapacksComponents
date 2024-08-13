#> mhdp_monster_dino:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_dino:core/tick/tick

# 待機
    execute if entity @s[tag=aj.dino_aj.animation.idle.playing] run function mhdp_monster_dino:core/tick/animation/event/idle/main

# 軸合わせ
    execute if entity @s[tag=aj.dino_aj.animation.turn_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_r/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_big_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_big_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_big_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_big_r/main

# 嚙みつき
    execute if entity @s[tag=aj.dino_aj.animation.bite.playing] run function mhdp_monster_dino:core/tick/animation/event/bite/main

# 2連嚙みつき
    execute if entity @s[tag=aj.dino_aj.animation.bite_double_normal.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/main
    execute if entity @s[tag=aj.dino_aj.animation.bite_double_anger.playing] run function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/main

# 尻尾攻撃
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_l/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_anger_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_attack_anger_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/main

# 尻尾攻撃・側面
    execute if entity @s[tag=aj.dino_aj.animation.tail_side_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_side_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/main

# 尻尾攻撃・背面
    execute if entity @s[tag=aj.dino_aj.animation.tail_back_r.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_back_r/main
    execute if entity @s[tag=aj.dino_aj.animation.tail_back_l.playing] run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/main

# 尻尾攻撃・飛びかかり
    execute if entity @s[tag=aj.dino_aj.animation.jump_tail_r.playing] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/main
