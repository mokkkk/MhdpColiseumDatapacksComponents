#> mhdp_monster_reus:core/tick/animation/event/land_damage_back/main
#
# アニメーションイベントハンドラ 胴・足怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_damage_back.frame matches 2..7 at @s run tp @s ^ ^ ^0.4 ~8 ~
    execute if score @s aj.land_damage_back.frame matches 8..15 at @s run tp @s ^ ^ ^0.2 ~8 ~
    execute if score @s aj.land_damage_back.frame matches 28..36 at @s run tp @s ^ ^ ^ ~4 ~
    execute if score @s aj.land_damage_back.frame matches 50..58 at @s run tp @s ^ ^ ^ ~4 ~

# 効果音
    execute if score @s aj.land_damage_back.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_back.frame matches 2..11 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.land_damage_back.frame matches 5 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_back.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_back.frame matches 30..33 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.land_damage_back.frame matches 50..52 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_damage_back.frame matches 64 run function mhdp_monster_reus:core/tick/animation/event/land_damage_back/end
