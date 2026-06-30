#> mhdp_monster_dino:core/tick/animation/event/walk_relax_stop/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.walk_relax_stop.frame matches ..13 at @s run tp @s ^ ^ ^0.08

# 効果音
    execute if score @s aj.walk_relax_stop.frame matches 5 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax_stop.frame matches 5 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.walk_relax_stop.frame matches 17 unless score @s Mns.General.WalkCount matches 1.. run function mhdp_monster_dino:core/tick/animation/event/walk_relax_stop/end
