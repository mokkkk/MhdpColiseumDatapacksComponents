#> mhdp_monster_dino:core/tick/animation/event/walk_relax/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 回転
    function mhdp_monsters:core/util/other/turn_by_value

# 移動
    execute if score @s aj.walk_relax.frame matches ..13 at @s run tp @s ^ ^ ^0.08
    execute if score @s aj.walk_relax.frame matches 14..23 at @s run tp @s ^ ^ ^0.2
    execute if score @s aj.walk_relax.frame matches 24..41 at @s run tp @s ^ ^ ^0.08
    execute if score @s aj.walk_relax.frame matches 41..50 at @s run tp @s ^ ^ ^0.2
    execute if score @s aj.walk_relax.frame matches 51.. at @s run tp @s ^ ^ ^0.08

# 効果音
    execute if score @s aj.walk_relax.frame matches 25 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax.frame matches 25 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.walk_relax.frame matches 55 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax.frame matches 55 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.walk_relax.frame matches 59 if score @s Mns.General.WalkCount matches 1.. run scoreboard players remove @s Mns.General.WalkCount 1
    execute if score @s aj.walk_relax.frame matches 59 unless score @s Mns.General.WalkCount matches 1.. run function mhdp_monster_dino:core/tick/animation/event/walk_relax/end
