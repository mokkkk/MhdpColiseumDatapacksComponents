#> mhdp_monster_reus:core/tick/animation/event/land_dash/main
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    tp @s ^ ^ ^0.6

# 演出
    execute if score @s aj.land_dash.frame matches 2 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_dash.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    particle block{block_state:"minecraft:sand"} ^ ^0.6 ^ 0.7 0.1 0.7 0 1

# 攻撃
    function mhdp_monster_reus:core/tick/animation/event/land_dash/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_dash.frame matches 21 run function mhdp_monster_reus:core/tick/animation/event/land_dash/end
