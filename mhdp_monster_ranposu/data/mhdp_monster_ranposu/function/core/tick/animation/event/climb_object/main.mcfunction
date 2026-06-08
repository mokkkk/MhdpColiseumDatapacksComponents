#> mhdp_monster_ranposu:core/tick/animation/event/climb_object/main
#
# アニメーションイベントハンドラ 急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動対象の決定
    execute if score @s aj.climb_object.frame matches 2 positioned ^ ^ ^3 run tag @n[type=item_display,tag=Asset.Build.Root] add Asset.Build.Temp.MoveTarget
    execute if score @s aj.climb_object.frame matches 2 as @n[type=item_display,tag=Asset.Build.Root,tag=Asset.Build.Temp.MoveTarget] run scoreboard players add @s Build.Stats.RemainingTime 100

# 軸合わせ
    execute if score @s aj.climb_object.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Asset.Build.Temp.MoveTarget",Tick:4,MaxRotation:999}
    execute if score @s aj.climb_object.frame matches 2..5 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.climb_object.frame matches 2 run tag @n[type=item_display,tag=Asset.Build.Root,tag=Asset.Build.Temp.MoveTarget] remove Asset.Build.Temp.MoveTarget

# 移動
    execute if score @s aj.climb_object.frame matches 5 at @s positioned ^ ^ ^3 run function mhdp_monsters:core/util/tick/event/vector_move_climb_build_start.m {\
        TargetType:"item_display",TargetTag:"Asset.Build.Root",MaxDistance:15,Tick:14,OffsetX:0.0,OffsetZ:0.0,IsAdjustLand:"false"\
    }
    execute if score @s aj.climb_object.frame matches 6..19 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.climb_object.frame matches 5 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.climb_object.frame matches 5 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.climb_object.frame matches 19 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.climb_object.frame matches 19 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute if score @s aj.climb_object.frame matches 1..5 run function mhdp_monsters:core/util/tick/move/check_landing

# 状態
    execute if score @s aj.climb_object.frame matches 2 run tag @s add Mns.State.OnObject
    execute if score @s aj.climb_object.frame matches 5 run tag @s add Mns.State.IsFlying
    execute if score @s aj.climb_object.frame matches 19 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.climb_object.frame matches 30 run function mhdp_monster_ranposu:core/tick/animation/event/climb_object/end
