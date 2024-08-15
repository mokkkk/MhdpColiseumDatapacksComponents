#> mhdp_monster_dino:core/tick/animation/event/move/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute at @s run tp @s ^ ^ ^0.6

# 効果音
    execute if score @s aj.move.frame matches 12 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.move.frame matches 24 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle block{block_state:"minecraft:sand"} ^ ^0.5 ^ 0.7 0.1 0.7 0 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 遷移
    execute if entity @s[tag=!Mns.Dino.Temp.ToBite] positioned ^ ^ ^5 if entity @n[tag=Mns.Target.Dino,distance=..9] positioned as @s run function mhdp_monster_dino:core/tick/animation/event/move/change
    execute if entity @s[tag=Mns.Dino.Temp.ToBite] positioned ^ ^ ^7 if entity @n[tag=Mns.Target.Dino,distance=..7] positioned as @s run function mhdp_monster_dino:core/tick/animation/event/move/change

# 終了
    execute if score @s aj.move.frame matches 24 run function mhdp_monster_dino:core/tick/animation/event/move/end
