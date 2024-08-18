#> mhdp_monster_reus:core/tick/animation/event/land_after_attack/main
#
# アニメーションイベントハンドラ 攻撃後後隙
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_after_attack.frame matches 15..19 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.land_after_attack.frame matches 42..46 at @s run tp @s ^ ^ ^-0.1

# 演出
    execute if score @s aj.land_after_attack.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_after_attack.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_after_attack.frame matches 43 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_after_attack.frame matches 24..28 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.ravager.attack master @s ^ ^1 ^1 0.4 0.7 0.4

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_after_attack.frame matches 56 run function mhdp_monster_reus:core/tick/animation/event/land_after_attack/end
