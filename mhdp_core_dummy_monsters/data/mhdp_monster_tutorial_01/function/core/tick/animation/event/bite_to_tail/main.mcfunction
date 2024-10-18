#> mhdp_monster_dino:core/tick/animation/event/bite_to_tail/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.bite_to_tail.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/turn_start
    execute if score @s aj.bite_to_tail.frame matches 6 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/turn_start
    execute if score @s aj.bite_to_tail.frame matches 1..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.bite_to_tail.frame matches 34 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/turn_start
    execute if score @s aj.bite_to_tail.frame matches 40 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/turn_start
    execute if score @s aj.bite_to_tail.frame matches 34..44 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.bite_to_tail.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.bite_to_tail.frame matches 6..10 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.bite_to_tail.frame matches 20..25 unless entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite_to_tail.frame matches 34..40 if entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^-0.5

# 効果音
    execute if score @s aj.bite_to_tail.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite_to_tail.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite_to_tail.frame matches 25 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.bite_to_tail.frame matches 66..70 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.bite_to_tail.frame matches 66..70 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.bite_to_tail.frame matches 66..67 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.bite_to_tail.frame matches 66..67 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.bite_to_tail.frame matches 109 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.bite_to_tail.frame matches 22..27 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_head
    execute if score @s aj.bite_to_tail.frame matches 25 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_0
    execute if score @s aj.bite_to_tail.frame matches 50..58 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_tail
    execute if score @s aj.bite_to_tail.frame matches 57 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.bite_to_tail.frame matches 57 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.bite_to_tail.frame matches 138 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/end
