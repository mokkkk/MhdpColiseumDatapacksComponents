#> mhdp_monster_reus:core/tick/animation/event/land_jump/main
#
# アニメーションイベントハンドラ 床ドン
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動

# 効果音
    execute if score @s aj.land_jump.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_jump.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_jump.frame matches 15 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30
    execute if score @s aj.land_jump.frame matches 60 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_jump.frame matches 61..63 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.land_jump.frame matches 33 rotated ~-8 ~ run function mhdp_monster_reus:core/tick/animation/event/land_jump/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
    execute if score @s aj.land_jump.frame matches 15 run tag @s add Mns.State.IsFlying
    execute if score @s aj.land_jump.frame matches 33 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.land_jump.frame matches 97 run function mhdp_monster_reus:core/tick/animation/event/land_jump/end
