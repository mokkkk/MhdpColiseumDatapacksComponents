#> mhdp_monster_reus:core/tick/animation/event/land_to_fly/main
#
# アニメーションイベントハンドラ 飛行開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
   execute if score @s aj.land_to_fly.frame matches 6..10 at @s run tp @s ^ ^0.5 ^0.4
   execute if score @s aj.land_to_fly.frame matches 11..16 at @s run tp @s ^ ^0.2 ^0.2

# 効果音
    execute if score @s aj.land_to_fly.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_to_fly.frame matches 6 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_to_fly.frame matches 6 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 20

# 風圧怯み
    execute if score @s aj.land_to_fly.frame matches 6 run data modify storage mhdp_core:temp Damage set value {WindValue:1,GuardValue:1}
    execute if score @s aj.land_to_fly.frame matches 6 positioned ^ ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..5.5] facing entity @s feet positioned as @s run function mhdp_core:player/damage/wind/main
    execute if score @s aj.land_to_fly.frame matches 6 run data remove storage mhdp_core:temp Damage

# 接地
    execute if score @s aj.land_to_fly.frame matches 1..6 at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.land_to_fly.frame matches 1..6 at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
    execute if score @s aj.land_to_fly.frame matches 6 run tag @s add Mns.State.IsFlying
    execute if entity @s[tag=!Mns.Reus.State.Flying] if score @s aj.land_to_fly.frame matches 6 run function mhdp_monster_reus:core/tick/animation/event/land_to_fly/change_phase

# 終了
    execute if score @s aj.land_to_fly.frame matches 21 run function mhdp_monster_reus:core/tick/animation/event/land_to_fly/end
