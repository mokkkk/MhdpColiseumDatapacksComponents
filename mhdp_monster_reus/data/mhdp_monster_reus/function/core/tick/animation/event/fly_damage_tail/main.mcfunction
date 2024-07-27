#> mhdp_monster_reus:core/tick/animation/event/fly_damage_tail/main
#
# アニメーションイベントハンドラ 飛行中ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.fly_damage_tail.frame matches 2 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_damage_tail/move_start
    execute if score @s aj.fly_damage_tail.frame matches 2..16 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s aj.fly_damage_tail.frame matches 2..16 at @s run tp @s ^ ^ ^ ~-3 ~
    execute if score @s aj.fly_damage_tail.frame matches 17..30 at @s run tp @s ^-0.2 ^ ^0.3 ~-2 ~
    execute if score @s aj.fly_damage_tail.frame matches 31..40 at @s run tp @s ^-0.1 ^ ^0.1 ~-1 ~
    execute if score @s aj.fly_damage_tail.frame matches 81..95 at @s run tp @s ^ ^ ^ ~-6 ~

# 演出
    execute if score @s aj.fly_damage_tail.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.fly_damage_tail.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.fly_damage_tail.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_tail.frame matches 16 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30
    execute if score @s aj.fly_damage_tail.frame matches 17..30 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.fly_damage_tail.frame matches 17..30 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_tail.frame matches 60 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_tail.frame matches 81 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_tail.frame matches 111..114 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.fly_damage_tail.frame matches 136 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute if score @s aj.fly_damage_tail.frame matches 16.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_damage_tail.frame matches 16.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.fly_damage_tail.frame matches 16 run tag @s remove Mns.State.IsFlying
    execute if score @s aj.fly_damage_tail.frame matches 16 run tag @s remove Mns.Reus.State.Flying

# 終了
    execute if score @s aj.fly_damage_tail.frame matches 136 run function mhdp_monster_reus:core/tick/animation/event/fly_damage_tail/end
