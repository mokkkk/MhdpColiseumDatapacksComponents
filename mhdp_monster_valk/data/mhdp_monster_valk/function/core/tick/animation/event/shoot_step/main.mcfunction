#> mhdp_monster_valk:core/tick/animation/event/shoot_step/main
#
# アニメーションイベントハンドラ ステップ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_step.frame matches 2 at @s run function mhdp_monster_valk:core/tick/animation/event/shoot_step/turn_start
    execute if score @s aj.shoot_step.frame matches 2..12 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動（移動先マーカーが無い場合のフォールバックとして後退）
    execute if score @s aj.shoot_step.frame matches 2 unless entity @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run summon area_effect_cloud ^ ^ ^-8 {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute if score @s aj.shoot_step.frame matches 2 at @s run function mhdp_monsters:core/util/tick/event/vector_move_start.m {\
        TargetType:"area_effect_cloud",TargetTag:"Mns.MovePos.Valk",MaxDistance:30,Tick:11,OffsetX:0.0,OffsetY:0.0,OffsetZ:0.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.shoot_step.frame matches 2..12 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.shoot_step.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_step.frame matches 12 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_step.frame matches 12 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.shoot_step.frame matches 24 run function mhdp_monster_valk:core/tick/animation/event/shoot_step/end
