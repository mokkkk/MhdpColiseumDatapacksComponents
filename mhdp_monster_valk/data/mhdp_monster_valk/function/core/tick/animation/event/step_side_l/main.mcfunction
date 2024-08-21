#> mhdp_monster_dino:core/tick/animation/event/step_side_l/main
#
# アニメーションイベントハンドラ サイドステップ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.step_side_l.frame matches 6..20 at @s run tp @s ^0.7 ^ ^0.2

# 効果音
    execute if score @s aj.step_side_l.frame matches 6 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_side_l.frame matches 6 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.step_side_l.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.step_side_l.frame matches 20 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.step_side_l.frame matches 27 run function mhdp_monster_dino:core/tick/animation/event/step_side_l/end
