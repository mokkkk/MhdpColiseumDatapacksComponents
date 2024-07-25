#> mhdp_monster_reus:core/tick/animation/event/land_damage_tail/main
#
# アニメーションイベントハンドラ 胴・足怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_damage_tail.frame matches 2..7 at @s run tp @s ^ ^ ^0.8 ~8 ~
    execute if score @s aj.land_damage_tail.frame matches 8..15 at @s run tp @s ^0.2 ^ ^0.3 ~8 ~
    execute if score @s aj.land_damage_tail.frame matches 16..27 at @s run tp @s ^0.2 ^ ^0.2 ~2 ~

    execute if score @s aj.land_damage_tail.frame matches 60..75 at @s run tp @s ^ ^ ^ ~4 ~

# 効果音
    execute if score @s aj.land_damage_tail.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_tail.frame matches 15..28 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.land_damage_tail.frame matches 15..28 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_tail.frame matches 60 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_tail.frame matches 5 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_tail.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_tail.frame matches 115 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_tail.frame matches 90..93 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_damage_tail.frame matches 116 run function mhdp_monster_reus:core/tick/animation/event/land_damage_tail/end
