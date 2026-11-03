#> mhdp_monster_reus:core/tick/animation/event/land_bite_l/main
#
# アニメーションイベントハンドラ 噛みつき
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.land_bite_l.frame matches 2 run function mhdp_monster_reus:core/tick/animation/event/land_bite_l/turn_start
    execute if score @s aj.land_bite_l.frame matches 6 run function mhdp_monster_reus:core/tick/animation/event/land_bite_l/turn_start
    execute if score @s aj.land_bite_l.frame matches 2..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.land_bite_l.frame matches 1..5 if entity @n[tag=Mns.Target.Reus,distance=..7] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.land_bite_l.frame matches 6..10 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.land_bite_l.frame matches 18..23 unless entity @n[tag=Mns.Target.Reus,distance=..7] at @s run tp @s ^ ^ ^0.6
    execute if score @s aj.land_bite_l.frame matches 24..38 unless entity @n[tag=Mns.Target.Reus,distance=..7] at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.land_bite_l.frame matches 50..55 unless entity @n[tag=Mns.Target.Reus,distance=..7] at @s run tp @s ^ ^ ^0.6
    execute if score @s aj.land_bite_l.frame matches 56..70 unless entity @n[tag=Mns.Target.Reus,distance=..7] at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.land_bite_l.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_bite_l.frame matches 32 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_bite_l.frame matches 18..23 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_bite_l.frame matches 50..55 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_bite_l.frame matches 76 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    execute if score @s aj.land_bite_l.frame matches 22 rotated ~-5 ~ run function mhdp_monster_reus:core/tick/animation/event/land_bite_l/attack
    execute if score @s aj.land_bite_l.frame matches 54 rotated ~5 ~ run function mhdp_monster_reus:core/tick/animation/event/land_bite_l/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_bite_l.frame matches 104 run function mhdp_monster_reus:core/tick/animation/event/land_bite_l/end
