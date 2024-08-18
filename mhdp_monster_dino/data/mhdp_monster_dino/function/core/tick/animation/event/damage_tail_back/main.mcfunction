#> mhdp_monster_dino:core/tick/animation/event/damage_tail_back/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_tail_back.frame matches 2..8 at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.damage_tail_back.frame matches 9..16 at @s run tp @s ^ ^ ^0.2
    # execute if score @s aj.damage_tail_back.frame matches 9..18 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.damage_tail_back.frame matches 37..48 at @s run tp @s ^0.15 ^ ^-0.1 ~8 ~
    execute if score @s aj.damage_tail_back.frame matches 49..59 at @s run tp @s ^ ^ ^-0.1 ~6 ~

# 効果音
    execute if score @s aj.damage_tail_back.frame matches 2..4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_tail_back.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_tail_back.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.damage_tail_back.frame matches 18 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.damage_tail_back.frame matches 37 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_tail_back.frame matches 59 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.damage_tail_back.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_tail_back.frame matches 18 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.damage_tail_back.frame matches 59 run function mhdp_monster_dino:core/tick/animation/event/damage_tail_back/end
