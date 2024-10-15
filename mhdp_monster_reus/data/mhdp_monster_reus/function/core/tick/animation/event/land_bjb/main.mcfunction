#> mhdp_monster_reus:core/tick/animation/event/land_bjb/main
#
# アニメーションイベントハンドラ バックジャンプブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.land_bjb.frame matches 2 run function mhdp_monster_reus:core/tick/animation/event/land_bjb/turn_start
    execute if score @s aj.land_bjb.frame matches 2..8 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.land_bjb.frame matches 15..18 at @s run tp @s ^ ^0.4 ^-0.7
    execute if score @s aj.land_bjb.frame matches 19..28 at @s run tp @s ^ ^0.1 ^-0.1

# 効果音
    execute if score @s aj.land_bjb.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_bjb.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_bjb.frame matches 15 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 20

# 攻撃
    execute if score @s aj.land_bjb.frame matches 14 run summon area_effect_cloud ^ ^ ^8 {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Reus"]}
    execute if score @s aj.land_bjb.frame matches 20 positioned ^ ^2.6 ^6 run function mhdp_monster_reus:core/tick/animation/event/land_bjb/shot

# 風圧怯み
    execute if score @s aj.land_bjb.frame matches 15 run data modify storage mhdp_core:temp Damage set value {WindValue:1,GuardValue:1}
    execute if score @s aj.land_bjb.frame matches 15 positioned ^ ^ ^2 as @a[tag=Ply.State.EnableDamage,distance=..4.5] facing entity @s feet positioned as @s run function mhdp_core:player/damage/wind/main
    execute if score @s aj.land_bjb.frame matches 15 run data remove storage mhdp_core:temp Damage

# 接地
    execute if score @s aj.land_bjb.frame matches ..14 at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.land_bjb.frame matches ..14 at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
    execute if score @s aj.land_bjb.frame matches 15 run tag @s add Mns.State.IsFlying
    execute if entity @s[tag=!Mns.Reus.State.Flying] if score @s aj.land_bjb.frame matches 15 run function mhdp_monster_reus:core/tick/animation/event/land_bjb/change_phase

# 終了
    execute if score @s aj.land_bjb.frame matches 33 run function mhdp_monster_reus:core/tick/animation/event/land_bjb/end
