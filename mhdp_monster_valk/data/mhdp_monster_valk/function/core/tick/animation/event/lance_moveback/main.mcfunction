#> mhdp_monster_valk:core/tick/animation/event/lance_moveback/main
#
# アニメーションイベントハンドラ 車庫入れ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_moveback.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:14,MaxRotation:360}
    execute if score @s aj.lance_moveback.frame matches 2..15 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.lance_moveback.frame matches 2..15 at @s run tp @s ^ ^ ^-0.4
    execute if score @s aj.lance_moveback.frame matches 16..22 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.lance_moveback.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_moveback.frame matches 8 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_moveback.frame matches 2..15 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 2

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_moveback.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/lance_moveback/end
