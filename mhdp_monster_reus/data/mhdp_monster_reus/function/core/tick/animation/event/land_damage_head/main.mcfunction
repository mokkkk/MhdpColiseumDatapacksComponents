#> mhdp_monster_reus:core/tick/animation/event/land_damage_head/main
#
# アニメーションイベントハンドラ 頭怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_damage_head.frame matches 2..12 at @s run tp @s ^ ^ ^-0.4
    execute if score @s aj.land_damage_head.frame matches 13..20 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.land_damage_head.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_head.frame matches 12 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.land_damage_head.frame matches 12 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_head.frame matches 19 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.land_damage_head.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_head.frame matches 30 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_head.frame matches 45 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_damage_head.frame matches 59 run function mhdp_monster_reus:core/tick/animation/event/land_damage_head/end
