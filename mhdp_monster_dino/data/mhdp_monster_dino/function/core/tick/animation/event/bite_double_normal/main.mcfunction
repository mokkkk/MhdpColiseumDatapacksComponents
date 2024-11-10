#> mhdp_monster_dino:core/tick/animation/event/bite_double_normal/main
#
# アニメーションイベントハンドラ 2連嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.bite_double_normal.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/turn_start
    execute if score @s aj.bite_double_normal.frame matches 6 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/turn_start
    execute if score @s aj.bite_double_normal.frame matches 2..11 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.bite_double_normal.frame matches 1..17 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.bite_double_normal.frame matches 18..24 at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite_double_normal.frame matches 25..27 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.bite_double_normal.frame matches 28..32 at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite_double_normal.frame matches 46..55 at @s run tp @s ^ ^ ^0.05

# 効果音
    execute if score @s aj.bite_double_normal.frame matches 9 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.bite_double_normal.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.bite_double_normal.frame matches 55 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.bite_double_normal.frame matches 21 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.bite_double_normal.frame matches 28 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30

# 攻撃
    execute if score @s aj.bite_double_normal.frame matches 18..22 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/attack_head
    execute if score @s aj.bite_double_normal.frame matches 21 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/attack
    execute if score @s aj.bite_double_normal.frame matches 28..32 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/attack_head
    execute if score @s aj.bite_double_normal.frame matches 31 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
    execute if score @s aj.bite_double_normal.frame matches 10 run tag @s add Mns.Dino.State.Attack.Head
    execute if score @s aj.bite_double_normal.frame matches 35 run tag @s remove Mns.Dino.State.Attack.Head

# 終了
    execute if score @s aj.bite_double_normal.frame matches 78 run function mhdp_monster_dino:core/tick/animation/event/bite_double_normal/end
