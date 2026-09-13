#> mhdp_monster_valk:core/tick/animation/event/lance_move/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute at @s run tag @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] add Temp.Rotate.Target
    execute at @s run function mhdp_monsters:core/util/tick/event/turn_to_target_accurate

# 移動
    execute at @s run tp @s ^ ^ ^1

# 効果音
    execute if score @s aj.lance_move.frame matches 11 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_move.frame matches 14 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 2

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 移動対象にある程度近づいた場合、または対象が見つからない場合終了
    execute if entity @n[type=area_effect_cloud,tag=Mns.MovePos.Valk,distance=..4] run return run function mhdp_monster_valk:core/tick/animation/event/lance_move/end
    execute unless entity @n[type=area_effect_cloud,tag=Mns.MovePos.Valk,distance=..64] run return run function mhdp_monster_valk:core/tick/animation/event/lance_move/end
