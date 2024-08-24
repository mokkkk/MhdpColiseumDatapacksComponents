#> mhdp_monster_reus:core/tick/animation/event/land_chargebite/main
#
# アニメーションイベントハンドラ チャージ嚙みつき
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.land_chargebite.frame matches 1..38 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.land_chargebite.frame matches 1..38 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.land_chargebite.frame matches 1..10 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.land_chargebite.frame matches 43..53 unless entity @n[tag=Mns.Target.Reus,distance=..8] at @s run tp @s ^ ^ ^0.8

# 演出
    execute if score @s aj.land_chargebite.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_chargebite.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_chargebite.frame matches 74 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_chargebite.frame matches 10..53 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/land_chargebite/head_effect with entity @s data.locators.pos_head

# 攻撃
    execute if score @s aj.land_chargebite.frame matches 54 run function mhdp_monster_reus:core/tick/animation/event/land_chargebite/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_chargebite.frame matches 95 run function mhdp_monster_reus:core/tick/animation/event/land_chargebite/end
