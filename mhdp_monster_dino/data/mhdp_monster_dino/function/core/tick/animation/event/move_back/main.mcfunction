#> mhdp_monster_dino:core/tick/animation/event/move_back/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.move_back.frame matches 1..10 at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.move_back.frame matches 11..15 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.move_back.frame matches 6 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.move_back.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle block{block_state:"minecraft:sand"} ^ ^0.5 ^ 0.7 0.1 0.7 0 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.move_back.frame matches 21 run function mhdp_monster_dino:core/tick/animation/event/move/end
