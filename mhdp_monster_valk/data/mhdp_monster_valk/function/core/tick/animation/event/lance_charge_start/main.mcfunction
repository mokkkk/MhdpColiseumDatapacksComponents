#> mhdp_monster_valk:core/tick/animation/event/lance_charge_start/main
#
# アニメーションイベントハンドラ 龍気吸引・開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_charge_start.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_charge_start.frame matches 5 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    function mhdp_monster_valk:core/tick/animation/event/lance_charge_start/particle

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# モデル演出
    execute if score @s aj.lance_charge_start.frame matches 27 run function mhdp_monster_valk:core/util/models/chest_glow_start

# 肉質変化
    execute if score @s aj.lance_charge_start.frame matches 27 as @e[type=slime,tag=Mns.HitBox.Valk.Body0] run scoreboard players set @s Mns.Hitbox.PartId 9

# 終了
    execute if score @s aj.lance_charge_start.frame matches 28 run function mhdp_monster_valk:core/tick/animation/event/lance_charge_start/end
