#> mhdp_monster_valk:core/tick/animation/event/walk_relax/main
#
# アニメーションイベントハンドラ 移動 (未発見時)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 回転
    function mhdp_monsters:core/util/other/turn_by_value

# 移動
    execute at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.walk_relax.frame matches 1..11 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.walk_relax.frame matches 24..35 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.walk_relax.frame matches 11 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax.frame matches 11 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.walk_relax.frame matches 23 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.walk_relax.frame matches 35 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax.frame matches 35 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.walk_relax.frame matches 47 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.walk_relax.frame matches 47 if score @s Mns.General.WalkCount matches 1.. run scoreboard players remove @s Mns.General.WalkCount 1
    execute if score @s aj.walk_relax.frame matches 47 unless score @s Mns.General.WalkCount matches 1.. run function mhdp_monster_valk:core/tick/animation/event/walk_relax/end
