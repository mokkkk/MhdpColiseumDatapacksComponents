#> mhdp_monster_dino:core/tick/animation/event/turn_bite_r/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.turn_bite_r.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/turn_bite_r/turn_start
    execute if score @s aj.turn_bite_r.frame matches 10..16 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.turn_bite_r.frame matches 1..9 if entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^-0.15

# 攻撃
    execute if score @s aj.turn_bite_r.frame matches 16 run function mhdp_monster_dino:core/tick/animation/event/turn_bite_r/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.turn_bite_r.frame matches 29 run function mhdp_monster_dino:core/tick/animation/event/turn_bite_r/end
